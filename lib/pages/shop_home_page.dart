import 'package:flutter/material.dart';
import 'package:fruits_and_berries/models/model.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'item_details.dart';

class ShopHomePage extends StatefulWidget {
  _ShopHomePageState createState() => _ShopHomePageState();
}

class _ShopHomePageState extends State<ShopHomePage> {
  List<Item> items = foodShopItems();
  List<Item> filteredItems = foodShopItems();
  TextEditingController searchController = TextEditingController();

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              myAppBar(),
              Text('Fruits and berries',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 35,
                      color: Colors.white)),
              SizedBox(
                height: 5,
              ),
              mySearchBar(),
              SizedBox(
                height: 8,
              ),

              Expanded(
                child: MasonryGridView.builder(
                    itemCount: filteredItems.length,
                    gridDelegate:
                        SliverSimpleGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      final item = filteredItems[index];
                      return Padding(
                        padding: EdgeInsets.all(5),
                        child: GestureDetector(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ItemDetails(item: item),
                            ),
                          ),
                          child: Container(
                            padding: EdgeInsets.only(top: 15, left: 20),
                            height: item.height.toDouble(),
                            decoration: BoxDecoration(
                              color: item.bgColor,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  item.title,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16,
                                      color: Colors.black),
                                ),
                                Text(
                                  item.lb,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12,
                                      color: Colors.black),
                                ),
                                Text(
                                  '\$${item.price}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 14,
                                      color: Colors.black),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Expanded(
                                  child: Hero(
                                      tag: item.imageUrl,
                                      child: Image.asset(item.imageUrl)),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 110),
                                  child: Container(
                                    height: 41,
                                    width: 52,
                                    decoration: BoxDecoration(
                                      color: item.myItems
                                          ? item.color
                                          : Colors.transparent,
                                      border: Border.all(
                                          width: 2, color: item.color),
                                      borderRadius: BorderRadius.only(
                                        bottomRight: Radius.circular(25),
                                        topLeft: Radius.circular(25),
                                      ),
                                    ),
                                    child: Icon(
                                      item.myItems
                                          ? Icons.check_sharp
                                          : Icons.add,
                                      color: item.myItems
                                          ? Colors.white
                                          : item.color,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget mySearchBar() {
    return TextField(
      controller: searchController,
      onChanged: (value) {
        setState(() {
          filteredItems = items
              .where((item) =>
                  item.title.toLowerCase().contains(value.toLowerCase()))
              .toList();
        });
      },
      decoration: InputDecoration(
        hintText: "Search",
        hintStyle: TextStyle(fontSize: 16, color: Colors.black),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Colors.grey[100],
        contentPadding: EdgeInsets.all(15),
        prefixIcon: Padding(
          padding: EdgeInsets.only(left: 25, right: 15),
          child: Icon(Icons.search, size: 30),
        ),
      ),
    );
  }

  Widget myAppBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 22),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Icon(Icons.menu, color: Colors.white),
        ],
      ),
    );
  }
}
