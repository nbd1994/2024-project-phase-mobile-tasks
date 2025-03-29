import 'package:flutter/material.dart';
import 'package:gdg_task_1_food_ordering_app/cart_page.dart';
import 'package:gdg_task_1_food_ordering_app/profile_page.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({ super.key });

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> pagesList = [
      CartPage(),
      ProfilePage(),
    ];
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        backgroundColor: Color.fromARGB(0, 0, 0, 255),
        selectedIndex: currentPageIndex,
        onDestinationSelected: (int index){
          setState(() {
            currentPageIndex = index;
          });
        },
        destinations:[
        NavigationDestination(icon: Icon(Icons.home), label: 'home'),
        NavigationDestination(icon: Icon(Icons.person), label: 'profile')
       ]),

       body: pagesList[currentPageIndex],
    );

  }
}