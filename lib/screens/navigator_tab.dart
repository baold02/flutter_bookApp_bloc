import 'package:book_app/screens/favorite_screen.dart';
import 'package:book_app/screens/home_screen.dart';
import 'package:book_app/screens/search_screen.dart';
import 'package:book_app/utils/app_style.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'card_screen.dart';
import 'me_screen.dart';

class NavivatorTabCustom extends StatefulWidget {
  const NavivatorTabCustom({Key? key}) : super(key: key);

  @override
  State<NavivatorTabCustom> createState() => _NavivatorTabCustomState();
}

class _NavivatorTabCustomState extends State<NavivatorTabCustom> {
  int _currentIndex = 0;
  List tab = [const HomeScreen(), const CartScreen(), const FavoriteScreen(), HomePage(),const MeScreen()];
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: tab[_currentIndex],
      bottomNavigationBar: CustomNavigationBar(

        iconSize: 30.0,
        selectedColor: Colors.orange,
        strokeColor: Colors.transparent,
        unSelectedColor: kGrey,
        backgroundColor: kBrown,
        items: [
          CustomNavigationBarItem(
            icon: const Icon(Icons.home),
            title:const  Text("Home",style: TextStyle(color: Colors.white)),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.shopping_cart),
            title: const Text("Cart",style: TextStyle(color: Colors.white)),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            title: const Text("Favorite",style: TextStyle(color: Colors.white)),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.search),
            title: const Text("Search",style: TextStyle(color: Colors.white)),
          ),
          CustomNavigationBarItem(
            icon: const Icon(Icons.account_circle),
            title: const Text("Me",style: TextStyle(color: Colors.white)),
          ),
        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}
