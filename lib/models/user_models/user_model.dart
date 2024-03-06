import 'package:flutter/material.dart';

class UserModel {
  final String uid;
  late String role;
  late String name;
  late String email;
  late String contactNumber;
  Image profileImage = Image.asset("assets/blank-profile-image.jpg");

  UserModel(this.uid, this.name, this.email, this.role);
}
