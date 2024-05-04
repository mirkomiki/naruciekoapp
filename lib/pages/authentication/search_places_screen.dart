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
        center: LatLong(0, 0),
        buttonColor: Colors.blue,
        buttonText: 'Set Location',
        onPicked: (pickedData) {
          Navigator.pop(context, pickedData);
        },
      ),
    );
  }
}
