import 'package:epic_minds/Features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:epic_minds/core/widgets/custom_error_widget.dart';
import 'package:epic_minds/core/widgets/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomBooksListView extends StatelessWidget {
  const CustomBooksListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccessState) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .3,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: state.booksList.length,
              padding: EdgeInsets.zero,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .3,
                    child: CustomBookImage(
                      imageUrl: state.booksList[index].volumeInfo.imageLinks
                              ?.thumbnail ??
                          "",
                    ),
                  ),
                );
              },
            ),
          );
        } else if (state is FeaturedBooksErrorState) {
          return CustomErrorWidget(
            errorMessage: state.errMessage,
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
