import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/theme/theming.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(const LittleLibrary());
}

class LittleLibrary extends StatelessWidget {
  const LittleLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Little Library',
      theme: themeData,
      debugShowCheckedModeBanner: false,
      initialRoute: Routes.splashScreen,
      onGenerateRoute: Routes().generateRoute,
      // initialRoute: Routes.,
    );
  }
}
