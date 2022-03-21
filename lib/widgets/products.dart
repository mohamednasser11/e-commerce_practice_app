// ignore_for_file: avoid_types_as_parameter_names

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/cart.dart';


class buildNewProducts extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String image;
  final double price;
  const buildNewProducts({ Key? key,
  required this.name,required this.price,required this.image,
   }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
              child: Consumer<Cart>(builder: (context, cart, child){
                return Container(
                      height:230,
                        width: MediaQuery.of(context).size.width*0.6,                        
                        child: Column(
                            children: [
                              Container(
                                height: 160,
                                width: 130,
                                decoration: BoxDecoration(
                                image: DecorationImage(image: AssetImage('images/$image')),
                                ),
                              ),
                               Text('\EGP $price'),
                               Text('$name', style: TextStyle(fontWeight: FontWeight.bold),),
                               Container(
                                 margin: EdgeInsets.fromLTRB(0.0, 0.0, 20.0, 0),
                                 child: Row(
                                   mainAxisAlignment: MainAxisAlignment.end,
                                   children: [
                                     IconButton(
                                       onPressed: (){
                                         
                                       },
                                       icon:Icon(Icons.add_circle_outline),
                                       
                                     ),
                                   ],
                                 ),
                               ),
                            ],
                          ),
                        );
              }, 
              ),);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromWidth(150);
}


