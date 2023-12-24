import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/modal/book_modal.dart';
import 'package:little_library/theme/colors.dart';

class ViewButton extends StatelessWidget {
  final Book book;
  const ViewButton({
    Key? key, required this.book,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context, Routes.description,
          arguments: book,
        );
      },
      child: Container(
        height: 60,
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
