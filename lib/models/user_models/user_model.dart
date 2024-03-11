import 'dart:ffi';

import 'package:flutter/material.dart';

class UserModel {
  final String uid;
  late String role;
  late String name;
  late String email;
  late String adress;
  late String contactNumber;
  late List<String> favourites;
  late List<Map<String, int>> ratings;
  Image profileImage = Image.asset("assets/blank-profile-image.jpg");

  UserModel(this.uid, this.name, this.email, this.role);
}
