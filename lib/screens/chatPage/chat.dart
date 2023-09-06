import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/chat_description.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: AppColors.primaryText,
          ),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              backgroundColor: AppColors.border,
              radius: 20,
              child: Icon(
                Icons.person,
                color: AppColors.placeholderText,
              ),
            ),
            SizedBox(width: size.width * 0.03),
            const Text('user01234'),
          ],
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                bookParameters(size, context),
                SizedBox(height: size.height * 0.015),
                const Messages(
                  messageSender:
                      'Hi may I know if you\'re available this week to collect the book?',
                ),
                SizedBox(height: size.height * 0.01),
                messageTimer(context, '11:30'),
                SizedBox(height: size.height * 0.015),
                const Messages(
                  messageSender:
                      'Hi sure, I free on Friday evening, shall we meet at 7pm?',
                ),
                SizedBox(height: size.height * 0.01),
                messageTimer(context, '22:10'),
              ],
            ),
          ),
          Container(
            color: AppColors.primary,
            height: size.height * 0.1,
            child: SizedBox(
              height: size.height * 0.06,
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        style: Theme.of(context).textTheme.bodyMedium,
                        decoration: kTextField.copyWith(
                          hintText: 'Type your message here',
                        ),
                      ),
                    ),
                    SizedBox(width: size.width * 0.04),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.send_outlined,
                        color: AppColors.secondary,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
