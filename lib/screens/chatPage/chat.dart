import 'package:flutter/material.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/theme/colors.dart';
import 'package:little_library/widgets/chat_description.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
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
        title: const Row(
          children: [
            CircleAvatar(
              backgroundColor: AppColors.border,
              radius: 20,
              child: Icon(
                Icons.person,
                color: AppColors.placeholderText,
              ),
            ),
            x10,
            Text('user01234'),
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
                bookParameters(context),
                y15,
                const Messages(
                  messageSender:
                      'Hi may I know if you\'re available this week to collect the book?...Hi may I know if you\'re available this week to collect the book?',
                ),
                y10,
                messageTimer(context, '11:30'),
                y15,
                const Messages(
                  messageSender:
                      'Hi sure, I free on Friday evening, shall we meet at 7pm?',
                ),
                y10,
                messageTimer(context, '22:10'),
              ],
            ),
          ),
          Container(
            color: AppColors.primary,
            height: 90,
            child: SizedBox(
              height: 60,
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
                    x10,
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
