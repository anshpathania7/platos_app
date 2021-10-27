import 'package:flutter/material.dart';
import 'package:platos_app/screens/users/users_screen.dart';
import 'package:platos_app/screens/weight/weight_screen.dart';

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
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WeightScreen(),
                    ),
                  );
                },
                child: const Text("Weight Entries"),
              ),
              const SizedBox(height: 12),
              OutlinedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UsersScreen(),
                    ),
                  );
                },
                child: const Text("User entries"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
