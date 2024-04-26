import 'package:flutter/material.dart';
import '../main.dart';
import '../classes/food_card.dart';

class ShowAllScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic>? args = ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;

    final String _title = args?['title'] ?? '';
    final List<Map<String, dynamic>> _items = args?['items'] ?? [];

    return Scaffold(
      appBar: AppBar(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.dining_sharp),
            SizedBox(width: 8.0),
            Text(
              _title,
              style: MyApp.h1,
            ),
          ],
        ),
        centerTitle: true,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.grey, // Set border color to grey
            width: 1.0,
          ),
        ),
      ),
      body: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: FoodCard(
              _items[index]['imagePath'],
              _items[index]['name'],
              _items[index]['address'],
              _items[index]['category'],
              true
            ),
          );
        },
      ),
      backgroundColor: MyApp.default_background,
    );
  }
}
