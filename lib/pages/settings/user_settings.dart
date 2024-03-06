import "package:cloud_firestore/cloud_firestore.dart";
import "package:flutter/material.dart";
import 'package:naruciekoapp/models/user_models/user_model.dart';
import "package:naruciekoapp/pages/LandingPages/producers_list_view.dart";
import "package:naruciekoapp/services/database.dart";
import "package:provider/provider.dart";
import "package:cloud_firestore/cloud_firestore.dart";

class UserSettings extends StatefulWidget {
  const UserSettings({super.key});

  @override
  State<UserSettings> createState() => _UserSettingsState();
}

class _UserSettingsState extends State<UserSettings> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<UserModel>>.value(
      value: DatabaseService().users,
      initialData: List.empty(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Settings"),
        ),
      ),
    );
  }
}
