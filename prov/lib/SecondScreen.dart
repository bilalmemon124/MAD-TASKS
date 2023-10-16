import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:prov/CartProvider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final cartProvider = Provider.of<CartProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Cart'),
      ),
      body: ListView.builder(
        itemCount: cartProvider.cartItems.length,
        itemBuilder: (context, index) {
          final cartItem = cartProvider.cartItems[index];
          return ListTile(
            leading: SizedBox(
              width: 60.0,
              child: Image.asset(cartItem.imageUrl), // Use Image.asset for local images
            ),
            title: Text(cartItem.name),
            subtitle: Text('\$${cartItem.price.toStringAsFixed(2)}'),
            trailing: IconButton(
              icon: const Icon(Icons.remove),
              onPressed: () {
                // Remove the item from the cart when the "Remove" icon is pressed
                cartProvider.removeFromCart(index);
              },
            ),
          );
        },
      ),
    );
  }
}
