import 'package:epic_minds/Features/home/data/models/book_model/book_model.dart';
import 'package:epic_minds/Features/home/presentation/controller/similar_books/similar_books_cubit.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/books_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BooksDetailsView extends StatefulWidget {
  final BookModel bookModel;
  const BooksDetailsView({super.key, required this.bookModel});

  @override
  State<BooksDetailsView> createState() => _BooksDetailsViewState();
}

class _BooksDetailsViewState extends State<BooksDetailsView> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).getSimilarBooks(
      bookCategory: widget.bookModel.volumeInfo.categories![0],
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BooksDetailsViewBody(
          bookModel: widget.bookModel,
        ),
      ),
    );
  }
}
