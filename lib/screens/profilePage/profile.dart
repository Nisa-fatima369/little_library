// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/logout_button.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Column(
            children: [
              Row(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.border,
                    child: Icon(
                      Icons.person,
                      size: 50,
                      color: AppColors.placeholderText,
                    ),
                  ),
                  x15,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'user01234',
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(fontWeight: FontWeight.w700),
                      ),
                      y10,
                      Text(
                        'itsme@hotmail.com',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
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
                  //   showDialog(
                  //     context: context,
                  //     builder: (BuildContext context) => Center(
                  //       child: Padding(
                  //         padding: const EdgeInsets.symmetric(horizontal: 50),
                  //         child: CupertinoActionSheet(
                  //           title:
                  //               const Icon(Icons.folder, color: AppColors.blue),
                  //           message: Text(
                  //             'Allow Little Library to access photos, media, and files on your device?',
                  //             style: Theme.of(context).textTheme.bodyMedium,
                  //           ),
                  //           actions: <CupertinoActionSheetAction>[
                  //             CupertinoActionSheetAction(
                  //               onPressed: () {
                  //                 Navigator.pop(context);
                  //               },
                  //               child: Text(
                  //                 'Allow',
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .bodyMedium!
                  //                     .copyWith(color: AppColors.blue),
                  //               ),
                  //             ),
                  //             CupertinoActionSheetAction(
                  //               onPressed: () {
                  //                 Navigator.pop(context);
                  //               },
                  //               child: Text(
                  //                 'Deny',
                  //                 style: Theme.of(context)
                  //                     .textTheme
                  //                     .bodyMedium!
                  //                     .copyWith(color: AppColors.blue),
                  //               ),
                  //             ),
                  //           ],
                  //         ),
                  //       ),
                  //     ),
                  //   );
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
