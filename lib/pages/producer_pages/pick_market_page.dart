import 'package:flutter/material.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class PickMarketPage extends StatefulWidget {
  final LatLong initData;
  PickMarketPage({super.key, required this.initData});

  @override
  State<PickMarketPage> createState() => _PickMarketPageState();
}

class _PickMarketPageState extends State<PickMarketPage> {
  late PickedData pickedData;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pronađi moj stol"),
      ),
      body: OpenStreetMapSearchAndPick(
        locationPinIconColor: Colors.green,
        center: widget.initData,
        buttonColor: Colors.blue,
        buttonText: 'Pritisni ovdje',
        onPicked: (pickedData) => {
          print("Daj mi nesto"),
          Navigator.pop(context, pickedData),
        },
      ),
    );
  }
}

const snackBar = SnackBar(
  content: Text('Zapamćena lokacija'),
);
