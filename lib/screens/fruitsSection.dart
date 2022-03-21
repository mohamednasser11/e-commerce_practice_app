// ignore_for_file: prefer_const_constructors, file_names, camel_case_types, prefer_const_literals_to_create_immutables

import 'package:final_project/model/cart.dart';
import 'package:final_project/model/items.dart';
import 'package:final_project/widgets/myAppBar.dart';
import 'package:final_project/widgets/myDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class FruitSection extends StatefulWidget {
  const FruitSection({Key? key}) : super(key: key);

  @override
  _FruitSectionState createState() => _FruitSectionState();
}

class _FruitSectionState extends State<FruitSection> {
  final List<Items> bundels = [
    Items(
      name: 'veges collection',
      price: 75,
      photo: 'veges.png',
    ),
    Items(
      name: 'Our collection',
      price: 125,
      photo: 'veges.png',
    ),
  ];

  final List<Items> newitems = [
    Items(name: 'apples', price: 18, photo: 'images/apples.png'),
    Items(name: 'Tangerine', price: 18, photo: 'images/tangerine.jpg'),
    Items(name: 'Pomegranate', price: 18, photo: 'images/pomegranate.png'),
    Items(name: 'Grapes', price: 18, photo: 'images/red-grapes.png'),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: myDrawer(
      ),
      appBar: myAppBar(title: 'Fruits', backgroundColor: Colors.white),
      body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10),
          child: ListView.builder(
              itemCount: newitems.length,
              itemBuilder: (context, index) {
                return Card(
                  child: Consumer<Cart>(
                    builder: (context, cart, child) {
                      return Container(
                        height: 250,
                        width: MediaQuery.of(context).size.width * 0.5,
                        margin: EdgeInsets.fromLTRB(0, 20, 0, 10),
                        child: Column(
                          children: [
                            Container(
                              height: 160,
                              width: 130,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                    image:
                                        AssetImage('${newitems[index].photo}')),
                              ),
                            ),
                            Text('\EGP ${newitems[index].price}'),
                            Text(
                              '${newitems[index].name}',
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                            Container(
                              margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      cart.add(newitems[index]);
                                    },
                                    icon: Icon(Icons.add_circle_outline),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                );
              })),
    );
  }
}
