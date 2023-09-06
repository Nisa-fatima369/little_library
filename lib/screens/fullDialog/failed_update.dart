import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/try_again_button.dart';

class FailedUpdate extends StatefulWidget {
  const FailedUpdate({
    Key? key,
  }) : super(key: key);

  @override
  State<FailedUpdate> createState() => _FailedUpdateState();
}

class _FailedUpdateState extends State<FailedUpdate> {
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
        title: Text('Failed to update',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.1),
            Image.asset(
              'assets/images/failedUpdate.png',
              fit: BoxFit.contain,
            ),
            SizedBox(height: size.height * 0.03),
            TryAgainButton(),
          ],
        ),
      ),
    );
  }
}
