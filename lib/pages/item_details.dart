import 'package:flutter/material.dart';
import '../models/model.dart';

class ItemDetails extends StatelessWidget {
  final Item item;
  ItemDetails({required this.item});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: item.bgColor,
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Container(
                    width: 55,
                    height: 50,
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 183, 181, 181),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Icon(Icons.keyboard_arrow_left, size: 25),
                  ),
                ),
                Image.asset(
                  'images/two line.png',
                  height: 30,
                ),
              ],
            ),
          ),
          Center(
            child: SizedBox(
              height: 250,
              child: Hero(
                tag: item.imageUrl,
                child: Image.asset(item.imageUrl),
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 190, 188, 188),
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50),
                    topRight: Radius.circular(50)),
              ),
              child: Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        item.lb,
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              buildCounterButton(Icons.add),
                              Container(
                                height: 40,
                                width: 40,
                                color: Colors.grey[100],
                                child: Center(
                                  child: Text(
                                    "1",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                              buildCounterButton(Icons.remove),
                            ],
                          ),
                          Text('\$${item.price}',
                              style: TextStyle(fontSize: 20)),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Product Description',
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      SizedBox(height: 5),
                      Text(
                        item.description,
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          buildActionButton(Icons.favorite, item.color, true),
                          SizedBox(width: 25),
                          Expanded(
                            child: buildActionButton(Icons.shopping_cart,
                                item.color, false, "Add to cart"),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget buildCounterButton(IconData icon) {
  return Container(
    height: 40,
    width: 40,
    decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: icon == Icons.remove
            ? BorderRadius.only(
                topRight: Radius.circular(15), bottomRight: Radius.circular(15))
            : BorderRadius.only(
                topLeft: Radius.circular(15), bottomLeft: Radius.circular(15))),
    child: Icon(icon),
  );
}

Widget buildActionButton(IconData icon, Color color, bool outline,
    [String? text]) {
  return Container(
    height: 50,
    width: 50,
    decoration: BoxDecoration(
      color: outline ? Colors.white : color,
      borderRadius: BorderRadius.circular(20),
      border: outline ? Border.all(width: 2, color: color) : null,
    ),
    child: Center(
      child: text == null
          ? Icon(icon, size: 25, color: color)
          : Text(
              text,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),
    ),
  );
}
