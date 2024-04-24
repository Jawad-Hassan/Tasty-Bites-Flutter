import 'package:flutter/material.dart';
import 'cart_provider.dart';
import 'package:provider/provider.dart';
import 'cart.dart';
import 'cartitems.dart';
import 'item_page.dart';

class MenuPage extends StatelessWidget {
  final List<String> menuItems = [
    'Pizza',
    'Hamburger',
    'Sandwich',
    'Cheeseburger',
    'Noodles',
    'Snacks',
    'Chicken nuggets',
    'Chicken fingers',
    'French Fries',
    'Milkshake',
    'Salad',
    'Fish',
    'Ice Cream',
  ];
  final List<double> priceItems = [
    1500, 700, 300, 750, 300, 200, 400, 350, 300, 250, 250, 1000, 250
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          'MENU',
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
      body: ListView.builder(
        itemExtent: 150,
        itemCount: menuItems.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ItemPage(name: menuItems[index],description:'Satisfy your hunger and treat yourself to the perfect blend of '
                      '${menuItems[index]}.Order Now!',price: priceItems[index],imagePath: 'assets/images/$index.jpg',),
                ),
              );
            },
            child: Card(
              elevation: 10,
              color: Colors.brown.shade900,
              margin: EdgeInsets.all(5),
              child: ListTile(
                leading: Container(
                  width: 90,
                  height: 120,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      'assets/images/$index.jpg',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                title: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      menuItems[index],
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.orangeAccent,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Description of ${menuItems[index]}.',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                trailing: Icon(Icons.arrow_forward_ios,
                    color: Colors.orangeAccent),
              ),
            ),
          );
        },
      ),
    );
  }
}
