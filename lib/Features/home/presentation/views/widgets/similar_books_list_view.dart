import 'package:epic_minds/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .17,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return const Padding(
            padding: EdgeInsets.only(right: 15),
            child: CustomBookImage(),
          );
        },
      ),
    );
  }
}
