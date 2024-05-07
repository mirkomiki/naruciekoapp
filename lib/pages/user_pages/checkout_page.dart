import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/datatype/customButton.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/models/item_models/item_model.dart';
import 'package:naruciekoapp/pages/landing/home.dart';
import 'package:naruciekoapp/pages/wrapper.dart';

class Checkout extends StatefulWidget {
  const Checkout({Key? key});

  @override
  State<Checkout> createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  late String? selectedDeliveryOption;
  late double calculatedPrice;

  final TextEditingController _cardNumberController = TextEditingController();
  final TextEditingController _expiryDateController = TextEditingController();
  final TextEditingController _cvvController = TextEditingController();

  @override
  void initState() {
    super.initState();
    calculatedPrice = calculatePrice();
    selectedDeliveryOption = 'Dostava na kućnu adresu';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Plati",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.green,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        "Ukupno: ${calculatedPrice.toStringAsFixed(2)} € ( ${calculatedPrice * 7.54} kn)",
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            const Divider(),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Odaberi način dostave:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  buildDeliveryOptionTile('Dostava na kućnu adresu'),
                  buildDeliveryOptionTile(
                      'Pokupljanje na tržnici/trenutnoj adresi proizvođača'),
                  buildDeliveryOptionTile('Ostaviti u hladnjaku'),
                  buildDeliveryOptionTile('Rezervacija na OPG-u'),
                  const SizedBox(height: 20),
                  Text(
                    'Unesite informacije o kartici:',
                    style: TextStyle(fontSize: 18),
                  ),
                  const SizedBox(height: 10),
                  _buildCardInputField(
                    controller: _cardNumberController,
                    labelText: 'Broj kartice',
                    hintText: '1234 5678 9012 3456',
                  ),
                  const SizedBox(height: 10),
                  _buildCardInputField(
                    controller: _expiryDateController,
                    labelText: 'Datum isteka (MM/YY)',
                    hintText: '01/23',
                  ),
                  const SizedBox(height: 10),
                  _buildCardInputField(
                    controller: _cvvController,
                    labelText: 'CVV',
                    hintText: '123',
                  ),
                  const SizedBox(height: 10),
                  Text(
                    'Vaše informacije o kartici neće biti spremljene.',
                    style: TextStyle(color: Colors.red),
                  ),
                ],
              ),
            ),
            CustomButton(
              onTap: () {
                cart = [];
                AnimatedSnackBar.material(
                  'Narudžba izvršena - košarica ispražnjena - djeca sretna',
                  type: AnimatedSnackBarType.success,
                  mobileSnackBarPosition: MobileSnackBarPosition.bottom,
                ).show(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Wrapper()),
                );
              },
              text: "Završi narudžbu i izađi",
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCardInputField({
    required TextEditingController controller,
    required String labelText,
    required String hintText,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        border: OutlineInputBorder(),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.green),
        ),
      ),
    );
  }

  Widget buildDeliveryOptionTile(String option) {
    return RadioListTile<String>(
      title: Text(option),
      value: option,
      groupValue: selectedDeliveryOption,
      onChanged: (String? value) {
        setState(() {
          selectedDeliveryOption = value;
        });
      },
    );
  }

  double calculatePrice() {
    double sum = 0;
    for (ItemModel element in cart) {
      sum += element.quantity! * element.price!;
    }
    return sum;
  }

  @override
  void dispose() {
    _cardNumberController.dispose();
    _expiryDateController.dispose();
    _cvvController.dispose();
    super.dispose();
  }
}
