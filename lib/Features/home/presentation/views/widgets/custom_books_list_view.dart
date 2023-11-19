import 'package:epic_minds/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class CustomBooksListView extends StatelessWidget {
  const CustomBooksListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * .3,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        scrollDirection: Axis.horizontal,
        itemBuilder: (BuildContext context, int index) {
          return Padding(
            padding: const EdgeInsets.only(right: 15),
            child: SizedBox(
              height: MediaQuery.of(context).size.height * .3,
              child: const CustomBookImage(),
            ),
          );
        },
      ),
    );
  }
}
