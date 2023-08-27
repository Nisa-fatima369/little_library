import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/buttons.dart';
import 'package:little_library/widgets/status_pills.dart';

class Description extends StatefulWidget {
  const Description({super.key});

  @override
  State<Description> createState() => _DescriptionState();
}

class _DescriptionState extends State<Description> {
  bool isBookMarked = false;

  void toggleBookmark() {
    setState(() {
      isBookMarked = !isBookMarked;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
            padding: EdgeInsets.only(right: 20),
            child: GestureDetector(
              child: Icon(
                isBookMarked ? Icons.bookmark : Icons.bookmark_border,
                color: AppColors.secondary,
              ),
              onTap: toggleBookmark,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              color: AppColors.disabled,
              height: size.height * 0.3,
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Book Title',
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          availableStatusPills(),
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      Row(
                        children: [
                          Image.asset(
                            'assets/icons/updated_black_24dp.png',
                            color: AppColors.placeholderText,
                          ),
                          SizedBox(width: size.width * 0.03),
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
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: AppColors.placeholderText,
                          ),
                          SizedBox(width: size.width * 0.03),
                          SizedBox(
                            width: size.width * 0.8,
                            child: Text(
                              'Kampung Pulau Penarek, 84400 Sungai Mati, Johor, Malaysia',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.01),
                      Row(
                        children: [
                          Icon(
                            Icons.category,
                            color: AppColors.placeholderText,
                          ),
                          SizedBox(width: size.width * 0.03),
                          SizedBox(
                            width: size.width * 0.8,
                            child: Text(
                              'Self-help',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text(
                        'Author',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        'Napolean Hill',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      SizedBox(height: size.height * 0.03),
                      Text(
                        'Book Description',
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(height: size.height * 0.01),
                      Text(
                        'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                        style: Theme.of(context).textTheme.bodyMedium,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 10,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  left: 150,
                  right: 150,
                  bottom: 30,
                  child: viewChatButton(context, size),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
