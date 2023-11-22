import 'package:bloc/bloc.dart';
import 'package:epic_minds/Features/home/data/models/book_model/book_model.dart';
import 'package:epic_minds/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'featured_books_state.dart';

class FeaturedBooksCubit extends Cubit<FeaturedBooksState> {
  final HomeRepo homeRepo;
  FeaturedBooksCubit(this.homeRepo) : super(FeaturedBooksInitial());
}
