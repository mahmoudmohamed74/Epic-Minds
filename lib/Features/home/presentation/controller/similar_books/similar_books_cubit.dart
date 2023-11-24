import 'package:bloc/bloc.dart';
import 'package:epic_minds/Features/home/data/models/book_model/book_model.dart';
import 'package:epic_minds/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'similar_books_state.dart';

class SimilarBooksCubit extends Cubit<SimilarBooksState> {
  final HomeRepo homeRepo;
  SimilarBooksCubit(this.homeRepo) : super(SimilarBooksInitial());

  Future<void> getSimilarBooks({required String bookCategory}) async {
    emit(SimilarBooksLoadingState());
    var result = await homeRepo.fetchSimilarBooks(bookCategory: bookCategory);
    result.fold(
      (failure) {
        emit(SimilarBooksErrorState(errMessage: failure.errorMessage));
      },
      (books) {
        emit(SimilarBooksSuccessState(booksList: books));
      },
    );
  }
}
