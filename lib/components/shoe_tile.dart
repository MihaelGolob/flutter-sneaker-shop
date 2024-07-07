import 'package:flutter/material.dart';

class ShoeTile extends StatelessWidget {
  final String imagePath;
  final String name;
  final String description;
  final double price;

  const ShoeTile({super.key, required this.imagePath, required this.name, required this.description, required this.price});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(0),
      margin: const EdgeInsets.only(right: 30),
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
              imagePath,
              width: 250,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(description, style: TextStyle(color: theme.secondary)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(name, style: TextStyle(color: theme.inversePrimary, fontSize: 25, fontWeight: FontWeight.bold)),
                        Text(price.toString(), style: TextStyle(color: theme.primary, fontSize: 17, fontWeight: FontWeight.bold)),
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
                        onPressed: () {},
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
