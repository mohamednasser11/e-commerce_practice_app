// ignore_for_file: camel_case_types, file_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:final_project/services/auth.dart';
import 'package:flutter/material.dart';


class Signin extends StatefulWidget {
  const Signin({Key? key}) : super(key: key);

  @override
  _SigninState createState() => _SigninState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();

  String p = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regExp =  RegExp(p);
  bool obserText = true;
  validation(){
    final FormState? _form = _formkey.currentState;
    if(_form!.validate()){
      print('Yes');
    }else{
      print('No');
    }
  }
final auth = Auth();
late String _email,_pass;
class _SigninState extends State<Signin> {
  

  @override
  void initState() {

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Log in',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      onSaved:(value){
                        _email = value!;
                      },
                      validator: (value){
                        if(value ==""){
                          return 'Please Enter Your Email';
                       }else if(!regExp.hasMatch(value!)){
                         return 'invalid';
                       }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      onSaved:(value){
                        _pass = value!;
                      },
                      obscureText: obserText,
                      validator: (value){
                        if(value == ""){
                          return "Please Enter Password";
                        }else if(value!.length < 8){
                          return "Password is too short";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: (){
                            setState(() {
                              obserText =!obserText;
                            });
                          },
                          child: Icon(obserText==true?
                            Icons.visibility:Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async{
                            if(_formkey.currentState!.validate()){
                              _formkey.currentState!.save();
                              final user = await auth.signin(_email, _pass);
                            Navigator.pushReplacementNamed(context, '/home');
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("This user doesn't exist")));
                            }
                          },
                          child: Text('Login'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          )),
                    ),
                    Row(
                      children: [
                        Text('Dont have an account !'),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                             Navigator.pushReplacementNamed(context, '/signup');
                          },
                          child: Text(
                            'Signup',
                            style: TextStyle(color: Colors.blueAccent),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
