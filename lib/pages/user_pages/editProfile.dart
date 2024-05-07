import "package:animated_snack_bar/animated_snack_bar.dart";
import "package:flutter/material.dart";
import "package:intl_phone_field/intl_phone_field.dart";
import "package:naruciekoapp/datatype/customButton.dart";
import "package:naruciekoapp/datatype/customTextField.dart";
import "package:naruciekoapp/datatype/uploadPhotoDialog.dart";

import "package:naruciekoapp/globalData.dart";

class UserEdit extends StatefulWidget {
  const UserEdit({super.key});

  @override
  State<UserEdit> createState() => _UserEditState();
}

class _UserEditState extends State<UserEdit> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController surnameController = TextEditingController();
  TextEditingController adressNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = globalUser.name;
    contactNumberController.text = globalUser.contactNumber;
    adressNameController.text = globalUser.adressName;
    surnameController.text = globalUser.surname;
  }

  void finishUserAccountEdit() {
    globalUser.name = nameController.text.toString();
    globalUser.contactNumber = contactNumberController.text.toString();
    globalUser.surname = surnameController.text.toString();
    globalUser.adressName = adressNameController.text.toString();

    AnimatedSnackBar.material(
      'Changes saved',
      type: AnimatedSnackBarType.success,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    ).show(context);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        appBar: AppBar(
          title: Text('User Account'),
          backgroundColor: Colors.green,
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: CustomTextField(
                            controller: nameController,
                            hintText: 'Name',
                            obsureText: false),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Flexible(
                        fit: FlexFit.loose,
                        child: CustomTextField(
                            controller: surnameController,
                            hintText: 'Surname',
                            obsureText: false),
                      ),
                      const Padding(padding: EdgeInsets.all(15)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  IntlPhoneField(
                    autofocus: false,
                    controller: contactNumberController,
                    initialCountryCode: 'HR',
                    initialValue: globalUser.contactNumber,
                  ),
                  const Padding(padding: EdgeInsets.all(25)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Padding(padding: EdgeInsets.all(20)),
                      Flexible(
                        fit: FlexFit.loose,
                        child: CircleAvatar(
                          radius: 50,
                          backgroundImage: globalUser.profileImage.image,
                        ),
                      ),
                      Flexible(
                        fit: FlexFit.loose,
                        child: ElevatedButton(
                          onPressed: () => showDialog<String>(
                            context: context,
                            builder: (BuildContext context) =>
                                const UploadProfilePhoto(),
                          ).then((value) => setState(() => {})),
                          child: const Text('Upload photo'),
                        ),
                      ),
                      Padding(padding: EdgeInsets.all(20)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(25)),
                  CustomButton(
                    onTap: () =>
                        {finishUserAccountEdit(), Navigator.of(context).pop()},
                    text: 'Save changes',
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
