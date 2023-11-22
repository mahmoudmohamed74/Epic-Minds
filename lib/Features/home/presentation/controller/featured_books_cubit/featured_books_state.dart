part of 'featured_books_cubit.dart';

abstract class FeaturedBooksState extends Equatable {
  const FeaturedBooksState();

  @override
  List<Object> get props => [];
}

class FeaturedBooksInitialState extends FeaturedBooksState {}

class FeaturedBooksLoadingState extends FeaturedBooksState {}

class FeaturedBooksSuccessState extends FeaturedBooksState {
  final List<BookModel> booksList;

  const FeaturedBooksSuccessState({required this.booksList});
}

class FeaturedBooksErrorState extends FeaturedBooksState {
  final String errMessage;

  const FeaturedBooksErrorState({required this.errMessage});
}
