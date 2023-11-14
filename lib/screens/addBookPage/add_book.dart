import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/modal/book_modal.dart';
import 'package:little_library/screens/fullDialog/success_post.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/utils/lists.dart';
import 'package:little_library/widgets/buttons.dart';
import 'package:little_library/widgets/location_expansion.dart';
import 'package:firebase_storage/firebase_storage.dart';

class AddBook extends StatefulWidget {
  final Book? book;
  const AddBook({super.key, this.book});
  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  bool toggle = true;
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final authorController = TextEditingController();
  final descriptionController = TextEditingController();

  final addressLineController = TextEditingController();
  final cityController = TextEditingController();
  final postalController = TextEditingController();
  final stateController = TextEditingController();

  String? url;
  File? image;

  Future<String?> _optionBottomSheet(
      BuildContext context, Size size, List<String> options) async {
    return await showModalBottomSheet(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      context: context,
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Select a Book Category',
                style: Theme.of(context).textTheme.labelLarge,
              ),
              y10,
              Expanded(
                child: ListView.builder(
                  itemCount: 6,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        Navigator.pop(context, options[index]);
                      },
                      child: ListTile(
                        leading: const Icon(Icons.circle_outlined,
                            color: AppColors.secondary),
                        title: Text(options[index]),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.close),
          ),
          title: const Text('Add New Book'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Book Available',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        Switch(
                            activeColor: AppColors.success,
                            value: toggle,
                            onChanged: (value) {
                              setState(() {
                                toggle = value;
                              });
                            }),
                      ],
                    ),
                    y15,
                    Text(
                      'Book Name',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    y5,
                    TextFormField(
                      controller: nameController,
                      decoration: kTextField.copyWith(
                        hintText: 'Eg. Journey to the West',
                        fillColor: AppColors.grey,
                      ),
                    ),
                    y15,
                    Text(
                      'Book Category',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    y5,
                    TextFormField(
                      readOnly: true,
                      enabled: true,
                      controller: categoryController,
                      decoration: kTextField.copyWith(
                        fillColor: AppColors.grey,
                        hintText: 'Eg. Fiction',
                        suffixIcon: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.secondary,
                          size: 20,
                        ),
                      ),
                      onTap: () async {
                        final value =
                            await _optionBottomSheet(context, size, options);
                        if (value != null) {
                          categoryController.text = value;
                          setState(() {});
                        }
                      },
                    ),
                    y15,
                    Text(
                      'Author Name',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    y5,
                    TextFormField(
                      controller: authorController,
                      decoration: kTextField.copyWith(
                        hintText: 'Eg. Marry Jane',
                        fillColor: AppColors.grey,
                      ),
                    ),
                    y15,
                  ],
                ),
              ),
              LocationExpansionTile(
                addressLineController: addressLineController,
                cityController: cityController,
                postalController: postalController,
                stateController: stateController,
              ),
              y15,
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Book Description',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    y5,
                    TextFormField(
                      maxLines: 7,
                      controller: descriptionController,
                      decoration: kTextField.copyWith(
                        hintText:
                            'Describe what the book is about and include details a reader might be interested in, people do love some stories!',
                        fillColor: AppColors.grey,
                      ),
                    ),
                    y15,
                    Text(
                      'Upload Book Cover Image',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    y5,
                    const GalleryButton(),
                    y15,
                    GestureDetector(
                      onTap: () async {
                        String id = FirebaseFirestore.instance
                            .collection('book')
                            .doc()
                            .id;
                       
                        UploadTask uploadTask = FirebaseStorage.instance
                            .ref()
                            .child('books/${widget.book!.id}')
                            .putFile(image!);
                        await uploadTask.snapshotEvents.listen((event) {
                          if (event.state == TaskState.success) {
                            event.ref.getDownloadURL().then((url) async {
                              await FirebaseFirestore.instance
                                  .collection('books')
                                  .doc(id)
                                  .set({
                                'id': id,
                                'title': nameController.text,
                                'author': authorController.text,
                                'description': descriptionController.text,
                                'dateTime': DateTime.now(),
                                'addressLine': addressLineController.text,
                                'city': cityController.text,
                                'postal': postalController.text,
                                'state': stateController.text,
                                'category': categoryController.text,
                                'imageUrl': url,
                                'userId':
                                    FirebaseAuth.instance.currentUser!.uid,
                              });
                            });
                          }
                        });
                        // await FirebaseFirestore.instance
                        //     .collection('book')
                        //     .doc(id)
                        //     .set({
                        //   'id': id,
                        //   'title': nameController.text,
                        //   'author': authorController.text,
                        //   'description': descriptionController.text,
                        //   'dateTime': DateTime.now(),
                        //   'addressLine': addressLineController.text,
                        //   'city': cityController.text,
                        //   'postal': postalController.text,
                        //   'state': stateController.text,
                        //   'category': categoryController.text,
                        //   'imageUrl': url,
                        //   'userId': FirebaseAuth.instance.currentUser!.uid,
                        // });
                        showDialog(
                          barrierColor: AppColors.background2,
                          context: context,
                          builder: (context) {
                            return const SuccessPost();
                          },
                        );
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: Text(
                            'ADD',
                            style: Theme.of(context)
                                .textTheme
                                .labelLarge!
                                .copyWith(color: AppColors.secondary),
                          ),
                        ),
                      ),
                    ),
                    y15,
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


