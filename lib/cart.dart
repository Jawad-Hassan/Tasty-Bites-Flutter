import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';

class ShoppingCartIcon extends StatelessWidget {
  final int itemCount;

  ShoppingCartIcon({required this.itemCount});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Stack(
      children: [
        IconButton(
          icon: Icon(Icons.shopping_cart),
          color: Colors.orange,
          iconSize: 30,
          onPressed: () {

          },
        ),
        Positioned(
          right: 8,
          top: 8,
          child:  CircleAvatar(
            radius: 10,
            backgroundColor: Colors.red,
            foregroundColor: Colors.white,
            child: Text(
              cartProvider.itemCount.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          ) ,
        ),
      ],
    );
  }
}
