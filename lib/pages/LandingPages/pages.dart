import 'package:flutter/material.dart';
import 'package:naruciekoapp/pages/LandingPages/itemsPage.dart';
import 'package:naruciekoapp/pages/LandingPages/mapsPage.dart';
import 'package:naruciekoapp/pages/LandingPages/producersPage.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/pages/LandingPages/home.dart';

class Pages extends StatefulWidget {
  const Pages({super.key});

  @override
  State<Pages> createState() => _PagesState();
}

class _PagesState extends State<Pages> {
  void onTapped(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  final List<Widget> _pages = [
    const Home(),
    const ItemsView(),
    const ProducersPage(),
    const MapsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(selectedPageIndex),
      backgroundColor: Colors.grey[900],
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
            color: Color.fromARGB(30, 255, 255, 255),
            border: Border(
                top: BorderSide(
                    color: Color.fromARGB(0, 255, 255, 255), width: 0.75))),
        child: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              label: 'Košarica',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups_outlined),
              label: 'Proizvođači',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Map',
            ),
          ],
          currentIndex: selectedPageIndex,
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
