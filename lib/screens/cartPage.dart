// ignore_for_file: file_names, camel_case_types, prefer_const_constructors
import 'package:final_project/model/cart.dart';
import 'package:provider/provider.dart ';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          foregroundColor: Colors.black,
          elevation: 0.0,
        ),
        body: Consumer<Cart>(builder: (context, cart, child) {
          return cart.checkoutItems.isEmpty?Center(child: Text('Cart is Empty')):Column(
            children: [
              Container(
                height:MediaQuery.of(context).size.height*0.75,
                child: ListView.builder(
                    itemCount: cart.checkoutItems.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: ListTile(
                            title: Text('${cart.checkoutItems[index].name}'),
                            trailing: IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () {
                                cart.remove(cart.checkoutItems[index]);
                              },
                            )),
                      );
                    }),
              ),
              ElevatedButton(
                onPressed: (){
                  
                },
                child: Text('Press to CheckOut Price = ${cart.totalPrice}'),
                style: ElevatedButton.styleFrom(
                  fixedSize: Size(MediaQuery.of(context).size.width *0.9, MediaQuery.of(context).size.height *0.1 )
                ),
                ),
            ],
          );
        }));
  }
}
