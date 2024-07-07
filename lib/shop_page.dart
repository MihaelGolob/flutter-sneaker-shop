import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/components/shoe_tile.dart';
import 'package:sneaker_shop/providers/cart_provider.dart';
import 'components/text_box.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      child: Column(
        children: [
          TextBox(controller: TextEditingController()),
          const SizedBox(height: 20),
          // inspirational quote
          Text(
            'the only way to do great work is to love what you do',
            style: TextStyle(color: theme.secondary),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                'Hot picks 🔥',
                style: TextStyle(
                  color: theme.primary,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'See all',
                style: TextStyle(
                  color: theme.secondary,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) => ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: cartProvider.availableItems.length,
                itemBuilder: (context, index) => ShoeTile(shoe: cartProvider.availableItems[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
