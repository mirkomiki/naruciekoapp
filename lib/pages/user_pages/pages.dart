import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/pages/Landing/home.dart';
import 'package:naruciekoapp/pages/producer_pages/itemsPage.dart';
import 'package:naruciekoapp/pages/user_pages/mapsPage.dart';
import 'package:naruciekoapp/pages/user_pages/producers_page.dart';
import 'package:naruciekoapp/globalData.dart';

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

  @override
  void initState() {
    super.initState();
  }

  final List<Widget> _pages = [
    const Home(),
    const ItemPage(),
    const ProducersPage(),
    //const MapsView(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(selectedPageIndex),
      backgroundColor: Colors.grey[900],
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
              icon: Icon(Icons.home),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_basket_outlined),
              label: 'Košarica',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.groups_outlined),
              label: 'Proizvođači',
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
