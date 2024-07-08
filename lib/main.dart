import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sneaker_shop/intro_page.dart';
import 'package:sneaker_shop/providers/cart_provider.dart';
import 'package:sneaker_shop/providers/theme_provider.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.grey[300],
    ),
  );

  runApp(ChangeNotifierProvider(
    create: (context) => ThemeProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var dispatcher = SchedulerBinding.instance.platformDispatcher;
    dispatcher.onPlatformBrightnessChanged = () {
      Provider.of<ThemeProvider>(context, listen: false).systemBrightness = dispatcher.platformBrightness;
    };

    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      builder: (context, child) => MaterialApp(
        title: 'Sneaker Shop',
        debugShowCheckedModeBanner: false,
        theme: Provider.of<ThemeProvider>(context).themeData,
        home: const IntroPage(),
      ),
    );
  }
}
