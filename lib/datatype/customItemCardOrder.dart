import 'package:flutter/material.dart';
import 'package:naruciekoapp/globalData.dart';
import 'package:naruciekoapp/models/item_models/item_model.dart';

class CustomItemCardOrder extends StatefulWidget {
  CustomItemCardOrder({
    super.key,
    required this.item,
  });
  late ItemModel item;
  @override
  State<CustomItemCardOrder> createState() => _CustomItemCardOrderState();
}

class _CustomItemCardOrderState extends State<CustomItemCardOrder> {
  void incrementQuantity() {
    setState(() {
      widget.item.quantity = widget.item.quantity! + 1;
    });
  }

  void decrementQuantity() {
    if (widget.item.quantity! > 0) {
      setState(() {
        widget.item.quantity = widget.item.quantity! - 1;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 2,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    widget.item.name!,
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  Text(
                    '${(widget.item.price! * widget.item.quantity!).toString()} €',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: decrementQuantity,
                  icon: Icon(Icons.remove),
                  color: Colors.red,
                ),
                Text('${widget.item.quantity}'),
                IconButton(
                  onPressed: incrementQuantity,
                  icon: Icon(Icons.add),
                  color: Colors.green,
                ),
              ],
            ),
          ],
        ));
  }
}
