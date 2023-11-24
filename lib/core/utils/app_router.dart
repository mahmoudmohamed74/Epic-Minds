import 'package:epic_minds/Features/home/data/models/book_model/book_model.dart';
import 'package:epic_minds/Features/home/data/repos/home_repo_impl.dart';
import 'package:epic_minds/Features/home/presentation/controller/similar_books/similar_books_cubit.dart';
import 'package:epic_minds/Features/home/presentation/views/books_details_view.dart';
import 'package:epic_minds/Features/home/presentation/views/home_view.dart';
import 'package:epic_minds/Features/search/presentation/views/search_view.dart';
import 'package:epic_minds/Features/splash/presentation/views/splash_screen.dart';
import 'package:epic_minds/core/utils/service_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = "/homeView";
  static const kBookDetailsView = "/bookDetailsView";
  static const kSearchView = "/searchView";
  static final GoRouter router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashView();
        },
      ),
      GoRoute(
        path: kHomeView,
        builder: (BuildContext context, GoRouterState state) {
          return const HomeView();
        },
      ),
      GoRoute(
        path: kSearchView,
        builder: (BuildContext context, GoRouterState state) {
          return const SearchView();
        },
      ),
      GoRoute(
        path: kBookDetailsView,
        builder: (BuildContext context, GoRouterState state) {
          return BlocProvider(
            create: (context) => SimilarBooksCubit(sl.get<HomeRepoImpl>()),
            child: BooksDetailsView(
              bookModel: state.extra as BookModel,
            ),
          );
        },
      ),
    ],
  );
}
