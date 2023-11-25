import 'package:epic_minds/Features/home/data/models/book_model/book_model.dart';
import 'package:epic_minds/core/utils/functions/launcher_url.dart';
import 'package:epic_minds/core/widgets/custom_button.dart';
import 'package:flutter/material.dart';

class BooksActions extends StatelessWidget {
  final BookModel bookModel;
  const BooksActions({
    Key? key,
    required this.bookModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              backGroundColor: Colors.white,
              textColor: Colors.black,
              buttonText: "Free",
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
              onPressed: () async {
                launchCustomFunction(
                  context,
                  bookModel.volumeInfo.previewLink,
                );
              },
              backGroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              buttonText: getText(bookModel),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          )
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return "Not Available";
    } else {
      return "Preview";
    }
  }
}
