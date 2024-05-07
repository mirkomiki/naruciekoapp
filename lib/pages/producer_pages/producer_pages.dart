import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/datatype/custom_appbar.dart';
import 'package:naruciekoapp/pages/producer_pages/avaliable_items.dart';
import 'package:naruciekoapp/pages/producer_pages/create_new_item.dart';
import 'package:naruciekoapp/pages/producer_pages/itemsPage.dart';
import 'package:naruciekoapp/pages/producer_pages/orders_dashboard.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/pages/producer_pages/past_recipets_producer.dart';
import 'package:naruciekoapp/pages/producer_pages/producer_edit.dart';
import 'package:naruciekoapp/pages/wrapper.dart';

class ProducerPages extends StatefulWidget {
  const ProducerPages({super.key});

  @override
  State<ProducerPages> createState() => _ProducerPagesState();
}

class _ProducerPagesState extends State<ProducerPages> {
  void onTapped(int index) {
    setState(() {
      selectedProducerPageIndex = index;
    });
  }

  final List<Widget> _producerPages = [
    const OrdersDashboard(),
    const ItemPage(),
    const CreateNewItem(),
  ];

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: _producerPages.elementAt(selectedProducerPageIndex),
      backgroundColor: Colors.grey[900],
      appBar: const CustomAppBar(title: 'Producer'),
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
                    MaterialPageRoute(builder: (context) => ProducerEdit()),
                  ).then((_) => setState(() {}));
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
                  setState(() {});
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
      bottomNavigationBar: Container(
        height: 60,
        decoration: const BoxDecoration(
            color: Color.fromARGB(30, 255, 255, 255),
            border: Border(
                top: BorderSide(
                    color: Color.fromARGB(0, 255, 255, 255), width: 0.75))),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.dashboard),
              label: 'Narudžbe',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Proizvodi',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'Lista proizvoda',
            ),
          ],
          currentIndex: selectedProducerPageIndex,
          type: BottomNavigationBarType.fixed,
          backgroundColor: const Color.fromARGB(255, 26, 26, 26),
          unselectedItemColor: const Color.fromARGB(129, 255, 255, 255),
          selectedItemColor: Colors.white,
          onTap: onTapped,
        ),
      ),
    );
  }
}
