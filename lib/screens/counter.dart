import 'package:flutter/material.dart';
import 'package:platos_app/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class CounterScreen extends StatelessWidget {
  const CounterScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<CounterProvider>(builder: (context, state, _) {
      return Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextButton(
            onPressed: () => state.incrementCount,
            child: const Icon(Icons.arrow_upward),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(state.getCount + " tapped"),
          ),
          TextButton(
            onPressed: () => state.decrementCount,
            child: const Icon(Icons.arrow_downward),
          ),
        ],
      );
    });
  }
}
