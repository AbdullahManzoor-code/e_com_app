import 'package:e_com_app/pages/bottom_navigation.dart';
import 'package:e_com_app/pages/cart.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CartPage extends StatelessWidget {
  static String id = "/cartpage";

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
      builder: (BuildContext context, value, Widget? child) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, BottomNavigation.id);
                },
                icon: Icon(Icons.arrow_back)),
            backgroundColor: Colors.black,
            title: const Center(child: Text("CART")),
            foregroundColor: Colors.white,
          ),
          body: ListView.builder(
            itemCount: value.Cartlist.length,
            itemBuilder: (BuildContext context, int index) {
              return Slidable(
                endActionPane:
                    ActionPane(motion: const StretchMotion(), children: [
                  SlidableAction(
                    onPressed: (b) {
                      value.removefromcart(index);
                    },
                    icon: Icons.delete,
                  )
                ]),
                child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(25)),
                  child: ListTile(
                    leading: CircleAvatar(
                      child: Image.asset(value.Cartlist[index].imageurl),
                    ),
                    title: Text(value.Cartlist[index].name),
                    trailing: Text(value.Cartlist[index].price.toString()),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
