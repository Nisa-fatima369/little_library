import 'package:flutter/material.dart';
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
  bool isBookDeleted = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.myBooks);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            behavior: SnackBarBehavior.floating,
            width: isBookDeleted ? 230 : 180,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
            content: Text(
              isBookDeleted
                  ? 'Book successfully deleted'
                  : 'Book failed to delete',
              textAlign: TextAlign.center,
            ),
            duration: const Duration(seconds: 1),
            backgroundColor: AppColors.toast,
          ),
        );
      },
      child: Container(
        height: 60,
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
