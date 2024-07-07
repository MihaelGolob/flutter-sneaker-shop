import 'package:flutter/material.dart';
import 'package:sneaker_shop/home_page.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Align(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // insert image
              Image.asset(
                'assets/nike.png',
                color: theme.inversePrimary,
                width: 300,
              ),

              const SizedBox(height: 50),

              Text(
                'Just Do It',
                style: TextStyle(
                  color: theme.inversePrimary,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),

              const SizedBox(height: 10),

              Text(
                'Brand new sneakers and custom kicks made with premium quality',
                style: TextStyle(
                  color: theme.secondary,
                  fontSize: 15,
                ),
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 40),

              GestureDetector(
                onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const HomePage())),
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  decoration: BoxDecoration(
                    color: theme.inversePrimary,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      'Shop now',
                      style: TextStyle(
                        color: theme.inverseSurface,
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
