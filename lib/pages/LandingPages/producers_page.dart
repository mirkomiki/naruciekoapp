import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/pages/LandingPages/producers_list_view.dart';
import 'package:naruciekoapp/services/database.dart';
import 'package:provider/provider.dart';

class ProducersPage extends StatefulWidget {
  const ProducersPage({super.key});

  @override
  State<ProducersPage> createState() => _ProducersPageState();
}

class _ProducersPageState extends State<ProducersPage> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<QuerySnapshot?>.value(
      value: DatabaseService().narucinasedata,
      initialData: null,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
        body: ProducersListView(),
      ),
    );
  }
}
