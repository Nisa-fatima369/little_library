import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/modal/book_modal.dart';
import 'package:little_library/modal/user.modal.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/status_pills.dart';

class SavedBooks extends StatefulWidget {
  const SavedBooks({super.key});

  @override
  State<SavedBooks> createState() => _SavedBooksState();
}

class _SavedBooksState extends State<SavedBooks> {
  UserModel? user;
  bool isAvailable = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.popAndPushNamed(context, Routes.pageView);
          },
        ),
        title: const Text('Saved Books'),
      ),
      body: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('books')
              .where('bookMarkedUsers',
                  arrayContains: FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(child: CircularProgressIndicator());
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
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      book[index].bookName!,
                                      overflow: TextOverflow.ellipsis,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              fontWeight: FontWeight.w500),
                                    ),
                                    Text(
                                      book[index].bookDescription!,
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!
                                          .copyWith(
                                              color: AppColors.placeholderText),
                                    ),
                                    FutureBuilder(
                                      future: FirebaseFirestore.instance
                                          .collection('users')
                                          .doc(book[index].bookOwnerId)
                                          .get(),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          final map = snapshot.data!.data();
                                          user = UserModel.fromMap(
                                              map as Map<String, dynamic>);
                                          return Row(
                                            children: [
                                              SizedBox(
                                                child: user?.profileUrl != '' &&
                                                        user?.profileUrl != null
                                                    ? CircleAvatar(
                                                        radius: 13,
                                                        backgroundImage:
                                                            NetworkImage(user!
                                                                .profileUrl!),
                                                      )
                                                    : const CircleAvatar(
                                                        radius: 13,
                                                        backgroundColor:
                                                            AppColors
                                                                .hoverColor,
                                                        child: Icon(
                                                          Icons.person,
                                                          color: AppColors.grey,
                                                          size: 13,
                                                        ),
                                                      ),
                                              ),
                                              const SizedBox(width: 8),
                                              Text(
                                                user!.username ?? '',
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall,
                                              ),
                                            ],
                                          );
                                        }
                                        return const SizedBox();
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    const Icon(
                                      Icons.bookmark,
                                      color: AppColors.secondaryVariant,
                                    ),
                                    // FutureBuilder(
                                    //   future: FirebaseFirestore.instance
                                    //       .collection('books')
                                    //       .where('bookAvailable',
                                    //           isEqualTo: true)
                                    //       .get(),
                                    //   builder: (context, snapshot) {
                                    //     if (snapshot.connectionState ==
                                    //         ConnectionState.done) {
                                    //       List<Book> book = snapshot.data!.docs
                                    //           .map(
                                    //               (e) => Book.fromMap(e.data()))
                                    //           .toList();
                                    //       return SizedBox(
                                    //         width: 90,
                                    //         child: book[index].bookAvailable!
                                    //             ? availableStatusPills()
                                    //             : unavailableStatusPills(),
                                    //       );
                                    //     }
                                    //     return const SizedBox();
                                    //   },
                                    // ),
                                    SizedBox(
                                      width: 90,
                                      child: StatusPill(
                                          status: book[index].bookAvailable!),
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
          }),
    );
  }
}
