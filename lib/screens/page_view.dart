import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/screens/HomePage/home.dart';
import 'package:little_library/screens/chatPage/contact.dart';
import 'package:little_library/screens/exploreBooks/location.dart';
import 'package:little_library/screens/profilePage/profile.dart';
import 'package:little_library/theme/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageVieew extends StatefulWidget {
  const PageVieew({super.key});

  @override
  State<PageVieew> createState() => _PageVieewState();
}

class _PageVieewState extends State<PageVieew> {
  int? currentIndex;
  int selectedIndex = 0;
  PageController _pageController = PageController();
  List<Widget> screens = [
    const Home(),
    const Location(),
    Container(),
    const Contacts(),
    const Profile(),
  ];

  _animateToPage(int pageIndex) {
    _pageController.animateToPage(
      pageIndex,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void initState() {
    _pageController.addListener(() {
      if (_pageController.page == 2) {
        Navigator.pushNamed(context, Routes.addBook,
            arguments: _pageController);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (value) {
          setState(() {
            selectedIndex = value;
          });
        },
        children: screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppColors.primary,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        unselectedItemColor: AppColors.secondary,
        currentIndex: selectedIndex,
        onTap: _animateToPage,
        showUnselectedLabels: true,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Container(
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.home,
                color: AppColors.background1,
              ),
            ),
            icon: const Icon(Icons.home),
            label: '',
          ),
          // BottomNavigationBarItem(
          //   activeIcon: Container(
          //     decoration: BoxDecoration(
          //         color: AppColors.secondary,
          //         borderRadius: BorderRadius.circular(30)),
          //     padding: const EdgeInsets.all(8),
          //     child: const Icon(
          //       FontAwesomeIcons.compass,
          //       color: AppColors.background1,
          //     ),
          //   ),
          //   icon: const Icon(
          //     FontAwesomeIcons.compass,
          //     color: AppColors.secondary,
          //   ),
          //   label: '',
          // ),
          const BottomNavigationBarItem(
            icon: Icon(
              Icons.add_circle_outline_rounded,
              color: AppColors.failure,
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            activeIcon: Container(
              decoration: BoxDecoration(
                  color: AppColors.secondary,
                  borderRadius: BorderRadius.circular(30)),
              padding: const EdgeInsets.all(8),
              child: const Icon(
                Icons.chat,
                color: AppColors.background1,
              ),
            ),
            icon: const Icon(Icons.chat),
            label: '',
          ),
          //     BottomNavigationBarItem(
          //       activeIcon: Container(
          //         decoration: BoxDecoration(
          //             color: AppColors.secondary,
          //             borderRadius: BorderRadius.circular(30)),
          //         padding: const EdgeInsets.all(8),
          //         child: const Icon(
          //           Icons.person,
          //           color: AppColors.background1,
          //         ),
          //       ),
          //       icon: const Icon(Icons.person),
          //       label: '',
          //     ),
        ],
      ),
    );
  }
}
