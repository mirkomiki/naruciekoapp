import 'package:flutter/material.dart';
import 'package:naruciekoapp/pages/LandingPages/avaliable%20products.dart';
import 'package:naruciekoapp/pages/LandingPages/create_new_product.dart';
import 'package:naruciekoapp/pages/LandingPages/itemsPage.dart';
import 'package:naruciekoapp/pages/LandingPages/mapsPage.dart';
import 'package:naruciekoapp/pages/LandingPages/orders_dashboard.dart';
import 'package:naruciekoapp/pages/LandingPages/producers_page.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/pages/LandingPages/home.dart';

class ProducerPages extends StatefulWidget {
  const ProducerPages({super.key});

  @override
  State<ProducerPages> createState() => _ProducerPagesState();
}

class _ProducerPagesState extends State<ProducerPages> {
  void onTapped(int index) {
    setState(() {
      selectedPageIndex = index;
    });
  }

  final List<Widget> _pages = [
    const OrdersDashboard(),
    const AvaliableProductsPage(),
    const CreateProductPage(),
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
              icon: Icon(Icons.dashboard),
              label: 'Narudžbe',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.satellite),
              label: 'Postavi proizvod',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.map),
              label: 'Dodaj proizvod',
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
