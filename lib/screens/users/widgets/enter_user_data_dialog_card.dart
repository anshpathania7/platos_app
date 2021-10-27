import 'package:flutter/material.dart';
import 'package:platos_app/models/user_model.dart';
import 'package:platos_app/models/weight_model.dart';
import 'package:platos_app/providers/users_provider.dart';
import 'package:platos_app/providers/weight_provider.dart';

class EnterUserDataDialogCard extends StatefulWidget {
  final UsersProvider provider;
  final bool isEdit;
  final UserModel? weightModel;
  const EnterUserDataDialogCard(
      {Key? key, required this.provider, this.isEdit = false, this.weightModel})
      : super(key: key);

  @override
  State<EnterUserDataDialogCard> createState() => _EnterWeightDialogCardState();
}

class _EnterWeightDialogCardState extends State<EnterUserDataDialogCard> {
  late TextEditingController _controller;
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
              TextFormField(
                controller: _controller,
                autofocus: true,
                keyboardType: TextInputType.text,
                decoration: InputDecoration(
                    labelText: "Name",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    )),
              ),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () {
                  if (widget.isEdit && widget.weightModel != null) {
                    widget.provider.updateUsers(
                        id: widget.weightModel!.id, name: _controller.text);
                  } else {
                    widget.provider.addUsers(name: _controller.text);
                  }
                  _controller.clear();
                  Navigator.pop(context);
                },
                style: TextButton.styleFrom(
                  shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(2),
                      bottomRight: Radius.circular(2),
                    ),
                    side: BorderSide(
                      color: Colors.blue,
                    ),
                  ),
                ),
                child: const Text("Submit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
