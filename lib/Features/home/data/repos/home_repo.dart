import 'package:dartz/dartz.dart';
import 'package:epic_minds/Features/home/data/models/book_model/book_model.dart';
import 'package:epic_minds/core/errors/failure.dart';

abstract class HomeRepo {
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks();
  Future<Either<Failure, List<BookModel>>> fetchSimilarBooks(
      {required String bookCategory});
}
