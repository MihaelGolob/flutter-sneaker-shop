import 'package:flutter/material.dart';
import 'package:pair/pair.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/models/shoe_model.dart';
import 'package:sneaker_shop/providers/cart_provider.dart';

class CartItemView extends StatelessWidget {
  final Pair<ShoeModel, int> cartItem;

  const CartItemView({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(15),
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: theme.inverseSurface,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Image.asset(cartItem.key.imagePath, width: 100),
              const SizedBox(width: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 100,
                    child: FittedBox(
                      fit: BoxFit.scaleDown,
                      alignment: Alignment.centerLeft,
                      child: Text(
                        cartItem.key.name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ),
                  ),
                  Text('\$${cartItem.key.price}'),
                ],
              ),
            ],
          ),
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: theme.primary,
                  shape: BoxShape.circle,
                ),
                child: Text('${cartItem.value}', style: TextStyle(color: theme.inverseSurface, fontWeight: FontWeight.bold, fontSize: 15)),
              ),
              IconButton(
                padding: EdgeInsets.zero,
                onPressed: () {
                  Provider.of<CartProvider>(context, listen: false).removeFromCart(cartItem.key);
                },
                icon: Icon(Icons.delete, color: theme.primary),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
