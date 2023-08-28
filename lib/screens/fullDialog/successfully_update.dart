import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/buttons.dart';

class SuccessfullyUpdate extends StatefulWidget {
  const SuccessfullyUpdate({
    Key? key,
  }) : super(key: key);

  @override
  State<SuccessfullyUpdate> createState() => _SuccessfullyUpdateState();
}

class _SuccessfullyUpdateState extends State<SuccessfullyUpdate> {
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
        title: Text('Successfully updated!',
            style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height * 0.1),
            Image.asset(
              'assets/images/successfullyUpdate.png',
              fit: BoxFit.contain,
            ),
            SizedBox(height: size.height * 0.03),
            ViewUpdateButton(),
          ],
        ),
      ),
    );
  }
}
