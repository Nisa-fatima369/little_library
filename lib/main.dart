import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/theme/theming.dart';
import 'package:location/location.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp;
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  runApp(LittleLibrary());
}

class LittleLibrary extends StatelessWidget {
  LittleLibrary({super.key}) {
    location.requestPermission().then((value) async {
      if (value == PermissionStatus.granted) {
        location.getLocation().then((value) {
          print(value);
        });
      }
    }).catchError((onError) {
      location.requestPermission().then((value) async {
        if (value == PermissionStatus.granted) {
          location.getLocation().then((value) {
            print(value);
          });
        }
      });
    });
  }
  Location location = Location();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Little Library',
      theme: themeData,

      debugShowCheckedModeBanner: false,
      onGenerateRoute: Routes().generateRoute,
      // initialRoute: Routes.,
    );
  }
}
