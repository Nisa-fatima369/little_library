import 'package:flutter/material.dart';
import 'package:little_library/widgets/theme/colors.dart';
import 'package:little_library/widgets/buttons.dart';

class DeleteBook extends StatelessWidget {
  const DeleteBook({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.background2,
      //   leading: GestureDetector(
      //     onTap: () {
      //       Navigator.pop(context);
      //     },
      //     child: const Icon(
      //       Icons.close,
      //     ),
      //   ),
      //   title: const Text(
      //     'Delete Book?',
      //     style: TextStyle(color: AppColors.primaryText),
      //   ),
      // ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 50),
        child: Column(
          children: [
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(
                    Icons.close,
                  ),
                ),
                SizedBox(width: size.width * 0.07),
                Text(
                  'Delete Book?',
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              ],
            ),
            SizedBox(height: size.height * 0.02),
            Container(
              height: size.height * 0.5,
              color: AppColors.border,
              // child: Image.asset('assets/images/post_success_illustration.png'),
            ),
            SizedBox(height: size.height * 0.02),
            Text(
              'This will remove the book completely from the app but you can always create a new book!',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.placeholderText),
            ),
            SizedBox(height: size.height * 0.02),
            DeleteBookButton(),
          ],
        ),
      ),
    );
  }
}
