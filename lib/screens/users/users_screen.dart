import 'package:flutter/material.dart';
import 'package:platos_app/providers/users_provider.dart';
import 'package:platos_app/providers/weight_provider.dart';
import 'package:platos_app/screens/counter.dart';
import 'package:provider/provider.dart';

import 'widgets/enter_user_data_dialog_card.dart';
import 'widgets/user_entries_listview.dart';

class UsersScreen extends StatelessWidget {
  const UsersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UsersProvider()..loadAllUsersEntries(),
      child: Consumer<UsersProvider>(
        builder: (context, state, child) => Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text("User Entries"),
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
                          EnterUserDataDialogCard(provider: state),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.all(24.0),
            child: (state.allUsersEntries.isEmpty && !state.isLoading)
                ? const Center(
                    child: Text(
                      "Add a user entry",
                      style: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w500,
                        fontSize: 20,
                      ),
                    ),
                  )
                : SingleChildScrollView(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        UsersEntriesListview(
                          users: state.allUsersEntries,
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
