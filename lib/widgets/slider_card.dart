import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/status_pills.dart';

class SliderCard extends StatefulWidget {
  const SliderCard({super.key});

  @override
  State<SliderCard> createState() => _SliderCardState();
}

class _SliderCardState extends State<SliderCard> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, Routes.description);
      },
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusDirectional.circular(10),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 3,
                    child: Column(
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
                        y5,
                        Text(
                          'Description of Book can move to another line line line line line line line line line ',
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall!
                              .copyWith(color: AppColors.placeholderText),
                        ),
                        y5,
                        Row(
                          children: [
                            const CircleAvatar(
                              radius: 16.0,
                              backgroundColor: AppColors.border,
                              child: Icon(
                                Icons.person,
                                color: AppColors.background2,
                              ),
                            ),
                            x5,
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
                  x10,
                  SizedBox(
                    height: 110,
                    width: 120,
                    child: Card(
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        color: AppColors.border,
                      ),
                    ),
                  ),
                ],
              ),
              y10,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 40,
                      width: 150,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: const Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.location_pin,
                                color: AppColors.secondary),
                            Text(
                              'Locate on map',
                              style: TextStyle(color: AppColors.secondary),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const Icon(Icons.bookmark_outline, color: AppColors.secondary),
                  SizedBox(width: 110, child: unavailableStatusPills()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
