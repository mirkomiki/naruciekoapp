import 'package:flutter/material.dart';
import 'package:naruciekoapp/datatype/customButton.dart';
import 'package:naruciekoapp/datatype/custom_appbar.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/models/producer_models/producer_functions.dart';
import 'package:naruciekoapp/pages/landing/producer_pages.dart';
import 'package:naruciekoapp/pages/producer_pages/pick_market_page.dart';
import 'package:open_street_map_search_and_pick/open_street_map_search_and_pick.dart';

class StartProducerPage extends StatelessWidget {
  const StartProducerPage({super.key});

  Future<void> navigateAndImportSelectedLocation(
      BuildContext context, int i) async {
    print("DAJ MI NESTO 1");
    const sB = SnackBar(
      content: Text("Odabran market"),
      behavior: SnackBarBehavior.floating,
    );
    const sB1 = SnackBar(
      content: Text("Odabrana precizna lokacija"),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(sB);
    PickedData? result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PickMarketPage(initData: markets[i].latLong),
      ),
    );
    ScaffoldMessenger.of(context).showSnackBar(sB1);
    // Handle the picked location data
    ProducerFunctions(uid: globalUser.uid)
        .updateProducerTodayAdress(globalProducer, markets[i].latLong);
    // Navigate back to ProducerPages
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => ProducerPages(),
      ),
    );
  }

  setHomeAdressAsTodayAdress(BuildContext context) async {
    const sB2 = SnackBar(
      content: Text("Odabrana precizna lokacija"),
      behavior: SnackBarBehavior.floating,
    );
    ScaffoldMessenger.of(context).showSnackBar(sB2);
    ProducerFunctions(uid: globalUserUid)
        .updateProducerTodayAdressHome(globalProducer);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: "Where are you today",
      ),
      backgroundColor: Colors.grey[300],
      body: Column(
        children: [
          ListView.builder(
              shrinkWrap: true,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Padding(
                    padding: EdgeInsets.all(10),
                    child: CustomButton(
                        onTap: () async {
                          await navigateAndImportSelectedLocation(
                              context, index);
                        },
                        text: markets[index].marketEnum.name));
              }),
          SizedBox(
            height: 10,
          ),
          Text("DANAS NISAM NA TRŽNICI:"),
          Padding(
              padding: EdgeInsets.all(10),
              child: CustomButton(
                  onTap: () => setHomeAdressAsTodayAdress(context),
                  text: "Doma sam")),
          Padding(
            padding: EdgeInsets.all(20),
            child: ElevatedButton(
              child: Text("Gotov"),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ProducerPages(),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
