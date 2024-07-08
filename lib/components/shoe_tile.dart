import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/shoe_model.dart';
import 'package:sneaker_shop/providers/cart_provider.dart';

class ShoeTile extends StatelessWidget {
  final ShoeModel shoe;

  const ShoeTile({super.key, required this.shoe});

  void addShoeToCart(context) {
    Provider.of<CartProvider>(context, listen: false).addToCart(shoe);

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Successfully added 🎉'),
        content: Text('${shoe.name} has been added to your cart.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
        color: theme.inverseSurface,
        borderRadius: BorderRadius.circular(20),
      ),
      width: 300,
      child: Padding(
        padding: const EdgeInsets.only(left: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(height: 20),
            Image.asset(
              shoe.imagePath,
              width: 250,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(shoe.description, style: TextStyle(color: theme.secondary)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(shoe.name, style: TextStyle(color: theme.inversePrimary, fontSize: 25, fontWeight: FontWeight.bold)),
                        Text(shoe.price.toString(), style: TextStyle(color: theme.primary, fontSize: 17, fontWeight: FontWeight.bold)),
                        const SizedBox(height: 10),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.all(0),
                      decoration: BoxDecoration(
                        color: theme.inversePrimary,
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), bottomRight: Radius.circular(20)),
                      ),
                      child: IconButton(
                        icon: Icon(Icons.add, color: theme.inverseSurface),
                        onPressed: () => addShoeToCart(context),
                        color: theme.primary,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
