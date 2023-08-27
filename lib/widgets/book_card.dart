import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/modal/location_modal.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/status_pills.dart';

class BookCard extends StatefulWidget {
  const BookCard({
    super.key,
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

    Fluttertoast.showToast(
      msg: isBookMarked ? 'Book saved' : 'Book failed to save',
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM_RIGHT,
      timeInSecForIosWeb: 1,
      backgroundColor: AppColors.placeholderText,
      textColor: AppColors.background2,
      webBgColor: isBookMarked ? '#00C851' : '#ff4444',
      webPosition: "center",
      fontSize: 30,
      // webIcon: ""
      webShowClose: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.description);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        child: SizedBox(
          height: size.height * 0.13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  child: Container(
                    color: AppColors.border,
                  ),
                ),
              ),
              const SizedBox(width: 4),
              Expanded(
                flex: 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Title of Book',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: size.height * 0.01),
                    SizedBox(
                      width: size.width * 0.43,
                      child: Text(
                        'Description of Book can move to another line line line line line line line line line ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.placeholderText),
                      ),
                    ),
                    SizedBox(height: size.height * 0.01),
                    Container(
                      child: Row(
                        children: [
                          const CircleAvatar(
                            radius: 16.0,
                            backgroundColor: AppColors.border,
                            child: Icon(
                              Icons.person,
                              color: AppColors.background2,
                            ),
                          ),
                          SizedBox(width: size.width * 0.02),
                          Text(
                            'Username',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(
                        isBookMarked ? Icons.bookmark : Icons.bookmark_border,
                        color: AppColors.secondary,
                      ),
                      onPressed: toggleBookmark,
                    ),
                    unavailableStatusPills(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SavedBookCard extends StatelessWidget {
  const SavedBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.description);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        child: SizedBox(
          height: size.height * 0.13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                child: Container(
                  height: size.height * 0.11,
                  width: size.width * 0.2,
                  color: AppColors.border,
                ),
              ),
              SizedBox(width: size.width * 0.009),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title of Book',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    width: size.width * 0.43,
                    child: Text(
                      'Description of Book can move to another line line line line line line line line line ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.placeholderText),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16.0,
                          backgroundColor: AppColors.border,
                          child: Icon(
                            Icons.person,
                            color: AppColors.background2,
                          ),
                        ),
                        SizedBox(width: size.width * 0.02),
                        Text(
                          'Username',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.009),
              SizedBox(
                height: size.height * 0.11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.bookmark,
                      color: AppColors.secondaryVariant,
                    ),
                    availableStatusPills(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class MyBooksCard extends StatefulWidget {
  const MyBooksCard({super.key});

  @override
  State<MyBooksCard> createState() => _MyBooksCardState();
}

class _MyBooksCardState extends State<MyBooksCard> {
  bool isToggle = false;
  void toggleButton() {
    setState(() {
      isToggle = !isToggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.description);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        child: SizedBox(
          height: size.height * 0.13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                child: Container(
                  height: size.height * 0.11,
                  width: size.width * 0.2,
                  color: AppColors.border,
                ),
              ),
              // SizedBox(width: size.width * 0.0001),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title of Book',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w700, fontSize: 19),
                  ),
                  SizedBox(height: size.height * 0.009),
                  SizedBox(
                    width: size.width * 0.5,
                    child: Text(
                      'Description of Book can move to another line Pos 191 batu 3, Jln Salleh, Kampung Bukit Treh, 84000, Johor, Malaysia',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.placeholderText),
                    ),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.009),
              SizedBox(
                height: size.height * 0.11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (context) => SimpleDialog(
                            contentPadding: const EdgeInsets.symmetric(
                                horizontal: 0, vertical: 0),
                            backgroundColor: AppColors.background2,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 40, vertical: 20),
                                child: Row(
                                  children: [
                                    const Icon(Icons.edit),
                                    SizedBox(width: size.width * 0.02),
                                    const Text('Edit'),
                                  ],
                                ),
                              ),
                              const Divider(
                                color: AppColors.placeholderText,
                                indent: 10,
                                endIndent: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, Routes.deleteBooks);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 40, vertical: 20),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.delete),
                                      SizedBox(width: size.width * 0.02),
                                      const Text('Delete'),
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
                    GestureDetector(
                      onTap: toggleButton,
                      child: Icon(
                        isToggle ? Icons.toggle_off : Icons.toggle_on,
                        color: isToggle ? AppColors.border : AppColors.success,
                        size: 60,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SliderCard extends StatefulWidget {
  const SliderCard({super.key});

  @override
  State<SliderCard> createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  PageController _pageController = PageController();
  GoogleMapController? _controller;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.description);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Card(
          shadowColor: AppColors.disabled,
          child: Container(
            decoration: const BoxDecoration(
              color: AppColors.background2,
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.background2,
                  blurRadius: 1,
                  spreadRadius: 2,
                ),
              ],
            ),
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title of Book',
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          SizedBox(height: size.height * 0.01),
                          SizedBox(
                            width: size.width * 0.5,
                            child: Text(
                              'Description of Book can move to another line line line line line line line line line ',
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall!
                                  .copyWith(color: AppColors.placeholderText),
                            ),
                          ),
                          SizedBox(height: size.height * 0.01),
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 16.0,
                                backgroundColor: AppColors.border,
                                child: Icon(
                                  Icons.person,
                                  color: AppColors.background2,
                                ),
                              ),
                              SizedBox(width: size.width * 0.02),
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
                    SizedBox(
                      height: 110,
                      width: 120,
                      child: Card(
                        clipBehavior: Clip.antiAlias,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadiusDirectional.circular(10),
                        ),
                        child: Container(
                          color: AppColors.border,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () {
                        _controller?.animateCamera(
                          CameraUpdate.newCameraPosition(
                            CameraPosition(
                              target:
                                  locationData[_pageController.page!.toInt()]
                                      .locationCoords,
                              zoom: 14.0,
                              bearing: 45.0,
                              tilt: 45.0,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: size.height * 0.04,
                        width: size.width * 0.33,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: const Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.location_pin,
                                color: AppColors.secondary,
                              ),
                              Text(
                                'Locate on map',
                                style: TextStyle(
                                  color: AppColors.secondary,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Icon(Icons.bookmark_outline, color: AppColors.secondary),
                    availableStatusPills(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
