import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';

class TryAgainButton extends StatelessWidget {
  const TryAgainButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        height: 60,
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