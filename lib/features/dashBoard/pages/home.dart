


import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mojec_agent/core/constants/key_constants.dart';
import 'package:mojec_agent/core/utils/styles/color_utils.dart';
import 'package:mojec_agent/features/Booking/pagees/booking.dart';
import 'package:mojec_agent/features/earning/pages/earning.dart';
import 'package:mojec_agent/features/profile/profle.dart';

import 'dashboard.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> children = [
      Dashboard(),
      Container(),
      Booking(),
      Earning(),
      Profile(),
    ];
    return Scaffold(
      body: children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: blue,
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset("$imagePath/bottomNav/home.svg", ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon:  SvgPicture.asset("$imagePath/bottomNav/message.svg", ),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("$imagePath/bottomNav/booking.svg"),
            label: 'Booking',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("$imagePath/bottomNav/wallet.svg"),
            label: 'Earning',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset("$imagePath/bottomNav/profile.svg"),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
