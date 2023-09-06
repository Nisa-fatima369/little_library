import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/try_again_button.dart';

class FailedPost extends StatefulWidget {
  const FailedPost({super.key});

  @override
  State<FailedPost> createState() => _FailedPostState();
}

class _FailedPostState extends State<FailedPost> {
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
        title: Text('Failed to upload!',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.1),
            Image.asset(
              'assets/images/post_failed_illustration.png',
              fit: BoxFit.contain,
              scale: 0.75,
            ),
            SizedBox(height: size.height * 0.03),
            TryAgainButton(),
          ],
        ),
      ),
    );
  }
}
