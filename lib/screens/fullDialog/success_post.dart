import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/buttons.dart';

class SuccessPost extends StatefulWidget {
  const SuccessPost({
    Key? key,
  }) : super(key: key);

  @override
  State<SuccessPost> createState() => _SuccessPostState();
}

class _SuccessPostState extends State<SuccessPost> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background2,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close),
        ),
        title: Text('Successfully posted!',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.1),
            Image.asset(
              'assets/images/post_success_illustration.png',
              fit: BoxFit.contain,
              scale: 0.75,
            ),
            SizedBox(height: size.height * 0.03),
            ViewButton(),
          ],
        ),
      ),
    );
  }
}

