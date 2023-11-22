part of 'best_seller_cubit.dart';

abstract class BestSellerState extends Equatable {
  const BestSellerState();

  @override
  List<Object> get props => [];
}

class BestSellerInitialState extends BestSellerState {}

class BestSellerLoadingState extends BestSellerState {}

class BestSellerErrorState extends BestSellerState {
  final String errorMessage;

  const BestSellerErrorState({required this.errorMessage});
}

class BestSellerSuccessState extends BestSellerState {
  final List<BookModel> bestSellerList;

  const BestSellerSuccessState({required this.bestSellerList});
}
