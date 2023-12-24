import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/modal/book_modal.dart';
import 'package:little_library/screens/fullDialog/success_post.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/utils/lists.dart';
import 'package:little_library/widgets/buttons.dart';
import 'package:little_library/widgets/location_expansion.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:geolocator/geolocator.dart';

class AddBook extends StatefulWidget {
  final Book? book;
  const AddBook({super.key, this.book});
  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  bool toggle = true;
  bool isLoading = false;
  final nameController = TextEditingController();
  final categoryController = TextEditingController();
  final authorController = TextEditingController();
  final descriptionController = TextEditingController();
  final addressLineController = TextEditingController();
  final cityController = TextEditingController();
  final postalController = TextEditingController();
  final stateController = TextEditingController();

  final GeoPoint locationData = const GeoPoint(0.0, 0.0);

  @override
  void initState() {
    super.initState();
    if (widget.book != null) {
      nameController.text = widget.book!.bookName!;
    }
    if (widget.book != null) {
      categoryController.text = widget.book!.bookCategory!;
    }
    if (widget.book != null) {
      authorController.text = widget.book!.bookAuthor!;
    }
    if (widget.book != null) {
      descriptionController.text = widget.book!.bookDescription!;
    }
    if (widget.book != null) {
      addressLineController.text =
          widget.book!.bookOwnerAddress!['addressLine'];
    }
    if (widget.book != null) {
      cityController.text = widget.book!.bookOwnerAddress!['city'];
    }
    if (widget.book != null) {
      postalController.text = widget.book!.bookOwnerAddress!['postal'];
    }
    if (widget.book != null) {
      stateController.text = widget.book!.bookOwnerAddress!['state'];
    }
    if (widget.book != null) {
      toggle = widget.book!.bookAvailable!;
    }
    // if (widget.book != null) {
    //   bookImages = widget.book!.bookImages!.map((e) => XFile(e)).toList();
    // }
  }

  String? url;
  List<XFile> bookImages = [];

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
          title: Text(widget.book != null ? 'Update Book' : 'Add New Book'),
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
                      cursorColor: AppColors.primaryText,
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
                      cursorColor: AppColors.primaryText,
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
                      cursorColor: AppColors.primaryText,
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
                      cursorColor: AppColors.primaryText,
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
                    GalleryButton(
                      images: bookImages,
                    ),
                    y15,
                    GestureDetector(
                      onTap: () async {
                        if (nameController.text.isNotEmpty &&
                            categoryController.text.isNotEmpty &&
                            authorController.text.isNotEmpty &&
                            descriptionController.text.isNotEmpty &&
                            addressLineController.text.isNotEmpty &&
                            cityController.text.isNotEmpty &&
                            postalController.text.isNotEmpty &&
                            stateController.text.isNotEmpty &&
                            bookImages.isNotEmpty) {
                          final user = FirebaseAuth.instance.currentUser;
                          try {
                            setState(() {
                              isLoading = true;
                            });
                            List<String> urls = [];
                            final bookRef = FirebaseFirestore.instance
                                .collection('books')
                                .doc();
                            final bookId = bookRef.id;
                            for (int i = 0; i < bookImages.length; i++) {
                              final imageRef = FirebaseStorage.instance
                                  .ref()
                                  .child('books')
                                  .child(bookId)
                                  .child('image$i');

                              await imageRef.putFile(File(bookImages[i].path));
                              final url = await imageRef.getDownloadURL();
                              urls.add(url);
                            }
                            Position position =
                                await Geolocator.getCurrentPosition(
                                    desiredAccuracy: LocationAccuracy.high);
                            Book book = Book(
                              bookId: bookId,
                              bookMarkedUsers: [],
                              bookName: nameController.text,
                              bookCategory: categoryController.text,
                              bookAuthor: authorController.text,
                              bookDescription: descriptionController.text,
                              bookImages: urls,
                              bookAvailable: toggle,
                              bookOwnerId: user!.uid,
                              bookOwnerName: user.displayName,
                              bookOwnerEmail: user.email,
                              addressLine: addressLineController.text,
                              city: cityController.text,
                              postal: postalController.text,
                              state: stateController.text,
                              dateTime: DateTime.now(),
                              fullAddress:
                                  '${addressLineController.text} ${cityController.text}, ${stateController.text}',
                              bookOwnerAddress: {
                                'addressLine': addressLineController.text,
                                'city': cityController.text,
                                'postal': postalController.text,
                                'state': stateController.text,
                              },
                              locationCoordinates: GeoPoint(
                                  position.latitude, position.longitude),
                            );
                            widget.book != null
                                ? FirebaseFirestore.instance
                                    .collection('books')
                                    .doc(widget.book!.bookId)
                                    .update({
                                    'bookName': book.bookName,
                                    'bookCategory': book.bookCategory,
                                    'bookAuthor': book.bookAuthor,
                                    'bookDescription': book.bookDescription,
                                    'bookImages': book.bookImages,
                                    'bookAvailable': book.bookAvailable,
                                    'bookOwnerId': book.bookOwnerId,
                                    'bookOwnerName': user.displayName,
                                    'bookOwnerEmail': book.bookOwnerEmail,
                                    'addressLine': book.addressLine,
                                    'city': book.city,
                                    'postal': book.postal,
                                    'state': book.state,
                                    'dateTime': book.dateTime,
                                    'fullAddress': book.fullAddress,
                                    'bookOwnerAddress': book.bookOwnerAddress,
                                  }).then((value) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SuccessPost(book: book);
                                    }));
                                  })
                                : FirebaseFirestore.instance
                                    .collection('books')
                                    .doc(bookId)
                                    .set(book.toMap())
                                    .then((value) {
                                    setState(() {
                                      isLoading = false;
                                    });
                                    Navigator.pushReplacement(context,
                                        MaterialPageRoute(builder: (context) {
                                      return SuccessPost(book: book);
                                    }));
                                  });
                          } catch (e) {
                            print(e);
                          }
                        } else {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              backgroundColor: AppColors.failure,
                              content: Text('Please fill all the fields'),
                            ),
                          );
                        }
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                          color: AppColors.primary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                          child: isLoading
                              ? const CircularProgressIndicator(
                                  color: AppColors.secondary,
                                )
                              : Text(
                                  widget.book != null
                                      ? 'UPDATE BOOK'
                                      : 'ADD BOOK',
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
