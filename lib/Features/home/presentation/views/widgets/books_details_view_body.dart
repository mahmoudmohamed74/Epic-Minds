import 'package:epic_minds/Features/home/data/models/book_model/book_model.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/books_actions.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/custom_book_details_appbar.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/similar_books_list_view.dart';
import 'package:epic_minds/core/utils/styles.dart';
import 'package:flutter/material.dart';

class BooksDetailsViewBody extends StatelessWidget {
  final BookModel bookModel;
  const BooksDetailsViewBody({super.key, required this.bookModel});

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
                  child: CustomBookImage(
                    imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? '',
                  ),
                ),
                const SizedBox(
                  height: 43,
                ),
                Text(
                  bookModel.volumeInfo.title!,
                  style: Styles.titleStyle30,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  maxLines: 2,
                ),
                const SizedBox(
                  height: 6,
                ),
                Opacity(
                  opacity: .7,
                  child: Text(
                    bookModel.volumeInfo.authors?[0] ?? "",
                    style: Styles.titleStyle18.copyWith(
                      fontWeight: FontWeight.w500,
                      fontStyle: FontStyle.italic,
                    ),
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                    maxLines: 2,
                  ),
                ),
                const SizedBox(
                  height: 18,
                ),
                BookRating(
                  mainAxisAlignment: MainAxisAlignment.center,
                  bookRating: bookModel.volumeInfo.averageRating ?? 0,
                  count: bookModel.volumeInfo.ratingsCount ?? 0,
                ),
                const SizedBox(
                  height: 37,
                ),
                BooksActions(bookModel: bookModel),
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
