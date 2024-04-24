import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_provider.dart';
import 'homepage.dart';

void main() {
  runApp(
      ChangeNotifierProvider(
        create: (context) => CartProvider(),
        child: FoodApp(),
      ),
  );
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) {  },
      child: MaterialApp(
        title: 'Tasty Bites',
        theme: ThemeData(
          primaryColor: Colors.orange,
          scaffoldBackgroundColor: Colors.orange,
          appBarTheme: AppBarTheme(
            backgroundColor: Colors.brown.shade900,
          ),
        ),
        debugShowCheckedModeBanner: false,
        home: firstPage(),
      
      ),
    );
  }
}


