import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';

class LocationExpansionTile extends StatelessWidget {
  const LocationExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.symmetric(horizontal: 20),
        childrenPadding: const EdgeInsets.symmetric(horizontal: 20),
        iconColor: AppColors.primaryText,
        collapsedIconColor: AppColors.primaryText,
        maintainState: true,
        title: Text(
          'Location Address',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          y15,
          Text(
            'Address Line 1',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          y5,
          TextFormField(
            decoration: kTextField.copyWith(
              hintText: 'Street, Address, Company Name, C/O',
              fillColor: AppColors.grey,
            ),
          ),
          y15,
          Text(
            'City',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          y5,
          TextFormField(
            decoration: kTextField.copyWith(
              hintText: 'Eg. Desa Tasik',
              fillColor: AppColors.grey,
            ),
          ),
          y15,
          Text(
            'Postal/Zip Code',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          y5,
          TextFormField(
            decoration: kTextField.copyWith(
              hintText: 'Eg. 544440',
              fillColor: AppColors.grey,
            ),
          ),
          y15,
          Text(
            'State',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          y5,
          TextFormField(
            decoration: kTextField.copyWith(
              hintText: 'Eg. Kuala Lumpur',
              fillColor: AppColors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
