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
            _buildCategoryButton(context, "Voće", Icons.local_florist),
            _buildCategoryButton(context, "Povrće", Icons.local_florist),
            _buildCategoryButton(context, "Pića", Icons.local_florist),
            _buildCategoryButton(
                context, "Mliječni proizvodi", Icons.local_florist),
            _buildCategoryButton(context, "Med i džem", Icons.local_florist),
            _buildCategoryButton(context, "Ostalo", Icons.local_florist),
            // Add more category buttons here
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryButton(
      BuildContext context, String title, IconData icon) {
    return ElevatedButton.icon(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CategoryPage(category: title.toLowerCase()),
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
