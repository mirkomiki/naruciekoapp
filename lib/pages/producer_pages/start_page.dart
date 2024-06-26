import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/datatype/custom_appbar.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/pages/producer_pages/past_recipets_producer.dart';
import 'package:naruciekoapp/pages/producer_pages/producer_edit.dart';
import 'package:naruciekoapp/pages/wrapper.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: const CustomAppBar(
        title: 'Gdje ste danas?',
      ),
      endDrawer: Drawer(
        child: Container(
          width: width * 0.3,
          padding: const EdgeInsets.only(top: 30),
          color: const Color(0XFFFEEAE6),
          child: Column(children: [
            Container(
              width: width * 0.3,
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 36,
                backgroundImage: globalUser.profileImage.image,
              ),
            ),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(
                  'Postavke',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ProducerEdit()))
                      .then((_) => setState(() {}));
                }),
            ListTile(
                leading: const Icon(Icons.history),
                title: const Text(
                  'Računi',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => PastRecipetsProducer()),
                  );
                }),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Izlogiraj se',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  await FirebaseAuth.instance
                      .signOut()
                      .then((_) => setState(() {}));
                }),
          ]),
        ),
      ),
    );
  }
}
