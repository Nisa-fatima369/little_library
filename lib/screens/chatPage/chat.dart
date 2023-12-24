import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/modal/chat_modal.dart';
import 'package:little_library/theme/colors.dart';

class ChatScreen extends StatefulWidget {
  final Chat? chat;
  const ChatScreen({Key? key, required this.chat}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final TextEditingController textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, Routes.contact);
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
      body: StreamBuilder(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .doc(widget.chat!.chatId)
            .collection('messages')
            .orderBy('time', descending: true)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          return Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.builder(
                  reverse: true,
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    final message = snapshot.data!.docs[index];
                    return MessageBubble(
                      text: message['text'],
                      isMe: message['senderId'] == widget.chat!.sender,
                    );
                  },
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
                            controller: textController,
                            cursorColor: AppColors.primaryText,
                            style: Theme.of(context).textTheme.bodyMedium,
                            decoration: kTextField.copyWith(
                              hintText: 'Type your message here',
                            ),
                          ),
                        ),
                        x10,
                        GestureDetector(
                          onTap: () async {
                            if (textController.text.isNotEmpty) {
                              await FirebaseFirestore.instance
                                  .collection('chats')
                                  .doc(widget.chat!.chatId)
                                  .collection('messages')
                                  .add({
                                'text': textController.text,
                                'time': DateTime.now(),
                                'senderId': widget.chat!.sender,
                                'receiverId': widget.chat!.receiver,
                                'receiverName': widget.chat!.receiver,
                              });
                              // FirebaseFirestore.instance
                              //     .collection('chats')
                              //     .doc(widget.chat!.chatId)
                              //     .update({
                              //   'lastMessage': textController.text,
                              //   'lastMessageTime': Timestamp.now(),
                              // });
                              textController.clear();
                            }
                          },
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
          );
        },
      ),
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.text, required this.isMe});
  final String text;
  final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Material(
            elevation: 2.0,
            borderRadius: BorderRadius.circular(10),
            color: isMe ? AppColors.primary : AppColors.border,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 10.0,
                horizontal: 20.0,
              ),
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 15.0,
                  color: isMe ? Colors.white : Colors.black54,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
