import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';

class Messages extends StatelessWidget {
  final String messageSender;
  const Messages({
    required this.messageSender,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
      decoration: BoxDecoration(
        color: AppColors.primaryVariant,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        messageSender,
        style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 18),
      ),
    );
  }
}

Container bookParameters(BuildContext context) {
  return Container(
    height: 100,
    width: double.infinity,
    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
    decoration: BoxDecoration(
      color: AppColors.primaryVariant,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Row(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadiusDirectional.circular(10),
          ),
          child: Container(
            height: 70,
            width: 70,
            color: AppColors.border,
          ),
        ),
        x5,
        Text(
          'Think & Grow Rich',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        const Expanded(child: SizedBox()),
        GestureDetector(
          onTap: () {},
          child: const Icon(
            Icons.close,
            color: AppColors.disabled,
            size: 30,
          ),
        ),
      ],
    ),
  );
}

Container messageTimer(BuildContext context, String time) {
  return Container(
    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
    decoration: BoxDecoration(
      color: AppColors.placeholderText,
      borderRadius: BorderRadius.circular(10),
    ),
    child: Text(
      time,
      style: Theme.of(context)
          .textTheme
          .bodyMedium!
          .copyWith(fontSize: 18, color: AppColors.background2),
    ),
  );
}
