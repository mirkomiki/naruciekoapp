/*import "package:flutter/material.dart";
import "package:naruciekoapp/datatype/customProducersCard.dart";
import 'package:naruciekoapp/models/user_models/user_model.dart';
import "package:provider/provider.dart";

class ProducersListView extends StatefulWidget {
  const ProducersListView({super.key});

  @override
  State<ProducersListView> createState() => _ProducersListViewState();
}

class _ProducersListViewState extends State<ProducersListView> {
  @override
  Widget build(BuildContext context) {
    final users = Provider.of<List<UserModel>>(context);
    final producers =
        users.where((element) => element.role == "producer").toList();
    return ListView.builder(
        itemCount: producers.length,
        itemBuilder: (context, index) {
          return CustomProducerCard(producer: producers[index]);
        });
  }
}*/
