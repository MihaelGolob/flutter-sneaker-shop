import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sneaker_shop/intro_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[300],
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sneaker Shop',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.grey[600]!,
          brightness: Brightness.light,
          primary: Colors.grey[600]!,
          secondary: Colors.grey[500],
          surface: Colors.grey[300]!,
          inverseSurface: Colors.white,
          inversePrimary: Colors.grey[900],
        ),
      ),
      home: const IntroPage(),
    );
  }
}
