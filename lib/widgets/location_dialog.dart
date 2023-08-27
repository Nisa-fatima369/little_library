import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:little_library/theme/colors.dart';

_locationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: CupertinoActionSheet(
            title: const Icon(Icons.location_on, color: AppColors.blue),
            message: Text(
              'Allow Little Library to access this device\'s location',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: <Widget>[
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Icon(
                  FontAwesomeIcons.earthAsia,
                  size: 100,
                  color: AppColors.blue,
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'While using the app',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.blue),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Only this time',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.blue),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Deny',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(color: AppColors.blue),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }