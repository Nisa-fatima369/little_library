import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/widgets/theme/colors.dart';
import 'package:little_library/widgets/buttons.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background2,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.close,
          ),
        ),
        title: const Text(
          'Successfully posted!',
          style: TextStyle(color: AppColors.primaryText),
        ),
      ),
      body: Column(
        children: [
          Image.asset('assets/images/post_success_illustration.png'),
          PrimaryTextButton(
            buttonTitle: 'VIEW POST',
            
          ),
        ],
      ),
    );
  }
}
