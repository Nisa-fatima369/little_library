import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/status_pills.dart';

class SavedBookCard extends StatelessWidget {
  const SavedBookCard({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.description);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        child: SizedBox(
          height: size.height * 0.13,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Card(
                clipBehavior: Clip.antiAlias,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadiusDirectional.circular(10),
                ),
                child: Container(
                  height: size.height * 0.11,
                  width: size.width * 0.2,
                  color: AppColors.border,
                ),
              ),
              SizedBox(width: size.width * 0.009),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Title of Book',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context)
                        .textTheme
                        .bodyMedium!
                        .copyWith(fontWeight: FontWeight.w500),
                  ),
                  SizedBox(height: size.height * 0.01),
                  SizedBox(
                    width: size.width * 0.43,
                    child: Text(
                      'Description of Book can move to another line line line line line line line line line ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.placeholderText),
                    ),
                  ),
                  SizedBox(height: size.height * 0.01),
                  Container(
                    child: Row(
                      children: [
                        const CircleAvatar(
                          radius: 16.0,
                          backgroundColor: AppColors.border,
                          child: Icon(
                            Icons.person,
                            color: AppColors.background2,
                          ),
                        ),
                        SizedBox(width: size.width * 0.02),
                        Text(
                          'Username',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(width: size.width * 0.009),
              SizedBox(
                height: size.height * 0.11,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.bookmark,
                      color: AppColors.secondaryVariant,
                    ),
                    availableStatusPills(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}