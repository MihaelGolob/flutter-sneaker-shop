import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final TextEditingController controller;
  const TextBox({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    return TextField(
      controller: controller,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(10),
        fillColor: theme.inverseSurface,
        filled: true,
        hintText: 'Search for sneakers...',
        hintStyle: TextStyle(color: theme.surface),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        suffixIcon: Icon(Icons.search, color: theme.primary),
      ),
      style: TextStyle(color: theme.primary, fontSize: 18),
    );
  }
}
