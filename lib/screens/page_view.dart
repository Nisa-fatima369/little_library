import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/screens/add_book.dart';
import 'package:little_library/screens/contact.dart';
import 'package:little_library/screens/home.dart';
import 'package:little_library/screens/location.dart';
import 'package:little_library/screens/profile.dart';
import 'package:little_library/widgets/theme/colors.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PageVieew extends StatefulWidget {
  const PageVieew({super.key});

  @override
  State<PageVieew> createState() => _PageVieewState();
}

class _PageVieewState extends State<PageVieew> {
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
        Navigator.pushNamed(context, Routes.addBook, arguments: _pageController);
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
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.height * 0.1,
        decoration: const BoxDecoration(
          // color: AppColors.primary,
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(10),
            topLeft: Radius.circular(10),
          ),
        ),
        child: BottomNavigationBar(
          fixedColor: AppColors.primary,
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
                decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.home,
                  color: AppColors.background1,
                ),
              ),
              icon: const Icon(Icons.home),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  FontAwesomeIcons.compass,
                  color: AppColors.background1,
                ),
              ),
              icon: const Icon(
                FontAwesomeIcons.compass,
                color: AppColors.secondary,
              ),
              label: '',
            ),
            const BottomNavigationBarItem(
              icon: Icon(
                Icons.add_circle_outline_rounded,
                color: AppColors.failure,
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.chat,
                  color: AppColors.background1,
                ),
              ),
              icon: const Icon(Icons.chat),
              label: '',
            ),
            BottomNavigationBarItem(
              activeIcon: Container(
                decoration: BoxDecoration(color: AppColors.secondary, borderRadius: BorderRadius.circular(30)),
                padding: const EdgeInsets.all(8),
                child: const Icon(
                  Icons.person,
                  color: AppColors.background1,
                ),
              ),
              icon: const Icon(Icons.person),
              label: '',
            ),
          ],
        ),
      ),
    );
  }
}
