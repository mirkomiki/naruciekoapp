import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:naruciekoapp/datatype/customButton.dart';
import 'package:naruciekoapp/datatype/customTextField.dart';
import 'package:naruciekoapp/datatype/uploadPhotoDialog.dart';
import 'package:naruciekoapp/globalData.dart';

class ProducerEdit extends StatefulWidget {
  const ProducerEdit({super.key});

  @override
  State<ProducerEdit> createState() => _ProducerEditState();
}

class _ProducerEditState extends State<ProducerEdit> {
  TextEditingController nameController = TextEditingController();
  TextEditingController contactNumberController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ibanController = TextEditingController();
  TextEditingController addressNameController = TextEditingController();
  TextEditingController ownerController = TextEditingController();
  TextEditingController oibController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = globalProducer.name;
    ownerController.text = globalProducer.owner;
    contactNumberController.text = globalProducer.contactNumber;
    addressNameController.text = globalProducer.address;
    ibanController.text = globalProducer.iban;
    oibController.text = globalProducer.oib;
  }

  void finishUserAccountEdit() {
    globalProducer.name = nameController.text.toString();
    globalProducer.contactNumber = contactNumberController.text.toString();
    globalProducer.owner = ownerController.text.toString();
    globalProducer.address = addressNameController.text.toString();
    globalProducer.iban = ibanController.text.toString();
    globalProducer.oib = oibController.text.toString();
    AnimatedSnackBar.material(
      'Changes saved',
      type: AnimatedSnackBarType.success,
      mobileSnackBarPosition: MobileSnackBarPosition.bottom,
    ).show(context);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
      child: Scaffold(
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text('Producer Account'),
          backgroundColor: const Color.fromARGB(255, 0, 164, 164),
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
                      const Padding(padding: EdgeInsets.all(20)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(25)),
                  CustomButton(
                    onTap: () => {
                      finishUserAccountEdit(),
                      Navigator.of(context).pop(),
                      setState(() {})
                    },
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
