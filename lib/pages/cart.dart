import 'package:e_com_app/model/shoe_model.dart';
import 'package:flutter/material.dart';

class Cart extends ChangeNotifier {
  List<Shoe> Cartlist = [];
  bool isdark = false;
  List<Shoe> shoes = [
    Shoe(
      name: 'Sneaker Model 1',
      price: 59.99,
      imageurl: 'assets/shoe3.png',
      description:
          'Comfortable and stylish sneakers perfect for everyday wear.',
    ),
    Shoe(
      name: 'Sneaker Model 2',
      price: 69.99,
      imageurl: 'assets/shoe1.png',
      description: 'High-performance sneakers with excellent support and grip.',
    ),
    Shoe(
      name: 'Sneaker Model 3',
      price: 79.99,
      imageurl: 'assets/shoe2.png',
      description:
          'Sleek design with a modern touch, ideal for casual outings.',
    ),
    Shoe(
      name: 'Sneaker Model 4',
      price: 89.99,
      imageurl: 'assets/shoe3.png',
      description: 'Lightweight and breathable sneakers for maximum comfort.',
    ),
  ];

  addtocart(Shoe shoe) {
    Cartlist.add(shoe);
    notifyListeners();
  }

  toggletheme() {
    isdark = !isdark;
    notifyListeners();
  }

  removefromcart(int index) {
    Cartlist.removeAt(index);
    notifyListeners();
  }
}
