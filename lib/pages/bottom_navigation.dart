import 'package:e_com_app/pages/shop.dart';
import 'package:flutter/material.dart';

import 'cart_page.dart';

class BottomNavigation extends StatefulWidget {
  static String id = "/navigation";

  const BottomNavigation({Key? key}) : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  int _selectedIndex = 0; // State variable to track selected index

  final List<Widget> _pages = [
    ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the selected page
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(30.0),
          topRight: Radius.circular(30.0),
        ),
        child: BottomNavigationBar(
          onTap: (value) {
            setState(() {
              _selectedIndex = value; // Update selected index on tap
            });
          },
          currentIndex: _selectedIndex, // Set current index for active tab
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          backgroundColor: Colors.black,
          selectedFontSize: 14,
          unselectedFontSize: 12,
          elevation: 10,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_cart),
              label: 'Cart',
            ),
          ],
        ),
      ),
    );
  }
}
