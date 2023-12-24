import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/modal/book_modal.dart';
import 'package:little_library/screens/addBookPage/add_book.dart';
import 'package:little_library/screens/fullDialog/delete_books.dart';
import 'package:little_library/theme/colors.dart';

class MyBooks extends StatefulWidget {
  const MyBooks({super.key});

  @override
  State<MyBooks> createState() => _MyBooksState();
}

class _MyBooksState extends State<MyBooks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pushNamed(context, Routes.pageView);
          },
        ),
        title: const Text('My Books'),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
        },
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('books')
              .where('bookOwnerId',
                  isEqualTo: FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            List<Book> book =
                snapshot.data!.docs.map((e) => Book.fromMap(e.data())).toList();

            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
              child: ListView.builder(
                itemCount: book.length,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.description,
                          arguments: book[index]);
                    },
                    child: SizedBox(
                      height: 120,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 14, vertical: 5),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                flex: 3,
                                child: SizedBox(
                                  height: 120,
                                  child: Card(
                                    clipBehavior: Clip.antiAlias,
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadiusDirectional.circular(10),
                                    ),
                                    child: Image.network(
                                      book[index].bookImages!.first,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ),
                              x10,
                              Expanded(
                                flex: 7,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      book[index].bookName!,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w700,
                                              fontSize: 19),
                                    ),
                                    y10,
                                    Text(
                                      book[index].bookDescription!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 3,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: AppColors.placeholderText),
                                    ),
                                  ],
                                ),
                              ),
                              x5,
                              Expanded(
                                flex: 2,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (context) => SimpleDialog(
                                            contentPadding:
                                                const EdgeInsets.symmetric(
                                                    horizontal: 0, vertical: 0),
                                            backgroundColor:
                                                AppColors.background2,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) {
                                                        return AddBook(
                                                          book: book[index],
                                                        );
                                                      },
                                                    ),
                                                  );
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 40,
                                                      vertical: 20),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.edit),
                                                      x20,
                                                      Text('Edit'),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                              const Divider(
                                                color:
                                                    AppColors.placeholderText,
                                                indent: 10,
                                                endIndent: 10,
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  showDialog(
                                                    barrierColor:
                                                        AppColors.background2,
                                                    context: context,
                                                    builder: (context) {
                                                      return DeleteBook(
                                                        book:
                                                            book[index].bookId,
                                                      );
                                                    },
                                                  );
                                                },
                                                child: const Padding(
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 40,
                                                      vertical: 20),
                                                  child: Row(
                                                    children: [
                                                      Icon(Icons.delete),
                                                      x20,
                                                      Text('Delete'),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        );
                                      },
                                      child: const Icon(
                                        Icons.more_vert,
                                        color: AppColors.placeholderText,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
