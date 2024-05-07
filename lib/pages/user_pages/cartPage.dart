import 'package:flutter/material.dart';
import 'package:naruciekoapp/datatype/customButton.dart';
import 'package:naruciekoapp/datatype/customItemCard.dart';
import 'package:naruciekoapp/datatype/customItemCardOrder.dart';
import 'package:naruciekoapp/datatype/custom_appbar.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/pages/user_pages/checkout_page.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Narudžba',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.green,
        automaticallyImplyLeading: false,
        surfaceTintColor: Colors.white,
        elevation: 2,
        centerTitle: true,
      ),
      body: Column(
        children: [
          //Form(child: ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Odabrali ste ovo:',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Divider(),
          Expanded(
            child: ListView.builder(
                itemCount: cart.length,
                itemBuilder: (context, index) {
                  return CustomItemCardOrder(item: cart[index]);
                }),
          ),
          CustomButton(onTap: () => goToCheckout(context), text: "Plati")
        ],
      ),
    );
  }
}

void goToCheckout(context) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Checkout()),
  );
}
