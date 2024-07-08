import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  int _themeValue = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).colorScheme;

    void _changeTheme(int value) {
      // Change the theme based on the value
      setState(() {
        _themeValue = value;
      });
    }

    return Scaffold(
      backgroundColor: theme.surface,
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              decoration: BoxDecoration(
                color: theme.inverseSurface,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(children: [
                const Text("Theme", style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                const Text("Choose how your Nike experience looks for this device."),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Light"),
                    Radio(
                      value: 0,
                      groupValue: _themeValue,
                      activeColor: theme.inversePrimary,
                      onChanged: (value) => _changeTheme(value!),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Dark"),
                    Radio(
                      value: 1,
                      groupValue: _themeValue,
                      activeColor: theme.inversePrimary,
                      onChanged: (value) => _changeTheme(value!),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("System Default"),
                    Radio(
                      value: 2,
                      groupValue: _themeValue,
                      activeColor: theme.inversePrimary,
                      onChanged: (value) => _changeTheme(value!),
                    ),
                  ],
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
