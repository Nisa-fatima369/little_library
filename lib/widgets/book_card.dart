import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:little_library/config/routes.dart';
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

    // Fluttertoast.showToast(
    //   msg: isBookMarked ? 'Book saved' : 'Book failed to save',
    //   toastLength: Toast.LENGTH_SHORT,
    //   gravity: ToastGravity.BOTTOM_RIGHT,
    //   timeInSecForIosWeb: 1,
    //   backgroundColor: AppColors.placeholderText,
    //   textColor: AppColors.background2,
    //   webBgColor: isBookMarked ? '#00C851' : '#ff4444',
    //   webPosition: "center",
    //   fontSize: 30,
    //   // webIcon: ""
    // );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        behavior: SnackBarBehavior.floating,
        width: 180,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        content: Text(
          isBookMarked ? 'Book saved' : 'Book failed to save',
          textAlign: TextAlign.center,
        ),
        duration: const Duration(seconds: 1),
        backgroundColor: Colors.black.withOpacity(0.9),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.description);
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
                  child: Container(
                    color: AppColors.border,
                  ),
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
                      'Title of Book',
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
                    ),
                    Text(
                      'Description of Book can move to another line line line line line line line line line ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(color: AppColors.placeholderText),
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
                      IconButton(
                        icon: Icon(
                          isBookMarked ? Icons.bookmark : Icons.bookmark_border,
                          color: isBookMarked ? const Color.fromARGB(255, 123, 75, 165) : AppColors.secondary,
                        ),
                        onPressed: toggleBookmark,
                      ),
                      isBookMarked ? unavailableStatusPills() : availableStatusPills()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
