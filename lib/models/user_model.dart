class UserModel {
  final String uid;
  String? email;
  String? contactNumber;
  String? name;
  String? address;

  UserModel({required this.uid});

  UserModel.full({
    required this.uid,
    this.email,
    this.contactNumber,
    this.name,
    this.address,
  });

  void setName(String name) => this.name = name;

  void setAddress(String address) => this.address = address;

  void setContactNumber(String contactNumber) =>
      this.contactNumber = contactNumber;
}
