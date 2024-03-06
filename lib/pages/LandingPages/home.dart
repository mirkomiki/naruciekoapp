import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:naruciekoapp/pages/LandingPages/pages.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/services/auth.dart';
import 'package:naruciekoapp/services/database.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Naruči naše'),
        backgroundColor: Color.fromARGB(255, 26, 102, 65),
        actions: [
          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
              setState(() {
                
              });
            },
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.count(
          crossAxisCount: 3, // 3 columns
          mainAxisSpacing: 8.0,
          crossAxisSpacing: 8.0,
          children: [
            _buildCategoryButton(context, "Voće", Icons.local_florist, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => FruitPage()),
              );
            }),
            _buildCategoryButton(context, "Povrće", Icons.local_florist, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => VegetablesPage()),
              );
            }),
            _buildCategoryButton(
                context, "Meso", Icons.local_florist, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MeatPage()),
              );
            }),
            _buildCategoryButton(
                context, "Mliječni proizvodi", Icons.local_florist, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DairyPage()),
              );
            }),
            _buildCategoryButton(context, "Sokovi", Icons.local_florist, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JuicePage()),
              );
            }),
            _buildCategoryButton(
                context, "Ulje i ocat", Icons.local_florist, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OilAndVinegarPage()),
              );
            }),
            _buildCategoryButton(context, "Med i džem", Icons.local_florist, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HoneyPage()),
              );
            }),
            _buildCategoryButton(context, "Sadnice", Icons.local_florist, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => JamPage()),
              );
            }),
            _buildCategoryButton(context, "Ostalo", Icons.local_florist, () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OtherPage()),
              );
            }),
          ],
        ),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => const Pages(),
            ),
          );
        },
        child: const Text("Home"),
      ),
    );
  }

  Widget _buildCategoryButton(BuildContext context, String title, IconData icon, VoidCallback onPressed) {
    return ElevatedButton.icon(
      onPressed: onPressed,
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(Colors.lightGreen), // Change button color to light green
        foregroundColor: MaterialStateProperty.all<Color>(Colors.black), // Change text color to black
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(8)), // Adjust padding
      ),
      icon: Icon(icon), // Add icon
      label: Text(
        title,
        style: TextStyle(fontSize: 16),
      ),
    );
  }
}
class FruitPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Voće'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Pretraži voće...',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          SizedBox(height: 20), // Add spacing between search bar and cards
          _buildFruitCard(
            context,
            'Jabuke',
            'assets/blank-profile-image.jpg', // Example relative path to the image file
          ),
          SizedBox(height: 20), // Add spacing between cards
          _buildFruitCard(
            context,
            'Naranče',
            'assets/blank-profile-image.jpg', // Example relative path to the image file
          ),
        ],
      ),
    );
  }

  Widget _buildFruitCard(BuildContext context, String name, String imagePath) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  AppleSellersPage()), // Navigate to AppleSellersPage
        );
      },
      child: Card(
        margin: EdgeInsets.all(16),
        child: ListTile(
          leading: Image.asset(
            imagePath,
            width: 100, // Adjust image width as needed
            height: 100, // Adjust image height as needed
            fit: BoxFit.cover,
          ),
          title: Text(name),
        ),
      ),
    );
  }
}

class AppleSellersPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sellers of Jabuke'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          _buildAppleSellerCard('OPG Weiner', 'Spickovina', '5 € / kg',
              'assets/blank-profile-image.jpg', 5),
          _buildAppleSellerCard('OPG Mikro Bušilica', 'Babina Guzica',
              '6 € / kg', 'assets/blank-profile-image.jpg', 2),
        ],
      ),
    );
  }

  Widget _buildAppleSellerCard(String opgName, String village, String price,
      String imagePath, int rating) {
    return Card(
      margin: EdgeInsets.all(16),
      child: ListTile(
        leading: Image.asset(
          imagePath,
          width: 100, // Adjust image width as needed
          height: 100, // Adjust image height as needed
          fit: BoxFit.cover,
        ),
        title: Text(opgName),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(village), // Display village
            Text(price),
            SizedBox(height: 5), // Add spacing between village and rating
            Row(
              children: [
                Icon(Icons.star,
                    color: const Color.fromARGB(255, 255, 218, 7),
                    size: 20), // Star icon for rating
                SizedBox(width: 5),
                Text('$rating / 5'), // Display rating
              ],
            ),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () {
                // Handle decrease quantity
              },
              icon: Icon(Icons.remove),
            ),
            Text('0'), // Display quantity (non-functional)
            IconButton(
              onPressed: () {
                // Handle increase quantity
              },
              icon: Icon(Icons.add),
            ),
          ],
        ),
      ),
    );
  }
}

class VegetablesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Povrće'),
      ),
      body: Center(
        child: Text('Stranica s povrćem'),
      ),
    );
  }
}

class DairyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meso i mliječni proizvodi'),
      ),
      body: Center(
        child: Text('Stranica s mesom i mliječnim proizvodima'),
      ),
    );
  }
}

class MeatPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ostalo'),
      ),
      body: Center(
        child: Text('Stranica s ostalim proizvodima'),
      ),
    );
  }
}
class JuicePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sokovi'),
      ),
      body: Center(
        child: Text('Stranica s sokovima'),
      ),
    );
  }
}

class OilAndVinegarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sokovi'),
      ),
      body: Center(
        child: Text('Stranica s sokovima'),
      ),
    );
  }
}

class OtherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ostalo'),
      ),
      body: Center(
        child: Text('Stranica s sokovima'),
      ),
    );
  }
}

class HoneyPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Med'),
      ),
      body: Center(
        child: Text('Stranica s medom'),
      ),
    );
  }
}

class JamPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Med'),
      ),
      body: Center(
        child: Text('Stranica s medom'),
      ),
    );
  }
}
