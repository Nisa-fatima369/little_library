import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/modal/user.modal.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/logout_button.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  File? image;
  Future<File?> pickImage(BuildContext context, ImageSource source) async {
    final pickedImage = await ImagePicker().pickImage(source: source);
    if (pickedImage != null) {
      setState(() {
        image = File(pickedImage.path);
      });
      FirebaseAuth auth = FirebaseAuth.instance;
      String uid = auth.currentUser!.uid.toString();
      Reference storageReference =
          FirebaseStorage.instance.ref().child('users/$uid');
      UploadTask uploadTask = storageReference.putFile(image!);
      await uploadTask.whenComplete(() async {
        await storageReference.getDownloadURL().then(
          (value) async {
            await FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .update({'profileUrl': value});
            auth.currentUser!.updatePhotoURL(value);
            setState(() {});
          },
        );
      });
    }
    return null;
  }

  Future<void> removeProfilePicture() async {
    try {
      final User? user = FirebaseAuth.instance.currentUser;

      if (user != null) {
        final FirebaseStorage storage = FirebaseStorage.instance;
        final Reference storageRef = storage.refFromURL(user.photoURL!);
        await FirebaseFirestore.instance
            .collection('users')
            .doc(user.uid)
            .update({'profileUrl': ''});
        storageRef.delete();
        Navigator.pop(context);
        setState(() {});
        print('Profile picture deleted');
      }
    } catch (e) {
      print('Error deleting profile picture: $e');
    }
  }

  void _showActionSheet(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40),
          child: CupertinoActionSheet(
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(''),
                Text(
                  'Profile Photo',
                  style: Theme.of(context).textTheme.labelLarge!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
                GestureDetector(
                  onTap: () {
                    removeProfilePicture();
                  },
                  child: const Icon(
                    Icons.delete,
                    color: AppColors.failure,
                  ),
                ),
              ],
            ),
            message: const Text('Select a photo for your profile picture'),
            actions: <CupertinoActionSheetAction>[
              CupertinoActionSheetAction(
                onPressed: () {
                  pickImage(context, ImageSource.camera);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Camera',
                  style: TextStyle(color: AppColors.primaryText),
                ),
              ),
              CupertinoActionSheetAction(
                onPressed: () {
                  pickImage(context, ImageSource.gallery);
                  Navigator.pop(context);
                },
                child: const Text(
                  'Gallery',
                  style: TextStyle(color: AppColors.primaryText),
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
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppColors.background2,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            'My Profile',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
          future: FirebaseFirestore.instance
              .collection('users')
              .doc(FirebaseAuth.instance.currentUser!.uid)
              .get(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return const Center(
                child: Text('Something went wrong'),
              );
            } else if (snapshot.hasData) {
              final map = snapshot.data!.data();
              final user = UserModel.fromMap(map as Map<String, dynamic>);
              return Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          child:
                              user.profileUrl != '' && user.profileUrl != null
                                  ? CircleAvatar(
                                      radius: 50,
                                      backgroundColor: AppColors.hoverColor,
                                      backgroundImage:
                                          NetworkImage(user.profileUrl ?? ''),
                                    )
                                  : const CircleAvatar(
                                      radius: 50,
                                      backgroundColor: AppColors.hoverColor,
                                      child: Icon(
                                        Icons.person,
                                        color: AppColors.grey,
                                        size: 50,
                                      ),
                                    ),
                        ),
                        x15,
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              user.username!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(fontWeight: FontWeight.w700),
                            ),
                            y10,
                            Text(
                              user.email!,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .copyWith(
                                    fontWeight: FontWeight.w700,
                                    color: AppColors.placeholderText,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    y40,
                    GestureDetector(
                      onTap: () {
                        _showActionSheet(context);
                      },
                      child: const ProfileElements(
                          title: 'Upload Profile Picture', icon: Icons.image),
                    ),
                    y20,
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.myBooks);
                        },
                        child: const ProfileElements(
                            icon: Icons.list, title: 'My Books')),
                    y20,
                    GestureDetector(
                        onTap: () {
                          Navigator.pushNamed(context, Routes.savedBooks);
                        },
                        child: const ProfileElements(
                            icon: Icons.bookmark, title: 'Saved Books')),
                    y40,
                    const LogoutButton(),
                  ],
                ),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}

class ProfileElements extends StatelessWidget {
  final IconData icon;
  final String title;
  const ProfileElements({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.065,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppColors.hoverColor,
      ),
      child: ListTile(
        leading: Icon(
          icon,
          color: AppColors.secondary,
          size: 30,
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.w700,
                color: AppColors.secondary,
              ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColors.secondary,
          size: 20,
        ),
      ),
    );
  }
}
