import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/modal/book_modal.dart';
import 'package:little_library/modal/chat_modal.dart';
import 'package:little_library/modal/user.modal.dart';
import 'package:little_library/screens/chatPage/chat.dart';
import 'package:little_library/screens/page_view.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/chat_button.dart';
import 'package:little_library/widgets/status_pills.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BookDetail extends StatefulWidget {
  final Book? book;
  const BookDetail({super.key, required this.book});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  bool isBookMarked = false;
  bool isAlreadyChat = false;
  int currentIndex = 0;
  UserModel? user;

  void toggleBookmark() {
    setState(() {
      isBookMarked = !isBookMarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    final CarouselController controller = CarouselController();
    final List<String> imgList = widget.book!.bookImages ?? [];

    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => const PageVieew()));
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text('Book Details'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: FutureBuilder(
              future: FirebaseFirestore.instance
                  .collection('books')
                  .where('bookId', isEqualTo: widget.book!.bookId)
                  .get(),
              builder: (context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  final map = snapshot.data.docs.first.data();
                  final book = Book.fromMap(map);
                  final uid = FirebaseAuth.instance.currentUser!.uid;
                  final isBookMarked = (book.bookMarkedUsers)
                      .contains(FirebaseAuth.instance.currentUser!.uid);
                  return GestureDetector(
                    onTap: () async {
                      if (isBookMarked) {
                        await FirebaseFirestore.instance
                            .collection('books')
                            .doc(widget.book!.bookId)
                            .update({
                          'bookMarkedUsers': FieldValue.arrayRemove([uid])
                        }).then((value) => setState(() {}));
                      } else {
                        await FirebaseFirestore.instance
                            .collection('books')
                            .doc(widget.book!.bookId)
                            .update({
                          'bookMarkedUsers': FieldValue.arrayUnion([uid])
                        }).then((value) => setState(() {}));
                      }
                    },
                    child: isBookMarked
                        ? const Icon(
                            Icons.bookmark,
                            color: AppColors.secondaryGradient,
                          )
                        : const Icon(
                            Icons.bookmark_outline,
                            color: AppColors.secondaryGradient,
                          ),
                  );
                }
                return const SizedBox();
              },
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                CarouselSlider(
                  carouselController: controller,
                  items: imgList.map((imageUrl) {
                    return SizedBox(
                      width: double.infinity,
                      child: Image.network(imageUrl, fit: BoxFit.cover),
                    );
                  }).toList(),
                  options: CarouselOptions(
                    viewportFraction: 0.9999,
                    height: 350.0,
                    enableInfiniteScroll: true,
                    onPageChanged: (index, _) {
                      setState(() {
                        currentIndex = index;
                      });
                    },
                  ),
                ),
                Positioned(
                  bottom: 10,
                  left: 70,
                  right: 70,
                  child: DotsIndicator(
                    dotsCount: imgList.length,
                    position: currentIndex,
                    decorator: const DotsDecorator(
                      size: Size(10.0, 10.0),
                      color: AppColors.placeholderText,
                      activeColor: AppColors.blue,
                      spacing: EdgeInsets.all(5.0),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        widget.book!.bookName ?? '',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        width: 90,
                        child: StatusPill(
                            status: widget.book!.bookAvailable ?? false),
                      ),
                    ],
                  ),
                  y15,
                  Row(
                    children: [
                      Image.asset(
                        'assets/icons/updated_black_24dp.png',
                        color: AppColors.placeholderText,
                      ),
                      x10,
                      Text(
                        '${widget.book!.dateTime!.day}/${widget.book!.dateTime!.month}/${widget.book!.dateTime!.year}  by ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      x10,
                      FutureBuilder(
                        future: FirebaseFirestore.instance
                            .collection('users')
                            .doc(widget.book!.bookOwnerId)
                            .get(),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            final map = snapshot.data!.data();
                            final user =
                                UserModel.fromMap(map as Map<String, dynamic>);
                            return Text(
                              user.username!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(color: AppColors.blue),
                            );
                          }
                          return const SizedBox();
                        },
                      ),
                    ],
                  ),
                  y15,
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: AppColors.placeholderText,
                      ),
                      x10,
                      Expanded(
                        child: Text(
                          widget.book!.fullAddress ?? '',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  y15,
                  Row(
                    children: [
                      const Icon(
                        Icons.category,
                        color: AppColors.placeholderText,
                      ),
                      x10,
                      SizedBox(
                        child: Text(
                          widget.book!.bookCategory ?? '',
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                    ],
                  ),
                  y15,
                  Text(
                    'Author',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  y15,
                  Text(
                    widget.book!.bookAuthor ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  y15,
                  Text(
                    'Book Description',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  y15,
                  Text(
                    widget.book!.bookDescription ?? '',
                    style: Theme.of(context).textTheme.bodyMedium,
                    overflow: TextOverflow.ellipsis,
                    maxLines: 20,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          if (widget.book!.bookOwnerId ==
              FirebaseAuth.instance.currentUser!.uid) {
             ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('You cannot chat with yourself'),
              ),
            );
            return;
          }
          String chatId = '';
          String sender = FirebaseAuth.instance.currentUser!.uid;
          String? receiver = widget.book!.bookOwnerId;
          if (sender.hashCode >= receiver.hashCode) {
            chatId = '$sender-$receiver';
          } else {
            chatId = '$receiver-$sender';
          }
          FirebaseFirestore.instance
              .collection('chats')
              .doc(chatId)
              .get()
              .then((value) async {
            if (value.exists) {
              Navigator.pushNamed(context, Routes.chat,
                  arguments:
                      Chat.fromMap(value.data() as Map<String, dynamic>));
            } else {
              Chat chat = Chat(
                chatId: chatId,
                lastMessage: '',
                lastMessageTime: DateTime.now(),
                // userName: user!.username!,
                sender: sender,
                users: [sender, receiver!],
                messages: [],
              );
              await FirebaseFirestore.instance.collection('chats').doc().set({
                'chatId': chatId,
                'lastMessage': '',
                'lastMessageTime': DateTime.now(),
                // 'userName': user!.username,
                'sender': sender,
                'receiver': receiver,
                'users': [receiver, widget.book!.bookOwnerId],
                'messages': [],
              }).then(
                (value) {
                  Navigator.pushNamed(
                    context,
                    Routes.chat,
                    arguments: chat,
                  );
                },
              );
            }
          });
        },
        extendedPadding:
            EdgeInsets.symmetric(horizontal: isAlreadyChat ? 20 : 30),
        extendedIconLabelSpacing: isAlreadyChat ? 10 : 15,
        label: Text(isAlreadyChat ? 'View Chat' : 'Chat'),
        icon: const Icon(Icons.chat),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
