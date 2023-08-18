import 'package:flutter/material.dart';
import 'package:little_library/widgets/book_card.dart';

class SavedBooks extends StatelessWidget {
  const SavedBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          child: const Icon(Icons.arrow_back),
          onTap: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Saved Books'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 15),
        child: ListView.builder(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return const SavedBookCard();
          },
          itemCount: 20,
        ),
      ),
    );
  }
}
