import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/utils/lists.dart';
import 'package:little_library/widgets/update_button.dart';

class EditBookDetails extends StatefulWidget {
  const EditBookDetails({super.key});

  @override
  State<EditBookDetails> createState() => _EditBookDetailsState();
}

class _EditBookDetailsState extends State<EditBookDetails> {
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
      isToggle2 = !isToggle2;
      // _locationDialog(context);
    });
  }

  // _locationDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) => Center(
  //       child: Padding(
  //         padding: const EdgeInsets.symmetric(horizontal: 50),
  //         child: CupertinoActionSheet(
  //           title: const Icon(Icons.location_on, color: AppColors.blue),
  //           message: Text(
  //             'Allow Little Library to access this device\'s location',
  //             style: Theme.of(context).textTheme.bodyMedium,
  //           ),
  //           actions: <Widget>[
  //             const Padding(
  //               padding: EdgeInsets.symmetric(vertical: 20),
  //               child: Icon(
  //                 FontAwesomeIcons.earthAsia,
  //                 size: 100,
  //                 color: AppColors.blue,
  //               ),
  //             ),
  //             CupertinoActionSheetAction(
  //               onPressed: () {
  //                 Navigator.pop(context);
  //               },
  //               child: Text(
  //                 'While using the app',
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
  //                 'Only this time',
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
  // }

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
              SizedBox(height: size.height * 0.02),
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
    return Scaffold(
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
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
                          color:
                              isToggle1 ? AppColors.border : AppColors.success,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Book Name',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: size.height * 0.005),
                  TextFormField(
                    decoration: kTextField.copyWith(
                      hintText: 'Eg. Journey to the West',
                      fillColor: AppColors.grey,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Book Category',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: size.height * 0.005),
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
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Author Name',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: size.height * 0.005),
                  TextFormField(
                    decoration: kTextField.copyWith(
                      hintText: 'Eg. Marry Jane',
                      fillColor: AppColors.grey,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
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
                          color:
                              isToggle2 ? AppColors.border : AppColors.success,
                          size: 60,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // const LocationExpansionTile(),
            SizedBox(height: size.height * 0.03),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Book Description',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: size.height * 0.005),
                  TextFormField(
                    maxLines: 5,
                    decoration: kTextField.copyWith(
                      hintText:
                          'Describe what the book is about and include details a reader might be interested in, people do love some stories!',
                      fillColor: AppColors.grey,
                    ),
                  ),
                  SizedBox(height: size.height * 0.02),
                  Text(
                    'Upload Book Cover Image',
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  SizedBox(height: size.height * 0.005),
                  // const GalleryButton(),
                  SizedBox(height: size.height * 0.02),
                  
                  SizedBox(height: size.height * 0.02),
                  const UpdateButton(),
                  SizedBox(height: size.height * 0.02),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
