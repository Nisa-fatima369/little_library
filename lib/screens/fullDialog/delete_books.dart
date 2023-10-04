import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/delete_book_button.dart';

class DeleteBook extends StatelessWidget {
  const DeleteBook({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background2,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.close),
        ),
        title:
            Text('Delete Book?', style: Theme.of(context).textTheme.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            y80,
            Image.asset(
              'assets/images/deleteScreen.png',
              fit: BoxFit.contain,
            ),
            y20,
            Text(
              'This will remove the book completely from the app but you can always create a new book!',
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.placeholderText),
            ),
            y30,
            const DeleteBookButton(),
          ],
        ),
      ),
    );
  }
}
