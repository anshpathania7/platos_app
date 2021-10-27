import 'package:flutter/material.dart';
import 'package:platos_app/models/weight_model.dart';
import 'package:platos_app/providers/weight_provider.dart';
import 'package:platos_app/screens/weight/widgets/update_delete_dialog.dart';

class WeightEntriesListview extends StatelessWidget {
  final WeightProvider provider;
  const WeightEntriesListview({Key? key, required this.provider})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<WeightModel>>(
        stream: provider.allWeightEntries,
        builder: (context, snapshot) {
          return (snapshot.data != null)
              ? ListView.builder(
                  itemCount: snapshot.data!.length,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, i) => (snapshot.data != null)
                      ? Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: InkWell(
                            onTap: () async {
                              await showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (context) => UpdateDeleteDialog(
                                  provider: provider,
                                  weightModel: snapshot.data![i],
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "${i + 1}. ${snapshot.data![i].weight} Kg",
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Text(
                                          snapshot.data![i].formatDate,
                                          style: const TextStyle(
                                            color: Colors.white70,
                                            fontSize: 18,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        const SizedBox(height: 12),
                                        Text(
                                          snapshot.data![i].formatTime,
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
                        )
                      : Container(),
                )
              : const CircularProgressIndicator();
        });
  }
}
