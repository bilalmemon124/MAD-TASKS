import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prov/CartProvider.dart';
import 'package:prov/Item.dart';
import 'package:prov/SecondScreen.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

        // Sample list of items, replace this with your actual item list.
    final itemList = [
      Item(name: 'shoe 1', price: 10.99, imageUrl: 'images/shoe.jpeg'),
      Item(name: 'shoe 2', price: 19.99, imageUrl: 'images/shoe.jpeg'),
      Item(name: 'shoe 3', price: 10.99, imageUrl: 'images/shoe.jpeg'),
      Item(name: 'shoe 4', price: 19.99, imageUrl: 'images/shoe.jpeg'),
      Item(name: 'shoe 5', price: 10.99, imageUrl: 'images/shoe.jpeg'),
      Item(name: 'shoe 6', price: 19.99, imageUrl: 'images/shoe.jpeg'),
      // Add more items here...
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Item List'),
        actions: [
          IconButton(
            icon: const Icon(Icons.shopping_cart),
            onPressed: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => SecondScreen()));
            },
          ),
        ],
      ),
      
      body: ListView.builder(
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          final item = itemList[index];
          return ListTile(
            leading: Image.asset(item.imageUrl),
            title: Text(item.name),
            subtitle: Text('\$${item.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.add),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: const Text('Add to Cart?'),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: const Text('No'),
                      ),
                      TextButton(
                        onPressed: () {
                          cartProvider.addToCart(item);
                          Navigator.pop(context);
                        },
                        child: const Text('Yes'),
                      ),
                    ],
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
