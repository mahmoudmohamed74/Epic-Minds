import 'package:epic_minds/Features/home/presentation/controller/best_seller_cubit/best_seller_cubit.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/custom_best_seller_item.dart';
import 'package:epic_minds/core/widgets/custom_error_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_indicator.dart';

class CustomBestSellerListView extends StatelessWidget {
  const CustomBestSellerListView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BestSellerCubit, BestSellerState>(
      builder: (context, state) {
        if (state is BestSellerSuccessState) {
          return ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemCount: state.bestSellerList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: CustomBestSellerItem(
                  bookModel: state.bestSellerList[index],
                ),
              );
            },
          );
        } else if (state is BestSellerErrorState) {
          return CustomErrorWidget(
            errorMessage: state.errorMessage,
          );
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}
