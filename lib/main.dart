import 'package:flutter/material.dart';
import 'screens/home_screen.dart';
import 'screens/discover_screen.dart';
import 'screens/top_picks_screen.dart';
import 'screens/bookmarked_screen.dart';
import 'screens/profile_screen.dart';
import 'screens/show_all.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  static const Color default_background = Colors.white;
  static const Color border_color = Colors.white60;
  static const TextStyle h1 = TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0);
  static const TextStyle h2 = TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0);
  static const TextStyle h3 = TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0);
  static const default_padding = EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CrapFood Delivery',
      theme: ThemeData(
        primarySwatch: Colors.green,
        primaryColorLight: default_background,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.green,
          brightness: Brightness.light,
        ).copyWith(
          onPrimary: Colors.white,
        ),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => NavigationBar(),
        '/show_all' : (context) => ShowAllScreen(),
      },
    );
  }
}

class NavigationBar extends StatefulWidget {
  @override
  _NavigationBarState createState() => _NavigationBarState();
}

class _NavigationBarState extends State<NavigationBar> {
  int _selectedIndex = 0;

  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    DiscoverScreen(),
    BookmarkedScreen(),
    TopPicksScreen(),
    ProfileScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        selectedItemColor: Theme.of(context).colorScheme.onPrimary,
        unselectedItemColor: Theme.of(context).colorScheme.onPrimary.withOpacity(0.5),
        showUnselectedLabels: true,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Discover',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark),
            label: 'Bookmarked',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'Top Picks',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}