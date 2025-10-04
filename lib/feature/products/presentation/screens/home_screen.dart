import 'package:ecommerce_spinecode/core%20/constant/color_constant.dart';
import 'package:ecommerce_spinecode/feature/products/presentation/screens/cart_screen.dart';
import 'package:ecommerce_spinecode/feature/products/presentation/screens/customer_dashboard.dart';
import 'package:ecommerce_spinecode/feature/products/presentation/screens/profile_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    void onItemTapped(int index) {
      setState(() {
        selectedIndex = index;
      });
    }

    final List<Widget> screens = [
      CustomerDashboard(),
      CartScreen(),
      ProfileScreen(),
    ];
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.green.shade100,
        currentIndex: selectedIndex,
        onTap: onItemTapped,

        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: ColorConstants.mainblack),
            label: "home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.card_travel, color: ColorConstants.mainblack),
            label: "cart",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.black),
            label: "profile",
          ),
        ],
      ),

      body: screens[selectedIndex],
    );
  }
}
