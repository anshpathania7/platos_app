import 'package:flutter/material.dart';
import 'package:platos_app/models/user_model.dart';
import 'package:platos_app/models/weight_model.dart';
import 'package:platos_app/providers/users_provider.dart';
import 'package:platos_app/providers/weight_provider.dart';

import 'enter_user_data_dialog_card.dart';

class UpdateDeleteDialog extends StatelessWidget {
  final UsersProvider provider;
  final UserModel weightModel;
  const UpdateDeleteDialog(
      {Key? key, required this.provider, required this.weightModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 400,
      child: Dialog(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(height: 12),
              TextButton(
                onPressed: () async {
                  Navigator.pop(context);
                  await showDialog(
                      context: context,
                      builder: (context) => EnterUserDataDialogCard(
                            isEdit: true,
                            provider: provider,
                            weightModel: weightModel,
                          ));
                },
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(2),
                      bottomRight: Radius.circular(2),
                    ),
                  ),
                  backgroundColor: Colors.yellow,
                ),
                child: const Text(
                  "Edit",
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  provider.deleteUsers(id: weightModel.id);
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(2),
                      bottomRight: Radius.circular(2),
                    ),
                  ),
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  "Delete",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
