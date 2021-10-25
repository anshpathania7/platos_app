import 'package:flutter/material.dart';
import 'package:platos_app/providers/counter_provider.dart';
import 'package:provider/provider.dart';

class ScreenTwo extends StatelessWidget {
  const ScreenTwo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Screen Two"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Text(
                'You have pushed the button this many times:',
              ),
              Consumer<CounterProvider>(
                builder: (context, state, _) => state.isLoadingData
                    ? const CircularProgressIndicator()
                    : StreamBuilder(
                        stream: state.getCountStream,
                        builder: (context, snap) {
                          return Text(
                            snap.data?.toString() ?? "0",
                            style: Theme.of(context).textTheme.headline4,
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            FloatingActionButton(
              heroTag: '3',
              onPressed: () {
                context.read<CounterProvider>().incrementCount;
              },
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            ),
            const SizedBox(width: 12),
            FloatingActionButton(
              heroTag: '4',
              onPressed: () {
                context.read<CounterProvider>().decrementCount;
              },
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
          ],
        ));
  }
}
