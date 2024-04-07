import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/models/user_models/user_functions.dart';
import 'package:naruciekoapp/services/database.dart';
import 'package:path/path.dart';

class UploadProfilePhoto extends StatefulWidget {
  const UploadProfilePhoto({super.key});

  @override
  State<UploadProfilePhoto> createState() => _UploadProfilePhotoState();
}

class _UploadProfilePhotoState extends State<UploadProfilePhoto> {
  File? image;
  Future pickImage(ImageSource source) async {
    try {
      final image = await ImagePicker().pickImage(source: source);
      if (image == null) return;

      final imageTemporary = File(image.path);
      try {
        String imageName = basename(image.path);
        final uid = FirebaseAuth.instance.currentUser?.uid;
        await DatabaseService(uid: uid).updateProfileImageName(imageName);
        final profilePictures =
            FirebaseStorage.instance.ref('profileImages/$imageName');
        await profilePictures.putFile(imageTemporary);
      } on FirebaseException catch (e) {
        print('Failed to put profile image in storage');
      }
      setState(() => this.image = imageTemporary);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            image != null
                ? CircleAvatar(
                    radius: 40,
                    backgroundImage: Image.file(image!).image,
                  )
                : CircleAvatar(
                    radius: 40,
                    child: globalUser.profileImage,
                  ),
            Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton.icon(
                    onPressed: () => {pickImage(ImageSource.gallery)},
                    icon: const Icon(Icons.photo_library_outlined),
                    label: const Text('From Gallery')),
                ElevatedButton.icon(
                    onPressed: () => {pickImage(ImageSource.camera)},
                    icon: const Icon(Icons.add_a_photo_outlined),
                    label: const Text('From Camera')),
                const SizedBox(height: 15),
                Row(
                  children: [
                    TextButton(
                      onPressed: () {
                        globalUser.profileImage = Image.file(image!);
                        UserFunctions(uid: globalUser.uid)
                            .updateUserProfileImage(globalUser);
                        Navigator.pop(context);
                      },
                      child: const Text('Close and save'),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text('Discard',
                          style: TextStyle(color: Colors.red)),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
