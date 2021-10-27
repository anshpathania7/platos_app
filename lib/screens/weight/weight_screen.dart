import 'package:flutter/material.dart';
import 'package:platos_app/providers/weight_provider.dart';
import 'package:provider/provider.dart';

import '../counter.dart';
import 'widgets/enter_weight_dialog_card.dart';
import 'widgets/weight_entries_listview.dart';

class WeightScreen extends StatelessWidget {
  const WeightScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => WeightProvider()..loadAllWeightEntries(),
      child: Consumer<WeightProvider>(
        builder: (context, state, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("Weight Tracker"),
            centerTitle: true,
          ),
          floatingActionButton: Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const CounterScreen(),
                const SizedBox(height: 12),
                FloatingActionButton(
                  child: const Icon(Icons.add),
                  onPressed: () async {
                    await showDialog(
                      context: context,
                      builder: (context) =>
                          EnterWeightDialogCard(provider: state),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeightEntriesListview(
                    provider: state,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
