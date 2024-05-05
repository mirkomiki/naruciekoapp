import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/datatype/customProducersCard.dart';
import 'package:naruciekoapp/datatype/custom_appbar.dart';
import 'package:naruciekoapp/models/producer_models/producer_model.dart';
import 'package:naruciekoapp/models/user_models/user_model.dart';
import 'package:naruciekoapp/pages/user_pages/producers_list_view.dart';
import 'package:naruciekoapp/services/database.dart';
import 'package:provider/provider.dart';

class ProducersPage extends StatefulWidget {
  const ProducersPage({super.key});

  @override
  State<ProducersPage> createState() => _ProducersPageState();
}

class _ProducersPageState extends State<ProducersPage> {
  @override
  Widget build(BuildContext context) {
    final producers = DatabaseService().producers;
    print(producers);
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: CustomAppBar(title: 'Producers'),
      body: Center(
        child: StreamBuilder<List<ProducerModel>>(
          stream: producers,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return CircularProgressIndicator();
            } else if (snapshot.connectionState == ConnectionState.done) {
              print('connection done');
              return Text('Done!');
            } else if (snapshot.hasError) {
              print('error happend');
              return Text('Error!');
            } else {
              print('ulazi u produr bilder');
              List<ProducerModel> producersList = snapshot.data ?? [];
              print(producersList);
              return ListView.builder(
                  itemCount: producersList.length,
                  itemBuilder: (context, index) {
                    return CustomProducerCard(producer: producersList[index]);
                  });
            }
          },
        ),
      ),
    );
  }
}
