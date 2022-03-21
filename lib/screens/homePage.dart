// ignore_for_file: camel_case_types, file_names, prefer_const_literals_to_create_immutables, prefer_const_constructors, dead_code
import 'package:final_project/widgets/myDrawer.dart';
import '../model/catagories.dart';
import 'package:final_project/widgets/myAppBar.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({ Key? key }) : super(key: key);
  
  @override
  _HomepageState createState() => _HomepageState();
}


class _HomepageState extends State<Homepage> {
  List<Catagories> mainCata = [
    Catagories('Fruits', 'images/fruits.png','/fruits'),
    Catagories('Vegetables', 'images/veges.png','/vege')
  ];

    

  DateTime pre_backpress = DateTime.now();

  @override
  Widget build(BuildContext context) {

    return WillPopScope(
      onWillPop:() async{
       DateTime now = DateTime.now();

                      
       bool backPress = pre_backpress == null || now.difference(pre_backpress)> Duration(seconds: 2);

       if(DrawerController == false || backPress){
         pre_backpress = now;
         final snack = SnackBar(content: Text('press back again..'),duration: Duration(seconds: 2),);
         ScaffoldMessenger.of(context).showSnackBar(snack);
         return false;
       }else{
         return true;
       }

      },
      child: Scaffold(
        drawer: myDrawer(
        ),
         appBar: myAppBar(
           title: 'Home',
           backgroundColor: Colors.white,
         ),
        body: Column(
          children: [
              Container(
                height: 100.0,
                width: double.infinity,
                child:Container(
                  color: Colors.amberAccent,
                  child: Center(child:Text('Select your catagory..',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold)),)), 
              ),
              Expanded(
                child:ListView.builder(
                itemCount:mainCata.length,
                itemBuilder: (context,index){
                  return Card(
                    child: ListTile(
                      onTap: (){
                        Navigator.pushNamed(context, mainCata[index].location);
                      },
                      title: Text(mainCata[index].name),
                      leading: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage: AssetImage(mainCata[index].photo),
    
                  ),
                ),
              );
            }), ) ,
          ],
        ),
       
      ),
    );
  }
}