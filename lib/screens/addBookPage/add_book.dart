import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/utils/lists.dart';
import 'package:little_library/widgets/add_button.dart';
import 'package:little_library/widgets/book_container_with_delete.dart';
import 'package:little_library/widgets/buttons.dart';
import 'package:little_library/widgets/location_expansion.dart';

class AddBook extends StatefulWidget {
  const AddBook({super.key});

  @override
  State<AddBook> createState() => _AddBookState();
}

class _AddBookState extends State<AddBook> {
  final TextEditingController controller = TextEditingController();

  bool isToggle1 = false;
  bool isToggle2 = false;

  void toggleButton1() {
    setState(() {
      isToggle1 = !isToggle1;
    });
  }

  void toggleButton2() {
    setState(() {
      // isToggle2 = !isToggle2;
    });
  }

  _optionBottomSheet(BuildContext context, Size size, List<String> options,
      TextEditingController controller) {
    return showModalBottomSheet(
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
                        controller.text = options[index];
                        Navigator.pop(context);
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
                        GestureDetector(
                          onTap: toggleButton1,
                          child: Icon(
                            isToggle1 ? Icons.toggle_off : Icons.toggle_on,
                            color: isToggle1
                                ? AppColors.border
                                : AppColors.success,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                    y15,
                    Text(
                      'Book Name',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    y5,
                    TextFormField(
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
                      decoration: kTextField.copyWith(
                        fillColor: AppColors.grey,
                        hintText: 'Eg. Fiction',
                        suffixIcon: const Icon(
                          Icons.arrow_forward_ios,
                          color: AppColors.secondary,
                          size: 20,
                        ),
                      ),
                      onTap: () {
                        _optionBottomSheet(context, size, options, controller);
                      },
                    ),
                    y15,
                    Text(
                      'Author Name',
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    y5,
                    TextFormField(
                      decoration: kTextField.copyWith(
                        hintText: 'Eg. Marry Jane',
                        fillColor: AppColors.grey,
                      ),
                    ),
                    y15,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Set current location as address?',
                          style: Theme.of(context).textTheme.labelLarge,
                        ),
                        GestureDetector(
                          onTap: toggleButton2,
                          child: Icon(
                            isToggle2 ? Icons.toggle_off : Icons.toggle_on,
                            color: isToggle2
                                ? AppColors.border
                                : AppColors.success,
                            size: 60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const LocationExpansionTile(),
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
                      maxLines: 10,
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
                    Row(
                      children: [
                        deleted_Book_Container(size),
                        x5,
                        deleted_Book_Container(size),
                      ],
                    ),
                    y15,
                    const AddButton(),
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
