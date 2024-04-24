import 'package:flutter/material.dart';
import 'package:my_restaurant/cart_model.dart';
import 'package:provider/provider.dart';
import 'menu_page.dart';
import 'cart.dart';
import 'cart_provider.dart';
import 'cartitems.dart';

class OrderPage extends StatelessWidget {
  final String itemName;
  final String itemImagePath;
  final String price;

  OrderPage({
    required this.itemName,
    required this.itemImagePath,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'Order Page',
          style: TextStyle(
            fontStyle: FontStyle.italic,
            fontWeight: FontWeight.bold,
            color: Colors.orangeAccent,
          ),
        ),
        actions: [
          GestureDetector(
          onTap: () {
           Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => CartItemsScreen()),
    );
    },
      child: Consumer<CartProvider>(
            builder: (context, cartProvider, _) {
              return ShoppingCartIcon(
                itemCount: cartProvider.cartCount,
              );
            },
          ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0),
                image: DecorationImage(
                  image: AssetImage(itemImagePath),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Name:\n$itemName',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade800,
                  ),
                ),
                Text(
                  'Price:\nRs$price',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.brown.shade800,
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  backgroundColor: Colors.brown.shade900,
                  onPressed: () {
                    cartProvider.addToCart(
                      Item(
                        name: itemName,
                        price: double.parse(price),
                        imagePath: itemImagePath,
                      ),
                    );
                  },
                  child: Icon(Icons.add,
                  color: Colors.orange),
                ),
                SizedBox(width: 20),
                FloatingActionButton(
                  backgroundColor: Colors.brown.shade900,
                  onPressed: () {
                    cartProvider.removeFromCart(
                      Item(
                        name: itemName,
                        price: double.parse(price),
                        imagePath: itemImagePath,
                      ),
                    );
                  },
                  child: Icon(Icons.remove,
                  color: Colors.orange),
                ),
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => MenuPage()),
          );
        },
        label: Text('Back to Menu',
          style: TextStyle(
          fontStyle: FontStyle.italic,
          fontWeight: FontWeight.bold,
          color: Colors.orangeAccent,
          fontSize: 20,
        ),),
        backgroundColor: Colors.brown.shade900,
      ),
    );
  }
}
