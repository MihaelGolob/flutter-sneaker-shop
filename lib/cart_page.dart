import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/components/cart_item_view.dart';
import 'package:sneaker_shop/providers/cart_provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your Cart 🛒',
            style: TextStyle(
              color: theme.primary,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Consumer<CartProvider>(
              builder: (context, cartProvider, child) => ListView.builder(
                itemCount: cartProvider.cart.length,
                itemBuilder: (context, index) => CartItemView(cartItem: cartProvider.cart[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
