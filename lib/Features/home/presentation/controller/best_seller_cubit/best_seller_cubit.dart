import 'package:bloc/bloc.dart';
import 'package:epic_minds/Features/home/data/models/book_model/book_model.dart';
import 'package:epic_minds/Features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'best_seller_state.dart';

class BestSellerCubit extends Cubit<BestSellerState> {
  final HomeRepo homeRepo;
  BestSellerCubit(this.homeRepo) : super(BestSellerInitialState());

  Future<void> getBestSellerBooks() async {
    emit(BestSellerLoadingState());
    var result = await homeRepo.fetchBestSellerBooks();
    result.fold(
      (failure) {
        emit(BestSellerErrorState(errorMessage: failure.errorMessage));
      },
      (books) {
        emit(BestSellerSuccessState(bestSellerList: books));
      },
    );
  }
}
