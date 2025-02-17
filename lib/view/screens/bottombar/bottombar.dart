// ignore_for_file: prefer_const_constructors, library_private_types_in_public_api

import 'package:car_wash_light/controllers/home/home_controller.dart';
import 'package:car_wash_light/view/screens/home/edit.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/app_colors.dart';
import '../../../constants/app_images.dart';
import '../condition/condition.dart';
import '../home/home.dart';
import '../profile/profile.dart';

class Bottombar extends StatefulWidget {
  Bottombar({super.key});

  @override
  _BottombarState createState() => _BottombarState();
}

class _BottombarState extends State<Bottombar> {
  int _selectedIndex = 0;


  //HomeController homeController = Get.find();


  final List<Widget> _screens = [
    Home(),
//    Placeholder(),
    Edit(),
    ConditionPage(),
    Profile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        selectedItemColor: kGreenColor,
        unselectedItemColor: kDarkGreyColor,
        selectedLabelStyle: TextStyle(
          color: kDarkGreyColor,
          fontFamily: 'Montserrat',
          fontSize: 13.547,
          fontWeight: FontWeight.w400,
        ),
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: _buildIcon(Assets.imagesHomeicon, 0),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Assets.imagesGroupicon, 1),
            label: 'Group',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Assets.imagesConditionicon, 2),
            label: 'Conditions',
          ),
          BottomNavigationBarItem(
            icon: _buildIcon(Assets.imagesProfileicon, 3),
            label: 'Profile',
          ),
        ],
      ),
    );
  }

  Widget _buildIcon(String path, int index) {
    return Image.asset(
      path,
      height: 20,
      color: _selectedIndex == index ? kGreenColor : kDarkGreyColor,
    );
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
}
