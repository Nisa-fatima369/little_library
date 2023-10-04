import 'package:flutter/material.dart';
import 'package:little_library/config/routes.dart';

Widget chatButton(BuildContext context) {
  return FloatingActionButton.extended(
    onPressed: () {
      Navigator.pushNamed(context, Routes.chat);
    },
    extendedPadding: const EdgeInsets.symmetric(horizontal: 30),
    extendedIconLabelSpacing: 15,
    label: const Text('Chat'),
    icon: const Icon(Icons.chat),
  );
}

Widget viewChatButton(BuildContext context) {
  return FloatingActionButton.extended(
    onPressed: () {
      Navigator.pushNamed(context, Routes.chat);
    },
    extendedPadding: const EdgeInsets.symmetric(horizontal: 20),
    extendedIconLabelSpacing: 10,
    label: const Text('View Chat'),
    icon: const Icon(Icons.chat),
  );
}
