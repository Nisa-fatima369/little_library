import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/screens/fullDialog/delete_books.dart';
import 'package:little_library/screens/profilePage/edit_book_details.dart';
import 'package:little_library/theme/colors.dart';

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
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    barrierColor: AppColors.primary,
                                    context: context,
                                    builder: (context) {
                                      return EditBookDetails();
                                    },
                                  );
                                },
                                child: Padding(
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
                              ),
                              const Divider(
                                color: AppColors.placeholderText,
                                indent: 10,
                                endIndent: 10,
                              ),
                              GestureDetector(
                                onTap: () {
                                  showDialog(
                                    barrierColor: AppColors.background2,
                                    context: context,
                                    builder: (context) {
                                      return DeleteBook();
                                    },
                                  );
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