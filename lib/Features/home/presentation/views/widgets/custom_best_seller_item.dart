import 'package:epic_minds/constants.dart';
import 'package:epic_minds/core/utils/app_router.dart';
import 'package:epic_minds/core/utils/assets.dart';
import 'package:epic_minds/core/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

class CustomBestSellerItem extends StatelessWidget {
  const CustomBestSellerItem({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kBookDetailsView);
        },
        child: SizedBox(
          height: 135,
          child: Row(
            children: [
              AspectRatio(
                aspectRatio: 2.5 / 4,
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(8),
                    image: const DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(
                        AssetsData.cover,
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                width: 30,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(right: 24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width * .5,
                        child: Text(
                          "Harry Potter and the Goblet of Fire",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: Styles.titleStyle20
                              .copyWith(fontFamily: kGtSectraFine),
                        ),
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      const Text(
                        "J.K Rowling",
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.titleStyle14,
                      ),
                      const SizedBox(
                        height: 3,
                      ),
                      Row(
                        children: [
                          const Text(
                            "19.99 #",
                            style: Styles.titleStyle20,
                          ),
                          const Spacer(),
                          const Icon(
                            FontAwesomeIcons.solidStar,
                            size: 15,
                            color: Color(0xffFFDD4F),
                          ),
                          const SizedBox(
                            width: 6.3,
                          ),
                          const Text(
                            "4.8",
                            style: Styles.titleStyle16,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            "(255)",
                            style: Styles.titleStyle14.copyWith(
                              color: const Color(0xff707070),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
