import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/widgets/theme/colors.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background2,
        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'All Chats',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              SizedBox(height: size.height * 0.04),
              TextFormField(
                controller: _searchController,
                decoration: kSearchTextField.copyWith(
                  filled: true,
                  hintText: 'Search for a username',
                  suffixIcon: const Icon(
                    Icons.search,
                    color: AppColors.secondary,
                  ),
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: 190,
        // collapsedHeight: 200,
        // pinned: true,
      ),
      body: Container(
        color: AppColors.background1,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 12),
          child: ListView.separated(
            itemCount: 16,
            separatorBuilder: (BuildContext context, int index) {
              return Divider(
                color: AppColors.border,
              );
            },
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListTile(
                  leading: CircleAvatar(
                    radius: 25,
                    backgroundColor: AppColors.border,
                    child: Icon(
                      Icons.person,
                      color: AppColors.placeholderText,
                    ),
                  ),
                  title: Text(
                    'username',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  trailing: GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, Routes.chat);
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: AppColors.placeholderText,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
