import 'package:flutter/material.dart';
import 'package:uts_ambw/classes/food_card.dart';
import '../main.dart';

class HomeScreen extends StatelessWidget {
  final List<Map<String, dynamic>> most_popular = [
    {
      'imagePath': 'assets/kfc_logo.png',
      'name': 'KFC Siwalan',
      'address': 'Siwalankerto No. 21',
      'category': 'American, Fast Food',
    },
    {
      'imagePath': 'assets/yosh_logo.jpg',
      'name': 'Yoshinoya Siwalan',
      'address': 'Siwalankerto No. 22',
      'category': 'Japanese',
    },
    {
      'imagePath': 'assets/bk_logo.png',
      'name': 'Burger King Siwalan',
      'address': 'Siwalankerto No. 23',
      'category': 'American, Fast Food',
    },
    {
      'imagePath': 'assets/mcd_logo.png',
      'name': "McDonald's Siwalan",
      'address': 'Siwalankerto No. 24',
      'category': 'Fast Food',
    },
  ];

  final List<Map<String, dynamic>> _meal_deals = [
    {
      'imagePath': 'assets/fami_logo.jpeg',
      'name': 'Family Mart',
      'address': 'The Square Apt',
      'category': 'Japanese, Supermarket',
    },
    {
      'imagePath': 'assets/bk_logo.png',
      'name': 'Burger King Siwalan',
      'address': 'Siwalankerto No. 23',
      'category': 'American, Fast Food',
    },
    {
      'imagePath': 'assets/lawson_logo.png',
      'name': 'Lawson Kutisari',
      'address': 'Kutisari No. 19',
      'category': 'Korean, Supermarket',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.location_on),
            SizedBox(width: 8.0),
            Text(
              'Siwalankerto, Surabaya',
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
      body: ListView(
        children: [
          Padding(
            padding: MyApp.default_padding,
            child: TextField(
              decoration: InputDecoration(
                contentPadding: MyApp.default_padding,
                prefixIcon: Icon(Icons.search),
                hintText: 'Search for restaurants...',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Colors.grey, width: 1.0),  // Change enabled border color
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: BorderSide(color: Theme.of(context).primaryColor, width: 1.0),  // Change focused border color
                ),
                filled: true,
                fillColor: MyApp.default_background,
              ),
            ),
          ),
          SizedBox(
            height: 250.0,
            child: Banner(),
          ),
          Padding(
            padding: MyApp.default_padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Most Popular',
                  style: MyApp.h2,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context,
                      '/show_all',
                      arguments: {
                        'title': 'Most Popular',
                        'items': most_popular,
                      }
                    );
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          HorizontalScroll(most_popular),
          Padding(
            padding: MyApp.default_padding,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Meal Deals',
                  style: MyApp.h2,
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pushNamed(context,
                        '/show_all',
                        arguments: {
                          'title': 'Meal Deals',
                          'items': _meal_deals,
                        }
                    );
                  },
                  child: Text(
                    'See All',
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ],
            ),
          ),
          HorizontalScroll(_meal_deals),
        ],
      ),
      backgroundColor: MyApp.default_background,
    );
  }
}


class Banner extends StatefulWidget {
  @override
  _BannerState createState() => _BannerState();
}

class _BannerState extends State<Banner> {
  int _currentIndex = 0;

  final List<Map<String, dynamic>> _items = [
    {
      'image': 'assets/barbeque.jpg',
      'title': 'Barbeque',
      'subtitle': '12 places nearby',
    },
    {
      'image': 'assets/healthy.jpg',
      'title': 'Healthy',
      'subtitle': '8 places nearby',
    },
    {
      'image': 'assets/dessert.jpg',
      'title': 'Dessert',
      'subtitle': '15 places nearby',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemCount: _items.length,
      onPageChanged: (index) {
        setState(() {
          _currentIndex = index;
        });
      },
      itemBuilder: (context, index) {
        return Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(
              _items[index]['image'],
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      _items[index]['title'],
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      _items[index]['subtitle'],
                      style: const TextStyle(
                        fontSize: 14.0,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Row(
                children: List.generate(
                  _items.length,
                      (i) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: CircleAvatar(
                      radius: 5.0,
                      backgroundColor: i == _currentIndex
                          ? Theme.of(context).colorScheme.onPrimary
                          : Theme.of(context)
                          .colorScheme
                          .onPrimary
                          .withOpacity(0.5),
                      // Add menu icon or text here
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}

class HorizontalScroll extends StatelessWidget {
  final List<Map<String, dynamic>> _items;

  HorizontalScroll(this._items);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _items.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: FoodCard(
              _items[index]['imagePath'],
              _items[index]['name'],
              _items[index]['address'],
              _items[index]['category'],
              false
            ),
          );
        },
      ),
    );
  }
}