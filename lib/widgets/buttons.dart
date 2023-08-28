// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:little_library/config/routes.dart';
import 'package:little_library/screens/fullDialog/failed_post.dart';
import 'package:little_library/screens/fullDialog/failed_update.dart';
import 'package:little_library/screens/fullDialog/success_post.dart';
import 'package:little_library/screens/fullDialog/successfully_update.dart';

import '../theme/colors.dart';

Widget chatButton(BuildContext context, Size size) {
  return GestureDetector(
    child: Container(
      height: size.height * 0.055,
      width: size.width * 0.33,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.chat,
              color: AppColors.background2,
            ),
            SizedBox(width: size.width * 0.02),
            const Text(
              'Chat',
              style: TextStyle(
                color: AppColors.background2,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget viewChatButton(BuildContext context, Size size) {
  return GestureDetector(
    onTap: () {
      Navigator.pushNamed(
        context,
        Routes.chat,
      );
    },
    child: Container(
      height: size.height * 0.055,
      width: size.width * 0.4,
      decoration: BoxDecoration(
        color: AppColors.secondary,
        borderRadius: BorderRadius.circular(25),
      ),
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.chat,
              color: AppColors.background2,
            ),
            SizedBox(width: size.width * 0.02),
            const Text(
              'view Chat',
              style: TextStyle(
                color: AppColors.background2,
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

class TexxtButton extends StatelessWidget {
  const TexxtButton({
    super.key,
  });

  _imagePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CupertinoActionSheet(
            title: const Icon(Icons.folder, color: AppColors.blue),
            message: Text(
              'Allow Little Library to access photos, media, and files on your device?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Allow',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.blue),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Deny',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _imagePickerDialog(context);
      },
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.image,
                color: AppColors.blue,
              ),
              SizedBox(width: size.width * 0.03),
              Text(
                'Choose from gallery',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddButton extends StatefulWidget {
  const AddButton({
    Key? key,
  }) : super(key: key);

  @override
  State<AddButton> createState() => _AddButtonState();
}

class _AddButtonState extends State<AddButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierColor: AppColors.background2,
          context: context,
          builder: (context) {
            return FailedPost();
          },
        );
      },
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'ADD',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColors.secondary),
          ),
        ),
      ),
    );
  }
}

class LogoutButton extends StatelessWidget {
  const LogoutButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'LOGOUT',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColors.secondary),
          ),
        ),
      ),
    );
  }
}

class ViewButton extends StatelessWidget {
  const ViewButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.description,
        );
      },
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'VIEW POST',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColors.secondary),
          ),
        ),
      ),
    );
  }
}

class ViewUpdateButton extends StatelessWidget {
  const ViewUpdateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          Routes.description,
        );
      },
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'VIEW UPDATE',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColors.secondary),
          ),
        ),
      ),
    );
  }
}

class TryAgainButton extends StatelessWidget {
  const TryAgainButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'TRY AGAIN',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColors.secondary),
          ),
        ),
      ),
    );
  }
}

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierColor: AppColors.background2,
          context: context,
          builder: (context) {
            return FailedUpdate();
          },
        );
      },
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'UPDATE',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColors.secondary),
          ),
        ),
      ),
    );
  }
}

class DeleteBookButton extends StatefulWidget {
  const DeleteBookButton({
    Key? key,
  }) : super(key: key);

  @override
  State<DeleteBookButton> createState() => _DeleteBookButtonState();
}

class _DeleteBookButtonState extends State<DeleteBookButton> {
  bool isBookUploaded = false;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.myBooks);

        Fluttertoast.showToast(
          msg: isBookUploaded
              ? 'Book successfully deleted'
              : 'Book failed to delete',
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM_RIGHT,
          timeInSecForIosWeb: 1,
          backgroundColor: AppColors.placeholderText,
          textColor: AppColors.background2,
          // webBgColor: isBookUploaded ? '#00C851' : '#ff4444',
          webPosition: "center",
          fontSize: 30,
          // webIcon: ""
          webShowClose: true,
        );
      },
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.failure,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(
            'CONFIRM DELETE',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(color: AppColors.background2),
          ),
        ),
      ),
    );
  }
}
