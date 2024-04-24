import 'package:flutter/material.dart';
import 'package:my_restaurant/cart_model.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'checkout.dart';

class CartItemsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Center(
          child: Text(
            'YOUR CART',
            style: TextStyle(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.bold,
              color: Colors.orangeAccent,
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          Item item = cartProvider.cartItems[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Price: Rs${item.price.toStringAsFixed(1)}'),
            trailing: Text('Quantity: ${item.quantity.toString()}'),
          );
        },
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.brown.shade900,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Total: Rs${cartProvider.totalPrice.toStringAsFixed(1)}',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.orangeAccent,
                fontSize: 20,
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => checkOut(),),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: EdgeInsets.symmetric(horizontal: 20,vertical: 15),
              ),
              child: Text('Order Now!',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                  color: Colors.brown.shade900,
                  fontSize: 20,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
