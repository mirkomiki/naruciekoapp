import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/models/producer_models/producer_model.dart';
import 'package:naruciekoapp/models/user_models/user_model.dart';

class CustomProducerCard extends StatelessWidget {
  final UserModel producer;
  CustomProducerCard({
    required this.producer,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 200,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 20,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Column(
                    children: <Widget>[
                      CircleAvatar(
                        radius: 35,
                        child: producer.profileImage,
                      ),
                    ],
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        producer.name,
                        style:
                            const TextStyle(color: Colors.black, fontSize: 20),
                      ),
                      const Text("Ovo su testni primjeri"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
