import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/widgets/theme/theming.dart';

void main() {
  runApp(const LittleLibrary());
}

class LittleLibrary extends StatelessWidget {
  const LittleLibrary({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
       title: 'Little Library',
        theme: themeData,
        debugShowCheckedModeBanner: false,
        onGenerateRoute: Routes().generateRoute,
        // initialRoute: Routes.,
    );
  }
}