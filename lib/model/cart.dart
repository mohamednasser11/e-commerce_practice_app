import 'package:final_project/model/items.dart';
import 'package:flutter/material.dart';


class Cart with ChangeNotifier{
  List<Items> cartitems =[];
  double price = 0.0;
 
  void add(Items item){
    cartitems.add(item);
    price += item.price;
    notifyListeners();
  }
   void remove(Items item){
    cartitems.remove(item);
    price -= item.price;
    notifyListeners();
  }
  int get count {
    return cartitems.length;
  }
  
  double get totalPrice {
    return price;
  }
  List<Items> get checkoutItems {
    return cartitems;
  }
}