import 'package:e_com_app/model/shoe_model.dart';
import 'package:e_com_app/pages/cart.dart';
import 'package:e_com_app/pages/cart_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatefulWidget {
  static String id = "/shoppage";

  @override
  State<ShopPage> createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return Consumer<Cart>(
      builder: (context, ref, child) {
        return Scaffold(
          appBar: AppBar(
            actions: [
              IconButton(
                onPressed: () {
                  ref.toggletheme();
                },
                icon: ref.isdark
                    ? const Icon(Icons.dark_mode)
                    : const Icon(Icons.light_mode),
              )
            ],
            title: const Text("Shop"),
          ),
          drawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: <Widget>[
                const DrawerHeader(
                  decoration: BoxDecoration(
                    color: Colors.black,
                  ),
                  child: Center(
                    child: Text(
                      'CART APP',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                ListTile(
                  title: const Text('HOME'),
                  leading: const Icon(Icons.home),
                  onTap: () {
                    Navigator.pushNamed(context, ShopPage.id);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('CART'),
                  onTap: () {
                    Navigator.pushNamed(context, CartPage.id);
                  },
                ),
                ListTile(
                  leading: const Icon(Icons.shopping_cart),
                  title: const Text('Theme'),
                  onTap: () {
                    ref.toggletheme();
                  },
                ),
              ],
            ),
          ),
          body: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: TextField(
                    controller: TextEditingController(),
                    decoration: InputDecoration(
                      hintText: "Search here....",
                      suffixIcon: const Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Text("Everyone flies .. some fly longer"),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Hot Picks 🔥",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("See all"),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenSize.height * 0.34, // Define a fixed height
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: Provider.of<Cart>(context).shoes.length,
                    itemBuilder: (BuildContext context, int index) {
                      var shoe = Provider.of<Cart>(context).shoes[index];
                      return Itemswidget(shoe: shoe);
                    },
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Hot Picks 🔥",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("See all"),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenSize.height * 0.45,
                  child: GridView.builder(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.all(10),
                    itemCount: Provider.of<Cart>(context).shoes.length,
                    itemBuilder: (BuildContext context, int index) {
                      var shoe = Provider.of<Cart>(context).shoes[index];
                      return Itemswidget(shoe: shoe);
                    },
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount:
                          2, // Adjust this value according to your needs
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Hot Picks 🔥",
                        style: TextStyle(
                            fontSize: 25, fontWeight: FontWeight.bold),
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text("See all"),
                      ),
                    ],
                  ),
                ),
                Container(
                  height: screenSize.height * 0.56, // Define a fixed height
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: Provider.of<Cart>(context).shoes.length,
                    itemBuilder: (BuildContext context, int index) {
                      var shoe = Provider.of<Cart>(context).shoes[index];
                      return Itemswidget(shoe: shoe);
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    height: screenSize.height * 0.067,
                    width: screenSize.height * 0.4,
                    child: TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, CartPage.id);
                      },
                      child: const Text(
                        "SHOW CART",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class Itemswidget extends StatelessWidget {
  const Itemswidget({
    super.key,
    required this.shoe,
  });

  final Shoe shoe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25),
          color: const Color.fromARGB(179, 180, 178, 178),
        ),
        child: Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(25),
              child: Container(
                width: 400,
                height: 200,
                child: Image.asset(
                  shoe.imageurl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              bottom: 50,
              left: 10,
              right: 10,
              child: Container(
                color: Colors.black.withOpacity(0.5),
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  shoe.description,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            Positioned(
              bottom: 30,
              left: 10,
              child: Text(
                "Price: \$${shoe.price}",
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextButton(
                  onPressed: () {
                    Provider.of<Cart>(context, listen: false).addtocart(shoe);
                  },
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
