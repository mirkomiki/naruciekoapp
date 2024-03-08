import 'package:flutter/material.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class SearchPlacesScreen extends StatefulWidget {
  const SearchPlacesScreen({super.key});

  @override
  State<SearchPlacesScreen> createState() => _SearchPlacesScreenState();
}

class _SearchPlacesScreenState extends State<SearchPlacesScreen> {
  late PickedData pickedData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search places"),
      ),
      body: OpenStreetMapSearchAndPick(
        buttonTextStyle:
            const TextStyle(fontSize: 18, fontStyle: FontStyle.normal),
        buttonColor: Colors.blue,
        buttonText: 'Set Current Location',
        onPicked: (pickedData) {
          Navigator.pop(context, pickedData);
        },
      ),
      floatingActionButton: FloatingActionButton(onPressed: () {}),
    );
  }
}
