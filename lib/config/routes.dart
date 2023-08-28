import 'package:flutter/material.dart';
import 'package:little_library/screens/add_book.dart';
import 'package:little_library/screens/chat.dart';
import 'package:little_library/screens/description.dart';
import 'package:little_library/screens/home.dart';
import 'package:little_library/screens/location.dart';
import 'package:little_library/screens/login_screen.dart';
import 'package:little_library/screens/my_books.dart';
import 'package:little_library/screens/page_view.dart';
import 'package:little_library/screens/profile.dart';
import 'package:little_library/screens/saved_books.dart';
import 'package:little_library/screens/signup.dart';
import 'package:little_library/screens/splash_screen.dart';
import 'package:little_library/screens/contact.dart';
import 'package:page_transition/page_transition.dart';
import 'package:little_library/screens/edit_book_details.dart';

class Routes {
  static const String splashScreen = 'splashScreen';
  static const String signupScreen = 'signupScreen';
  static const String loginScreen = 'loginScreen';
  static const String pageView = 'pageView';
  static const String home = 'home';
  static const String location = 'location';
  static const String addBook = 'addBook';
  static const String chat = 'chat';
  static const String profile = 'profile';
  static const String description = 'description';
  static const String contact = 'contact';
  static const String myBooks = 'myBooks';
  static const String savedBooks = 'savedBooks';
  static const String editBookDetails = 'editBookDetails';

  PageTransition<dynamic> generateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case splashScreen:
        return PageTransition(
            alignment: Alignment.center,
            child: const SplashScreen(),
            type: PageTransitionType.scale);
      case signupScreen:
        return PageTransition(
            alignment: Alignment.center,
            child: const Signup(),
            type: PageTransitionType.scale);
      case loginScreen:
        return PageTransition(
            alignment: Alignment.center,
            child: const LoginScreen(),
            type: PageTransitionType.scale);
      case pageView:
        return PageTransition(
            alignment: Alignment.center,
            child: const PageVieew(),
            type: PageTransitionType.scale);
      case home:
        return PageTransition(
            alignment: Alignment.center,
            child: const Home(),
            type: PageTransitionType.scale);
      case location:
        return PageTransition(
            alignment: Alignment.center,
            child: const Location(),
            type: PageTransitionType.scale);
      case addBook:
        return PageTransition(
          duration: Duration(milliseconds: 500),
          alignment: Alignment.center,
          child: AddBook(
              pageController: routeSettings.arguments as PageController),
          type: PageTransitionType.bottomToTop,
        );
      case chat:
        return PageTransition(
            alignment: Alignment.center,
            child: const Chat(),
            type: PageTransitionType.scale);
      case profile:
        return PageTransition(
            alignment: Alignment.center,
            child: const Profile(),
            type: PageTransitionType.scale);
      case description:
        return PageTransition(
            alignment: Alignment.center,
            child: const Description(),
            type: PageTransitionType.scale);
      case contact:
        return PageTransition(
            alignment: Alignment.center,
            child: const Contacts(),
            type: PageTransitionType.scale);
      
      case myBooks:
        return PageTransition(
            alignment: Alignment.center,
            child: const MyBooks(),
            type: PageTransitionType.scale);
      case savedBooks:
        return PageTransition(
            alignment: Alignment.center,
            child: const SavedBooks(),
            type: PageTransitionType.scale);
      case editBookDetails:
        return PageTransition(
            alignment: Alignment.center,
            child: const EditBookDetails(),
            type: PageTransitionType.scale);

      default:
        return PageTransition(
            alignment: Alignment.center,
            child: const PageVieew(),
            type: PageTransitionType.scale);
    }
  }
}
