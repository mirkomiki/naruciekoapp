import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:naruciekoapp/datatype/custom_appbar.dart';
import 'package:naruciekoapp/pages/user_pages/category_page.dart';
import 'package:naruciekoapp/pages/user_pages/editProfile.dart';
import 'package:naruciekoapp/pages/user_pages/pages.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/pages/user_pages/past_recipets.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool longPressed = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: CustomAppBar(
        title: 'Home',
      ),
      endDrawer: Drawer(
        child: Container(
          width: width * 0.3,
          padding: const EdgeInsets.only(top: 30),
          color: const Color(0XFFFEEAE6),
          child: Column(children: [
            Container(
              width: width * 0.3,
              alignment: Alignment.centerRight,
              child: CircleAvatar(
                radius: 36,
                backgroundImage: globalUser.profileImage.image,
              ),
            ),
            ListTile(
                leading: const Icon(Icons.settings),
                title: const Text(
                  'Settings',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserEdit()),
                  ).then((_) => setState(() {}));
                }),
            ListTile(
                leading: const Icon(Icons.history),
                title: const Text(
                  'Reciepts',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => PastRecipets()),
                  );
                }),
            ListTile(
                leading: const Icon(Icons.logout),
                title: const Text(
                  'Sign Out',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                onTap: () async {
                  await FirebaseAuth.instance.signOut();
                  setState(() {});
                }),
          ]),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3,
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          children: [
            _buildCategoryButton(context, "Voće", "Voce", Icons.apple),
            _buildCategoryButton(context, "Povrće", "Povrce", Icons.nature),
            _buildCategoryButton(
                context, "Pića", "PicaIAlkohol", Icons.local_florist),
            _buildCategoryButton(
                context, "Meso", "Meso", Icons.fastfood_outlined),
            _buildCategoryButton(context, "Mliječni proizvodi",
                "MlijecniProizvodi", Icons.local_drink),
            _buildCategoryButton(
                context, "Med", "Med", Icons.local_drink_outlined),
            _buildCategoryButton(
                context, "Džemovi", "Dzemovi", Icons.local_drink_outlined),
            _buildCategoryButton(context, "Jaja", "Jaja", Icons.egg),
            _buildCategoryButton(
                context, "Sadnice", "Sadnice", Icons.local_florist),
            _buildCategoryButton(
                context, "Ulje i ocat", "UljaIOcati", Icons.oil_barrel_rounded),
            _buildCategoryButton(
                context, "Ostalo", "Ostalo", Icons.local_florist),

            // Add more category buttons here
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
      BuildContext context, String title, String category, IconData icon) {
    return ElevatedButton.icon(
      onLongPress: () {
        setState(() {
          longPressed = !longPressed;
        });
      },
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(
              category: title.toLowerCase(),
              enums: category,
            ),
          ),
        );
      },
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen),
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black),
        padding:
            MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(8)),
      ),
      icon: Icon(icon),
      label: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }
}
