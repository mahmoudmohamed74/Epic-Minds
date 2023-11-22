import 'package:epic_minds/Features/home/data/repos/home_repo_impl.dart';
import 'package:epic_minds/Features/home/presentation/controller/best_seller_cubit/best_seller_cubit.dart';
import 'package:epic_minds/Features/home/presentation/controller/featured_books_cubit/featured_books_cubit.dart';
import 'package:epic_minds/constants.dart';
import 'package:epic_minds/core/utils/app_router.dart';
import 'package:epic_minds/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupServiceLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => FeaturedBooksCubit(
            sl.get<HomeRepoImpl>(),
          )..getFeaturedBooks(),
        ),
        BlocProvider(
          create: (context) => BestSellerCubit(
            sl.get<HomeRepoImpl>(),
          ),
        )
      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme:
              GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
