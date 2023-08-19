import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/widgets/theme/colors.dart';
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
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
                    ),
                    SizedBox(height: size.height * 0.01),
                    SizedBox(
                      width: size.width * 0.43,
                      child: Text(
                        'Description of Book can move to another line line line line line line line line line ',
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.placeholderText),
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
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    width: size.width * 0.43,
                    child: Text(
                      'Description of Book can move to another line line line line line line line line line ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.placeholderText),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    child: Row(
                      children: [
                        CircleAvatar(
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
                    Icon(
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
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w700, fontSize: 19),
                  ),
                  SizedBox(height: size.height * 0.009),
                  SizedBox(
                    width: size.width * 0.5,
                    child: Text(
                      'Description of Book can move to another line Pos 191 batu 3, Jln Salleh, Kampung Bukit Treh, 84000, Johor, Malaysia',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.placeholderText),
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
                            contentPadding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                            backgroundColor: AppColors.background2,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                child: Row(
                                  children: [
                                    Icon(Icons.edit),
                                    SizedBox(width: size.width * 0.02),
                                    Text('Edit'),
                                  ],
                                ),
                              ),
                              Divider(
                                color: AppColors.placeholderText,
                                indent: 10,
                                endIndent: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(context, Routes.deleteBooks);
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                                  child: Row(
                                    children: [
                                      Icon(Icons.delete),
                                      SizedBox(width: size.width * 0.02),
                                      Text('Delete'),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      child: Icon(
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
