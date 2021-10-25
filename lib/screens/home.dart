import 'package:flutter/material.dart';
import 'package:platos_app/screens/screen_one.dart';
import 'package:platos_app/screens/screen_two.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              OutlinedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenOne(),
                  ),
                ),
                child: const Text("Open screen 1"),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ScreenTwo(),
                  ),
                ),
                child: const Text("Open screen 2"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
