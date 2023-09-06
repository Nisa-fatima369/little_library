import 'package:flutter/material.dart';
import 'package:little_library/screens/fullDialog/failed_post.dart';
import 'package:little_library/theme/colors.dart';

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
            return const FailedPost();
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