// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:little_library/theme/colors.dart';

class StatusPill extends StatelessWidget {
  final bool status;
  const StatusPill({
    Key? key,
    required this.status,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
    height: 30,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: AppColors.lightGreen,
    ),
    child:  Padding(
      padding: const EdgeInsets.all(4.0),
      child: Center(
        child: Text(
          status ? 'Available' : 'Unavailable',
          style: TextStyle(
            color: status ? AppColors.success : AppColors.failure,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
  }
}


Widget availableStatusPills() {
  return Container(
    height: 30,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: AppColors.lightGreen,
    ),
    child: const Padding(
      padding: EdgeInsets.all(4.0),
      child: Center(
        child: Text(
          'Available',
          style: TextStyle(
            color: AppColors.success,
            fontSize: 14,
          ),
        ),
      ),
    ),
  );
}

Widget unavailableStatusPills() {
  return Container(
    height: 30,
    decoration: const BoxDecoration(
      borderRadius: BorderRadius.all(Radius.circular(5)),
      color: AppColors.lightPink,
    ),
    child: const Padding(
      padding: EdgeInsets.all(4.0),
      child: Center(
        child: Text(
          'Unavailable',
          style: TextStyle(
            fontSize: 14,
            color: AppColors.failure,
          ),
        ),
      ),
    ),
  );
}
