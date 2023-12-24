import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';

class DeleteBook extends StatefulWidget {
  final String? book;
  const DeleteBook({super.key, this.book});

  @override
  State<DeleteBook> createState() => _DeleteBookState();
}

class _DeleteBookState extends State<DeleteBook> {
  bool isBookUploaded = false;
  bool isBookDeleted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background2,
        leading: GestureDetector(
          onTap: () {
            Navigator.popAndPushNamed(context, Routes.myBooks);
            setState(() {});
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
            GestureDetector(
              onTap: () async {
                try {
                  await FirebaseFirestore.instance
                      .collection('books')
                      .doc(widget.book)
                      .delete();
                } catch (e) {
                  print(e.toString());
                }
                Navigator.popAndPushNamed(context, Routes.myBooks);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Book deleted successfully!'),
                  ),
                );
                setState(() {});
              },
              child: Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.failure,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    'CONFIRM DELETE',
                    style: Theme.of(context)
                        .textTheme
                        .labelLarge!
                        .copyWith(color: AppColors.background2),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
