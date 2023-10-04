import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/status_pills.dart';

class SavedBookCard extends StatefulWidget {
  const SavedBookCard({super.key});

  @override
  State<SavedBookCard> createState() => _SavedBookCardState();
}

class _SavedBookCardState extends State<SavedBookCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.description);
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
        child: IntrinsicHeight(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 3,
                child: Card(
                  clipBehavior: Clip.antiAlias,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusDirectional.circular(10),
                  ),
                  child: Container(
                    height: 90,
                    width: 90,
                    color: AppColors.border,
                  ),
                ),
              ),
              x10,
              Expanded(
                flex: 7,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                    Text(
                      'Description of Book can move to another line line line line line line line line line ',
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall!
                          .copyWith(color: AppColors.placeholderText),
                    ),
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 14.0,
                          backgroundColor: AppColors.border,
                          child: Icon(
                            Icons.person,
                            color: AppColors.background2,
                          ),
                        ),
                        x10,
                        Text(
                          'Username',
                          overflow: TextOverflow.ellipsis,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Icon(
                      Icons.bookmark,
                      color: AppColors.secondaryVariant,
                    ),
                    SizedBox(width: 90, child: availableStatusPills()),
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
