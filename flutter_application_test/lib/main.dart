import 'package:flutter/material.dart';
import 'package:flutter_application_test/home_page.dart';
import 'package:flutter_application_test/people_page.dart';

void main() {
  runApp(
    MaterialApp(
      // theme: ThemeData(primarySwatch: Colors.blue),
      home: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // const Home({super.key});
  int _currentPage = 0;
  List<Widget> pages = [
    HomePage(),
    PeoplePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter"),
      ),
      body: pages[_currentPage],
      bottomNavigationBar: NavigationBar(
        destinations: [
          NavigationDestination(icon: Icon(Icons.home_filled), label: 'home'),
          NavigationDestination(icon: Icon(Icons.person_2), label: 'People'),
        ],
        onDestinationSelected: (int index) {
          setState(() {
            _currentPage = index;
          });
        },
        selectedIndex: _currentPage,
      ),
      floatingActionButton: const FloatingActionButton(
        onPressed: null,
        child: Icon(Icons.add),
      ),
    );
  }
}
