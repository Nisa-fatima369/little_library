import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/theme/colors.dart';

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
