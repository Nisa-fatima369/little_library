import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/modal/book_modal.dart';
import 'package:little_library/modal/user.modal.dart';
import 'package:little_library/utils/lists.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/status_pills.dart';

bool isBookMarked = false;

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  UserModel? user;
  List<Book> filteredBooks = [];

  void toggleBookmark(Book book, User user) async {
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

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DefaultTabController(
      length: tabs.length,
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            return <Widget>[
              SliverOverlapAbsorber(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  // stretch: true,
                  // snap: true,
                  // floating: true,
                  leading: const SizedBox.shrink(),
                  leadingWidth: 0.0,
                  backgroundColor: AppColors.background1,
                  title: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Text(
                            'All Books',
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.headlineLarge,
                          ),
                        ),
                        SizedBox(height: size.height * 0.02),
                        TextFormField(
                          cursorColor: AppColors.primaryText,
                          controller: _searchController,
                          onChanged: (value) {
                            setState(() {});
                          },
                          decoration: kSearchTextField.copyWith(
                            filled: true,
                            hintText: 'Search for a book ',
                            suffixIcon: const Icon(
                              Icons.search,
                              color: AppColors.secondary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  toolbarHeight: 140,
                  collapsedHeight: 150,
                  pinned: true,
                  // expandedHeight: 170,
                  forceElevated: innerBoxIsScrolled,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(kToolbarHeight),
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width / 1.05,
                      child: TabBar(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        labelStyle: Theme.of(context).textTheme.bodyMedium,
                        indicator: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(28),
                        ),
                        splashBorderRadius: BorderRadius.circular(28),
                        isScrollable: true,
                        unselectedLabelColor: AppColors.primaryText,
                        labelColor: AppColors.primaryText,
                        indicatorColor: AppColors.primary,
                        tabs:
                            tabs.map((String name) => Tab(text: name)).toList(),
                      ),
                    ),
                  ),
                ),
              ),
            ];
          },
          body: Padding(
            padding: const EdgeInsets.only(top: 210),
            child: TabBarView(
              children: [
                homeBookCard('All'),
                homeBookCard('Fiction'),
                homeBookCard('Non-Fiction'),
                homeBookCard('Textbooks'),
                homeBookCard('Kids'),
                homeBookCard('Self-help'),
                homeBookCard('Comics'),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget homeBookCard(String category) {
    return RefreshIndicator(
      color: AppColors.border,
      onRefresh: () async {
        setState(() {});
      },
      child: FutureBuilder<List<Book>>(
        future: category == 'All'
            ? FirebaseFirestore.instance
                .collection('books')
                // .orderBy('dateTime', descending: true)
                // .limit(100)
                .get()
                .then((value) =>
                    value.docs.map((e) => Book.fromMap(e.data())).toList())
            : FirebaseFirestore.instance
                .collection('books')
                .where('bookCategory', isEqualTo: category)
                // .orderBy('dateTime ', descending: true)
                // .limit(100)
                .get()
                .then((value) =>
                    value.docs.map((e) => Book.fromMap(e.data())).toList()),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<Book> books = snapshot.data!;

            books.sort((a, b) => b.dateTime!.compareTo(a.dateTime!));

            if (_searchController.text.isNotEmpty) {
              books = books
                  .where((element) => element.bookName!
                      .toLowerCase()
                      .contains(_searchController.text.toLowerCase().trim()))
                  .toList();
            }

            return ListView.builder(
              itemCount: books.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, Routes.description,
                        arguments: books[index]);
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
                              flex: 4,
                              child: SizedBox(
                                height: 120,
                                child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  shape: RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadiusDirectional.circular(10),
                                  ),
                                  child: Image.network(
                                    books[index].bookImages!.first,
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
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    books[index].bookName ?? '',
                                    overflow: TextOverflow.ellipsis,
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(fontWeight: FontWeight.w500),
                                  ),
                                  Text(
                                    books[index].bookDescription ?? '',
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
                                        .doc(books[index].bookOwnerId)
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
                                                      backgroundColor:
                                                          AppColors.hoverColor,
                                                      backgroundImage:
                                                          NetworkImage(user!
                                                              .profileUrl!),
                                                    )
                                                  : const CircleAvatar(
                                                      radius: 13,
                                                      backgroundColor:
                                                          AppColors.hoverColor,
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
                            x10,
                            Expanded(
                              flex: 4,
                              child: SizedBox(
                                height: 100,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    GestureDetector(
                                      onTap: () {
                                        if (books[index]
                                            .bookMarkedUsers
                                            .contains(FirebaseAuth
                                                .instance.currentUser!.uid)) {
                                          FirebaseFirestore.instance
                                              .collection('books')
                                              .doc(books[index].bookId)
                                              .update({
                                            'bookMarkedUsers':
                                                FieldValue.arrayRemove([
                                              FirebaseAuth
                                                  .instance.currentUser!.uid
                                            ])
                                          });
                                          setState(() {
                                            books[index].bookMarkedUsers.remove(
                                                FirebaseAuth
                                                    .instance.currentUser!.uid);
                                          });
                                        } else {
                                          FirebaseFirestore.instance
                                              .collection('books')
                                              .doc(books[index].bookId)
                                              .update({
                                            'bookMarkedUsers':
                                                FieldValue.arrayUnion([
                                              FirebaseAuth
                                                  .instance.currentUser!.uid
                                            ])
                                          });
                                          setState(() {
                                            books[index].bookMarkedUsers.add(
                                                FirebaseAuth
                                                    .instance.currentUser!.uid);
                                          });
                                        }
                                      },
                                      child: Icon(
                                        books[index].bookMarkedUsers.contains(
                                                FirebaseAuth
                                                    .instance.currentUser!.uid)
                                            ? Icons.bookmark
                                            : Icons.bookmark_border,
                                        color: isBookMarked
                                            ? AppColors.secondaryGradient
                                            : AppColors.secondaryGradient,
                                      ),
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
                  ),
                );
              },
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
