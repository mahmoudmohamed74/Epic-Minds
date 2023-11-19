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
                  child: const CustomBookImage(),
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
