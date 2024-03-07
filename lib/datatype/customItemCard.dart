import 'package:flutter/material.dart';
/*
Widget CustomItemCard(String opgName, String village, String item, String price, String imagePath, int rating) {
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
            Text(item),
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

  Widget CustomItemCard(String opgName, String village, String item, String price, String imagePath, int rating) {
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
          Text(item),
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
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                onPressed: () {
                  // Handle decrease quantity
                },
                icon: Icon(Icons.remove),
              ),
              SizedBox(width: 5),
              Text('0 kg'), // Display quantity with unit
              SizedBox(width: 5),
              IconButton(
                onPressed: () {
                  // Handle increase quantity
                },
                icon: Icon(Icons.add),
              ),
            ],
          ),
        ],
      ),
    ),
  );
} */


class CustomItemCard extends StatefulWidget {
  final String opgName;
  final String village;
  final String item;
  final String price;
  final String imagePath;
  final int rating;

  const CustomItemCard(
    this.opgName,
    this.village,
    this.item,
    this.price,
    this.imagePath,
    this.rating,
  );

  @override
  _CustomItemCardState createState() => _CustomItemCardState();
}

class _CustomItemCardState extends State<CustomItemCard> {
  int quantity = 0;

  void incrementQuantity() {
    setState(() {
      quantity++;
    });
  }

  void decrementQuantity() {
    if (quantity > 0) {
      setState(() {
        quantity--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(16),
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Image.asset(
                    widget.imagePath,
                    width: 100,
                    height: 100,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16),
                Expanded(
                  flex: 2,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.opgName),
                      Text(widget.village),
                      Text(widget.item),
                      Text(widget.price),
                      SizedBox(height: 5),
                      Row(
                        children: [
                          Icon(Icons.star,
                              color: const Color.fromARGB(255, 255, 218, 7),
                              size: 20),
                          SizedBox(width: 5),
                          Text('${widget.rating} / 5'),
                          SizedBox(width: 16),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: decrementQuantity,
                                  icon: Icon(Icons.remove),
                                  color: Colors.red,
                                ),
                                Text('$quantity kg'),
                                IconButton(
                                  onPressed: incrementQuantity,
                                  icon: Icon(Icons.add),
                                  color: Colors.green,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}



