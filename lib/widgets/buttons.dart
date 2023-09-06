import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:little_library/theme/colors.dart';
class TexxtButton extends StatelessWidget {
  const TexxtButton({
    super.key,
  });

  _imagePickerDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          child: CupertinoActionSheet(
            title: const Icon(Icons.folder, color: AppColors.blue),
            message: Text(
              'Allow Little Library to access photos, media, and files on your device?',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  'Allow',
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

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        _imagePickerDialog(context);
      },
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
          color: AppColors.grey,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.image,
                color: AppColors.blue,
              ),
              SizedBox(width: size.width * 0.03),
              Text(
                'Choose from gallery',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: AppColors.blue),
              ),
            ],
          ),
        ),
      ),
    );
  }
}













