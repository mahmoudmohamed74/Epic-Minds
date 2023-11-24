import 'package:epic_minds/Features/home/presentation/views/widgets/custom_best_seller_item.dart';
import 'package:epic_minds/Features/search/presentation/controllers/cubit/search_cubit.dart';
import 'package:epic_minds/core/widgets/custom_error_widget.dart';
import 'package:epic_minds/core/widgets/custom_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/utils/styles.dart';
import 'custom_search_text_field.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          CustomSearchTextField(),
          SizedBox(
            height: 16,
          ),
          Text(
            'Search Result',
            style: Styles.titleStyle18,
          ),
          SizedBox(
            height: 16,
          ),
          Expanded(
            child: SearchResultListView(),
          ),
        ],
      ),
    );
  }
}

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchCubit, SearchState>(
      builder: (context, state) {
        if (state is SearchSuccessState) {
          return ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.booksList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomBestSellerItem(
                  bookModel: state.booksList[index],
                ),
              );
            },
          );
        } else if (state is SearchErrorState) {
          return CustomErrorWidget(errorMessage: state.errMessage);
        } else if (state is SearchInitial) {
          return const Text('no results');
        } else {
          return CustomLoadingIndicator();
        }
      },
    );
  }
}
