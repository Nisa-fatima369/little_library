import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/utils/lists.dart';
import 'package:little_library/widgets/chat_button.dart';
import 'package:little_library/widgets/status_pills.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:dots_indicator/dots_indicator.dart';

class BookDetail extends StatefulWidget {
  const BookDetail({super.key});

  @override
  State<BookDetail> createState() => _BookDetailState();
}

class _BookDetailState extends State<BookDetail> {
  bool isBookMarked = false;
  bool isAlreadyChat = false;
  int currentIndex = 0;

  void toggleBookmark() {
    setState(() {
      isBookMarked = !isBookMarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    final CarouselController _controller = CarouselController();
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
          ),
        ),
        title: const Text('Book Details'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: GestureDetector(
              onTap: toggleBookmark,
              child: Icon(
                isBookMarked ? Icons.bookmark : Icons.bookmark_border,
                color: AppColors.secondary,
              ),
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
                  carouselController: _controller,
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
                        'Think and Grow Rich',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(width: 100, child: availableStatusPills()),
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
                        'July 20, 2022, 8:18 p.m by ',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Text(
                        'user01234',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.blue),
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
                          'Kampung Pulau Penarek, 84400 Sungai Mati, Johor, Malaysia',
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
                          'Self-help',
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
                    'Napolean Hill',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  y15,
                  Text(
                    'Book Description',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  y15,
                  Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
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
      floatingActionButton:
          isAlreadyChat ? viewChatButton(context) : chatButton(context),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
