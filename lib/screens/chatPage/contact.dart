import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';
import 'package:little_library/constants.dart';
import 'package:little_library/modal/chat_modal.dart';
import 'package:little_library/modal/user.modal.dart';
import 'package:little_library/screens/chatPage/chat.dart';
import 'package:little_library/theme/colors.dart';

class Contacts extends StatefulWidget {
  const Contacts({super.key});

  @override
  State<Contacts> createState() => _ContactsState();
}

class _ContactsState extends State<Contacts> {
  final TextEditingController _searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance
            .collection('chats')
            .where('users',
                arrayContains: FirebaseAuth.instance.currentUser?.uid)
            .snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasData && snapshot.data!.docs.isNotEmpty) {
            List<Chat> chats = [];
            for (var element in snapshot.data!.docs) {
              chats.add(Chat.fromMap(element.data() as Map<String, dynamic>));
            }
            return ListView.separated(
                itemBuilder: ((context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ChatScreen(
                            chat: chats[index],
                          ),
                        ),
                      );
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundColor: Colors.grey.shade400,
                        child: const Icon(
                          Icons.person,
                          color: Colors.white,
                        ),
                      ),
                      title: Text(
                        chats[index].receiver ==
                                FirebaseAuth.instance.currentUser?.uid
                            ? chats[index].sender
                            : chats[index].receiver!,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      subtitle: Text(
                        chats[index].lastMessage.toString(),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 16,
                        ),
                      ),
                      trailing: Text(
                        '${DateTime.fromMicrosecondsSinceEpoch(snapshot.data!.docs[index]['lastMessageTime'].microsecondsSinceEpoch).hour}:${DateTime.fromMicrosecondsSinceEpoch(snapshot.data!.docs[index]['lastMessageTime'].microsecondsSinceEpoch).minute}',
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                          fontSize: 14,
                        ),
                      ),
                    ),
                  );
                }),
                separatorBuilder: (context, index) {
                  return Divider(
                    indent: 20,
                    endIndent: 20,
                    color: Colors.white.withOpacity(0.2),
                  );
                },
                itemCount: snapshot.data!.docs.length);
          }
          if (snapshot.data!.docs.isEmpty) {
            return const Center(
              child: Text(
                'No Chats',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                ),
              ),
            );
          }

          return const Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

// GestureDetector(
//                 onTap: () {
//                   Navigator.pushNamed(context, Routes.chat,
//                       arguments:
//                           UserModel.fromMap(snapshot.data!.docs[index].data()));
//                 },
//                 child: Padding(
//                   padding:
//                       const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
//                   child: Row(
//                     children: [
//                       CircleAvatar(
//                         backgroundColor: AppColors.border,
//                         radius: 20,
//                         child: users[index].profileUrl == null
//                             ? const Icon(
//                                 Icons.person,
//                                 color: AppColors.placeholderText,
//                               )
//                             : Image.network(
//                                 users[index].profileUrl!,
//                                 fit: BoxFit.cover,
//                               ),
//                       ),
//                       x10,
//                       Text(users[index].username!),
//                     ],
//                   ),
//                 ),
//               );