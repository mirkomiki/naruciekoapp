import "package:animated_snack_bar/animated_snack_bar.dart";
import "package:flutter/material.dart";
import "package:google_places_flutter/model/place_details.dart";
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
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  TextEditingController adressNameController = TextEditingController();
  @override
  void initState() {
    super.initState();
    nameController.text = globalUser.name;
    contactNumberController.text = globalUser.contactNumber;
    adressNameController.text = globalUser.adressName;
  }

  void finishUserAccountEdit() {
    globalUser.name = nameController.text.toString();
    globalUser.contactNumber = usernameController.text.toString();
    globalUser.adressName = adressNameController.text.toString();

    /* selectedPageIndex = 2;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const Pages()),
    ); */
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
        backgroundColor: Colors.grey[900],
        appBar: AppBar(
          title: const Text('User Account'),
          backgroundColor: const Color.fromARGB(255, 0, 164, 164),
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.all(10)),
                  TextFormField(
                    style: const TextStyle(color: Colors.white),
                    focusNode: FocusNode(),
                    decoration: InputDecoration(
                        border: const OutlineInputBorder(),
                        labelText: 'Username...',
                        labelStyle: TextStyle(
                            fontStyle: FontStyle.italic,
                            color: Colors.grey[500]),
                        filled: true,
                        fillColor: const Color.fromARGB(255, 26, 26, 26)),
                    controller: usernameController,
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Flexible(
                        fit: FlexFit.loose,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                              border: const OutlineInputBorder(),
                              labelText: 'Name...',
                              labelStyle: TextStyle(
                                  fontStyle: FontStyle.italic,
                                  color: Colors.grey[500]),
                              filled: true,
                              fillColor: const Color.fromARGB(255, 26, 26, 26)),
                          controller: nameController,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(10)),
                      Flexible(
                        fit: FlexFit.loose,
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Surname...   ',
                            labelStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey[500]),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 26, 26, 26),
                          ),
                          controller: adressNameController,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.all(15)),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(15)),
                  Row(
                    children: [
                      Flexible(
                        child: TextFormField(
                          style: const TextStyle(color: Colors.white),
                          focusNode: FocusNode(),
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            labelText: 'Age...',
                            labelStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                color: Colors.grey[500]),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 26, 26, 26),
                          ),
                          controller: contactNumberController,
                          keyboardType: const TextInputType.numberWithOptions(
                              decimal: false),
                        ),
                      ),
                    ],
                  ),
                  const Padding(padding: EdgeInsets.all(25)),
                  ElevatedButton(
                    onPressed: () =>
                        {finishUserAccountEdit(), Navigator.of(context).pop()},
                    child: const Text('Save changes'),
                  ),
                  globalUser.profileImage,
                  ElevatedButton(
                    onPressed: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) =>
                          const UploadProfilePhoto(),
                    ).then((value) => setState(() => {})),
                    child: const Text('Upload photo'),
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
