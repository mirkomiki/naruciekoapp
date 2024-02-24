import "package:flutter/material.dart";
import "package:naruciekoapp/services/database.dart";
import "package:cloud_firestore/cloud_firestore.dart";
import "package:provider/provider.dart";

class ProducersListView extends StatefulWidget {
  const ProducersListView({super.key});

  @override
  State<ProducersListView> createState() => _ProducersListViewState();
}

class _ProducersListViewState extends State<ProducersListView> {
  @override
  Widget build(BuildContext context) {
    final all_users = Provider.of<QuerySnapshot>(context);

    for (var doc in all_users.docs) {
      doc.data();
    }
    return Container();
  }
}
