import 'package:final_project/model/cart.dart';
import 'package:final_project/screens/About.dart';
import 'package:final_project/screens/Signin.dart';
import 'package:final_project/screens/Signup.dart';
import 'package:final_project/screens/cartPage.dart';
import 'package:final_project/screens/fruitsSection.dart';
import 'package:final_project/screens/homePage.dart';
import 'package:final_project/screens/vegeSection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  // ignore: prefer_const_constructors
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: const FirebaseOptions(
          apiKey: 'AIzaSyCjhMBliNDE3qrO68cHuLprFRwGGFGg6Yc',
          appId: '1:1039079186238:android:6b4ad6b0b9c8f99856166f',
          messagingSenderId: '1039079186238',
          projectId: 'ecomapp-82201'));
  runApp(const MyApp());
}

// ignore: camel_case_types
class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) {
        return Cart();
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/login',
        routes: {
          '/home': (context) => const Homepage(),
          '/fruits': (context) => const FruitSection(),
          '/vege': (context) => const VegeSection(),
          '/cart': (context) => const CartPage(),
          '/about': (context) => const AboutApp(),
          '/login': (context) => const Signup(),
          '/signup': (context) => const Signin(),
        },
      ),
    );
  }
}
