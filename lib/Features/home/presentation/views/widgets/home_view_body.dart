import 'package:epic_minds/Features/home/presentation/views/widgets/custom_app_bar.dart';
import 'package:epic_minds/Features/home/presentation/views/widgets/custom_books_list_view.dart';
import 'package:epic_minds/core/utils/styles.dart';
import 'package:flutter/material.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: const [
        CustomAppBar(),
        CustomBooksListView(),
        SizedBox(
          height: 50,
        ),
        Padding(
          padding: EdgeInsets.only(left: 18),
          child: Text(
            "Best Seller",
            style: Styles.titleStyle,
          ),
        )
      ],
    );
  }
}
