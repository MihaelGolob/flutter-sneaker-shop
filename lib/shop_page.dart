import 'package:flutter/material.dart';
import 'package:sneaker_shop/components/shoe_tile.dart';
import 'package:sneaker_shop/models/shoe_model.dart';
import 'components/text_box.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    final shoes = [
      const ShoeModel(
        imagePath: 'assets/airmax.png',
        name: 'Air Max',
        description: 'With the latest in Nike Air technology, the Nike Air Max 270 delivers unrivaled comfort and style.',
        price: 169.99,
      ),
      const ShoeModel(
        imagePath: 'assets/airforce1.png',
        name: 'Air Force 1',
        description: 'The Nike Air Force 1 is a classic basketball shoe that has been updated with modern details.',
        price: 189.99,
      ),
      const ShoeModel(
        imagePath: 'assets/airforce1low.png',
        name: 'Air Force 1 Low',
        description: 'The Nike Air Force 1 Low is a classic basketball shoe that has been updated with modern details.',
        price: 199.99,
      ),
      const ShoeModel(
        imagePath: 'assets/force58.png',
        name: 'Force 58',
        description: 'The Nike Force 58 is a classic basketball shoe that has been updated with modern details.',
        price: 129.99,
      ),
      const ShoeModel(
        imagePath: 'assets/revolution7.png',
        name: 'Revolution 7',
        description: 'An affordable running shoe that provides comfort and support for all types of runners.',
        price: 79.99,
      ),
    ];

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
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: shoes.length,
              itemBuilder: (context, index) => ShoeTile(
                imagePath: shoes[index].imagePath,
                name: shoes[index].name,
                description: shoes[index].description,
                price: shoes[index].price,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
