import 'package:dio/dio.dart';
import 'package:epic_minds/Features/home/data/models/book_model/book_model.dart';
import 'package:dartz/dartz.dart';
import 'package:epic_minds/Features/home/data/repos/home_repo.dart';
import 'package:epic_minds/core/errors/failure.dart';
import 'package:epic_minds/core/utils/api_service.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiService apiService;

  HomeRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async {
    print("111111111111111");

    try {
      var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&q=harry potter",
      );
      print("2222222222222222222222");
      print(data['id']);
      List<BookModel> books = [];
      for (var item in data['item']) {
        books.add(BookModel.fromJson(item));
      }
      print("${books[0].id}name");
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() async {
    print("111111111111111");

    try {
      var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&Soring=newest&q=harry potter",
      );
      print("2222222222222222222222");
      print(data['id']);
      List<BookModel> books = [];
      for (var item in data['item']) {
        books.add(BookModel.fromJson(item));
      }
      print("${books[0].id}name");
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
