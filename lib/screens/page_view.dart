import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/screens/HomePage/home.dart';
import 'package:little_library/screens/addBookPage/add_book.dart';
import 'package:little_library/screens/chatPage/contact.dart';
import 'package:little_library/screens/exploreBooks/location.dart';
import 'package:little_library/screens/profilePage/profile.dart';
import 'package:little_library/theme/colors.dart';

class PageVieew extends StatefulWidget {
  const PageVieew({super.key});

  @override
  State<PageVieew> createState() => _PageVieewState();
}

class _PageVieewState extends State<PageVieew> {
  // int? currentIndex;
  int selectedIndex = 0;
  PageController pageController = PageController();
  List<Widget> screens = [
    const Home(),
    const Location(),
    const SizedBox.shrink(),
    const Contacts(),
    const Profile(),
  ];

  void _animateToPage(int pageIndex) {
    setState(() {
      selectedIndex = pageIndex;
    });
  }

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.home},
    {'icon': Icons.explore},
    {'icon': Icons.add},
    {'icon': Icons.chat},
    {'icon': Icons.person},
  ];

  @override
  void initState() {
    pageController.addListener(() {
      if (pageController.page == 2) {
        Navigator.pushNamed(context, Routes.addBook, arguments: pageController);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final isAddBook = selectedIndex == 2;
    return Scaffold(
      body: SafeArea(
        child: screens[selectedIndex],
      ),
      bottomNavigationBar: AnimatedContainer(
        duration: const Duration(milliseconds: 500),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        decoration: const BoxDecoration(color: AppColors.primary),
        child: Row(
          children: items.asMap().entries.map((item) {
            final isCurrent = item.key == selectedIndex;

            return Expanded(
              child: GestureDetector(
                onTap: () {
                  if (item.key != 2) {
                    _animateToPage(item.key);
                  } else {
                    final media = MediaQueryData.fromView(View.of(context));
                    showModalBottomSheet(
                      constraints: BoxConstraints(
                        maxHeight: media.size.height - media.padding.top,
                        minHeight: media.size.height - media.padding.top,
                      ),
                      isScrollControlled: true,
                      isDismissible: false,
                      enableDrag: false,
                      context: context,
                      builder: (context) {
                        return const AddBook();
                      },
                    );
                  }
                },
                child: item.key == 2
                    ? Image.asset(
                        'assets/icons/add_box.png',
                        height: 30,
                        width: 30,
                      )
                    : Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: isCurrent
                              ? AppColors.secondary
                              : Colors.transparent,
                        ),
                        child: Icon(
                          item.value['icon'],
                          size: isCurrent ? 30 : 26,
                          color: isCurrent
                              ? AppColors.background2
                              : AppColors.secondary,
                        ),
                      ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}


    

