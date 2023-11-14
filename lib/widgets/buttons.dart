import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/book_container_with_delete.dart';

class GalleryButton extends StatefulWidget {
  const GalleryButton({
    super.key,
  });

  @override
  State<GalleryButton> createState() => _GalleryButtonState();
}

class _GalleryButtonState extends State<GalleryButton> {
  File? image;
  List<XFile> images = [];

  Future<void> _pickImages() async {
    List<XFile>? pickedImages = await ImagePicker().pickMultipleMedia(
      imageQuality: 50,
      maxWidth: 800,
    );
    if (pickedImages != null) {
      setState(() {
        images.addAll(pickedImages);
      });
    }
  }

  void _deleteImage(int index) {
    setState(() {
      images.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            _pickImages();
          },
          child: Container(
            height: 60,
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
                  x5,
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
        ),
        y20,
        images.isNotEmpty
            ? Wrap(
                children: images.asMap().entries.map((entry) {
                  final int index = entry.key;
                  final XFile image = entry.value;

                  return DeletedBookContainer(
                    key: ValueKey(index),
                    imagePath: image.path,
                    onDelete: () => _deleteImage(index),
                  );
                }).toList(),
              )
            : Container(),
      ],
    );
  }
}
