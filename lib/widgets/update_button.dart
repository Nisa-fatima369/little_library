import 'package:flutter/material.dart';
import 'package:little_library/screens/fullDialog/successfully_update.dart';
import 'package:little_library/theme/colors.dart';

class UpdateButton extends StatelessWidget {
  const UpdateButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          barrierColor: AppColors.background2,
          context: context,
          builder: (context) {
            return const SuccessfullyUpdate();
          },
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
