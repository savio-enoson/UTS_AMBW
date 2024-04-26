import 'package:flutter/material.dart';
import 'package:uts_ambw/main.dart';

class FoodCard extends StatelessWidget {
  final String _imagePath;
  final String _name;
  final String _address;
  final String _category;
  final bool _full_size;

  FoodCard(this._imagePath, this._name, this._address, this._category, this._full_size);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: MyApp.default_padding,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15.0),
      ),
      child: Column(
        children: <Widget>[
          Container(
            height: _full_size? 200 : 75,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(15.0),
                topRight: Radius.circular(15.0),
              ),
            ),
            child: Image.asset(
              _imagePath,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            height: _full_size? null : 65,
            width: _full_size? double.infinity : null,
            decoration: const BoxDecoration(
              color: MyApp.default_background,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(15.0),
                bottomRight: Radius.circular(15.0),
              ),
            ),
            padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  _name, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 12.0),
                ),
                const SizedBox(height: 4.0),
                Text(
                  _address, style: const TextStyle(fontSize: 10.0, color: Colors.black54),
                ),
                const SizedBox(height: 2.0),
                Text(
                  _category, style: const TextStyle(fontStyle: FontStyle.italic,
                    fontSize: 10.0, color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
