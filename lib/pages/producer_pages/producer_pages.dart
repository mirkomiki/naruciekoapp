import 'package:flutter/material.dart';
import 'package:naruciekoapp/datatype/custom_appbar.dart';
import 'package:naruciekoapp/pages/producer_pages/avaliable_items.dart';
import 'package:naruciekoapp/pages/producer_pages/create_new_item.dart';
import 'package:naruciekoapp/pages/producer_pages/orders_dashboard.dart';
import 'package:naruciekoapp/globalData.dart';

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

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  final List<Widget> _producerPages = [
    const OrdersDashboard(),
    const AvaliableProductsPage(),
    const CreateProductPage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _producerPages.elementAt(selectedProducerPageIndex),
      backgroundColor: Colors.grey[900],
      appBar: CustomAppBar(title: 'Producer'),
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
