// ignore: file_names
// ignore_for_file: camel_case_types, file_names, unused_import, prefer_const_constructors


import 'package:final_project/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart.dart';

class myAppBar extends StatelessWidget implements PreferredSizeWidget {
final String title;
final Color backgroundColor;

  const myAppBar({ Key? key, required this.title,required this.backgroundColor }) : super(key: key);
  @override
  
  Widget build(BuildContext context) {
    return AppBar(
        title: Center(child: Text('${title}',style: TextStyle(color: Colors.black),)),
        backgroundColor: Colors.white,
        elevation: 0.0,
        leading: IconButton(onPressed: (){
          Scaffold.of(context).openDrawer();
        }, icon: const Icon(Icons.menu, color: Colors.black)),
        actions: <Widget>[
          // IconButton(onPressed: (){}, icon: Icon(Icons.search_rounded,color: Colors.black),),
          Row(
            children: <Widget> [
               IconButton(
              onPressed: (){
                Navigator.pushNamed(context, '/cart');
              }, 
              icon: Icon(Icons.shopping_cart,color: Colors.black),),
               Padding(
                 padding: EdgeInsets.all(10),
                  child: Consumer<Cart>(builder: (context, cart, child){
                    return Text('${cart.count}',style: TextStyle(
                      color: Colors.black,
                    ),);
            },
            ),
            
               ),


            ],
            ),
           
        ],
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(40.0);

}