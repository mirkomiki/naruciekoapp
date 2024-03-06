class DeliveryPerson {
  final String id;
  late String? name;
  late String? email;
  late String? contactNumber;

  DeliveryPerson({required this.id, this.name, this.email, this.contactNumber});

  void setName(String name) => this.name = name;

  void setEmail(String email) => this.email = email;

  void setContactNumber(String contactNumber) =>
      this.contactNumber = contactNumber;
}
