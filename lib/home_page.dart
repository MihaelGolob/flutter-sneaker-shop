import 'package:flutter/material.dart';
import 'package:sneaker_shop/cart_page.dart';
import 'package:sneaker_shop/components/bottom_nav_bar.dart';
import 'package:sneaker_shop/settings_page.dart';
import 'package:sneaker_shop/shop_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedTabIndex = 0;

  void _navigateBottomBar(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: theme.surface,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: Builder(
          builder: (context) => IconButton(
            icon: Icon(Icons.menu, color: theme.primary),
            onPressed: () {
              Scaffold.of(context).openDrawer();
            },
          ),
        ),
      ),
      drawer: Drawer(
        backgroundColor: theme.inversePrimary,
        child: SafeArea(
          minimum: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/nike.png',
                color: theme.inverseSurface,
                height: 100,
              ),
              const SizedBox(height: 50),
              ListTile(
                leading: Icon(Icons.home_outlined, color: theme.inverseSurface),
                title: Text('Home', style: TextStyle(color: theme.inverseSurface)),
              ),
              ListTile(
                leading: Icon(Icons.person_outline, color: theme.inverseSurface),
                title: Text('Profile', style: TextStyle(color: theme.inverseSurface)),
              ),
              ListTile(
                leading: Icon(Icons.settings_outlined, color: theme.inverseSurface),
                title: Text('Settings', style: TextStyle(color: theme.inverseSurface)),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(builder: (context) => const SettingsPage())),
              ),
              const Spacer(),
              ListTile(
                leading: Icon(Icons.logout, color: theme.inverseSurface),
                title: Text('Logout', style: TextStyle(color: theme.inverseSurface)),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => _navigateBottomBar(index),
      ),
      body: _pages[_selectedTabIndex],
    );
  }
}
