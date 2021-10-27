import 'package:flutter/material.dart';
import 'package:platos_app/models/user_model.dart';
import 'package:platos_app/providers/users_provider.dart';
import 'package:platos_app/screens/users/widgets/update_delete_dialog.dart';

class UsersEntriesListview extends StatelessWidget {
  final List<UserModel> users;
  final UsersProvider provider;
  const UsersEntriesListview(
      {Key? key, required this.users, required this.provider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: users.length,
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemBuilder: (context, i) => Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: InkWell(
          onTap: () async {
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => UpdateDeleteDialog(
                provider: provider,
                weightModel: users[i],
              ),
            );
          },
          child: Container(
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "${i + 1}. ${users[i].name} ",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        users[i].formatDate,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                      const SizedBox(height: 12),
                      Text(
                        users[i].formatTime,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontSize: 18,
                          fontWeight: FontWeight.w300,
                        ),
                      ),
                    ],
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
