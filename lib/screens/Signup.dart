// ignore_for_file: file_names, prefer_const_constructors, unused_element

import 'package:final_project/services/auth.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  _SignupState createState() => _SignupState();
}

final GlobalKey<FormState> _formkey = GlobalKey<FormState>();
final TextEditingController passController = TextEditingController();
final TextEditingController confPassController = TextEditingController();
String p =
    r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
RegExp regExp = RegExp(p);
bool obserText = true;

validation() async {
  final FormState? _form = _formkey.currentState;
  if (_form!.validate()) {
    print('Yes');
  }
   else {
      print('No');
  }
}
final auth = Auth();

class _SignupState extends State<Signup> {
    late String _email,_password;
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
                height: 400,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text(
                      'Sign up',
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    TextFormField(
                      onSaved: (value){
                          _email = value!;
                      },
                      validator: (value) {
                        if (value == "") {
                          return 'Please Enter Your Email';
                        } else if (!regExp.hasMatch(value!)) {
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
                      controller: passController,
                      obscureText: obserText,
                      onSaved: (value){
                          _password = value!;
                      },
                      validator: (value) {
                        if (value == "") {
                          return "Please Enter Password";
                        } else if (value!.length < 8) {
                          return "Password is too short";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Password',
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              obserText = !obserText;
                            });
                          },
                          child: Icon(
                            obserText == true
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.black,
                          ),
                        ),
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    TextFormField(
                      controller: confPassController,
                      obscureText: obserText,
                      validator: (value) {
                        if (confPassController.text != passController.text) {
                          return "These passwords are not matching";
                        }
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Confirm Password',
                        hintStyle: TextStyle(color: Colors.black),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async{
                            validation();
                            if (_formkey.currentState!.validate()) {
                              _formkey.currentState!.save();
                              print(_email);
                              print(_password);
                              final authResult =  auth.signUp(_email, _password);
                              print(authResult);
                              Navigator.pushReplacementNamed(context, '/login');
                            } else {
                              print('NOTVALID');
                            }
                          },
                          child: Text('Signup'),
                          style: ElevatedButton.styleFrom(
                            primary: Colors.blueAccent,
                          )),
                    ),
                    Row(
                      children: [
                        Text('Already have an account !'),
                        SizedBox(
                          width: 10,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacementNamed(context, '/login');
                          },
                          child: Text(
                            'Login',
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
