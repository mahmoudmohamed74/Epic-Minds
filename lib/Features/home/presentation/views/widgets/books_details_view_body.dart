import 'package:epic_minds/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/books_actions.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:epic_minds/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BooksDetailsViewBody extends StatelessWidget {
  const BooksDetailsViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                const CustomBookDetailsAppBar(),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: width * .17),
                  child: const CustomBookImage(
                    imageUrl:
                        'data:image/jpeg;base64,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',
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                const Text(
                  "Best Seller",
                  style: Styles.titleStyle30,
                ),
                const SizedBox(
                  height: 6,
                ),
                Opacity(
                  opacity: .7,
                  child: Text(
                    "Best Seller",
                    style: Styles.titleStyle18.copyWith(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                const BookRating(mainAxisAlignment: MainAxisAlignment.center),
                const SizedBox(
                  height: 37,
                ),
                const BooksActions(),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "You may like",
                    style: Styles.titleStyle14.copyWith(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                const SimilarBooksListView(),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
