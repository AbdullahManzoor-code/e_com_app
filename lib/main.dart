import 'package:e_com_app/pages/bottom_navigation.dart';
import 'package:e_com_app/pages/cart.dart';
import 'package:e_com_app/pages/cart_page.dart';
import 'package:e_com_app/pages/intro.dart';
import 'package:e_com_app/pages/shop.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => Cart(),
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: Provider.of<Cart>(context).isdark
            ? ThemeData.dark(
                useMaterial3: true,
              )
            : ThemeData.light(useMaterial3: true),
        home: const Intropage(),
        routes: {
          Intropage.id: (context) => const Intropage(),
          ShopPage.id: (context) => ShopPage(),
          CartPage.id: (context) => const CartPage(),
          BottomNavigation.id: (context) => const BottomNavigation()
        },
      ),
    );
  }
}
