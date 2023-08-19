import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/widgets/theme/colors.dart';

class LocationExpansionTile extends StatelessWidget {
  const LocationExpansionTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        tilePadding: EdgeInsets.symmetric(horizontal: 20),
        childrenPadding: EdgeInsets.symmetric(horizontal: 20),
        iconColor: AppColors.primaryText,
        collapsedIconColor: AppColors.primaryText,
        maintainState: true,
        title: Text(
          'Location Address',
          style: Theme.of(context).textTheme.labelLarge,
        ),
        expandedCrossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: size.height * 0.02),
          Text(
            'Address Line 1',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: size.height * 0.005),
          TextFormField(
            decoration: kTextField.copyWith(
              hintText: 'Street, Address, Company Name, C/O',
              fillColor: AppColors.grey,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            'City',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: size.height * 0.005),
          TextFormField(
            decoration: kTextField.copyWith(
              hintText: 'Eg. Desa Tasik',
              fillColor: AppColors.grey,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            'Postal/Zip Code',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: size.height * 0.005),
          TextFormField(
            decoration: kTextField.copyWith(
              hintText: 'Eg. 544440',
              fillColor: AppColors.grey,
            ),
          ),
          SizedBox(height: size.height * 0.02),
          Text(
            'State',
            style: Theme.of(context)
                .textTheme
                .labelLarge!
                .copyWith(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: size.height * 0.005),
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
