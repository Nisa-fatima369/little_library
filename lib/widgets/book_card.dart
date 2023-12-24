import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/modal/book_modal.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/status_pills.dart';

class BookCard extends StatefulWidget {
  final Book book;
  const BookCard({
    super.key, required this.book,
    
  });

  @override
  State<BookCard> createState() => _BookCardState();
}

class _BookCardState extends State<BookCard> {
  bool isBookMarked = false;

  void toggleBookmark() {
    setState(() {
      isBookMarked = !isBookMarked;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        width: isBookMarked ? 120 : 160,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        content: Text(
          isBookMarked ? 'Book saved' : 'Book failed to save',
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: AppColors.toast,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: FirebaseFirestore.instance.collection('books').get(),
      builder: (context, snapshot) {
        List<Book> books = snapshot.data!.docs.map((item) => Book.fromMap(item.data())).toList();
        
        if (snapshot.connectionState == ConnectionState.done) {
          return GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, Routes.description, arguments: books[0]);
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                        child: Image.network(books[0].bookImages![0]),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 7,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            books[0].bookName ?? '',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          Text(
                            books[0].bookDescription ?? '' ,
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.placeholderText),
                          ),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 12.0,
                                backgroundColor: AppColors.border,
                                child: Icon(
                                  Icons.person,
                                  color: AppColors.background2,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                'Username',
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      flex: 4,
                      child: SizedBox(
                        height: 100,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            StreamBuilder(
                                      stream: FirebaseFirestore.instance
                                          .collection('books')
                                          .where('bookId', isEqualTo: books[0].bookId)
                                          .snapshots(),
                                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                                        if (snapshot.hasData) {
                                          final map = snapshot.data.docs.first.data();
                                          final book = Book.fromMap(map);
                                          final uid = FirebaseAuth.instance.currentUser!.uid;
                                          // final isBookMarked = (book.bookMarkedUsers ?? []).contains(FirebaseAuth.instance.currentUser!.uid);
                                          return isBookMarked
                                              ? const Icon (
                                                  Icons.bookmark,
                                                  color: AppColors.secondary,
                                                )
                                              :  const Icon(
                                                  Icons.bookmark_outline,
                                                  color: AppColors.secondary,
                                                );
                                        }
                                        return const SizedBox();
                                      },
                                    ),
                            isBookMarked
                                ? unavailableStatusPills()
                                : availableStatusPills()
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        } else {
          return const SizedBox(
            height: 100,
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
      },
    );
  }
}
