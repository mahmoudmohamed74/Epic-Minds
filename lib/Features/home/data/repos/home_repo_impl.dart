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
    try {
      var data = await apiService.get(
        endPoint: "volumes?Filtering=free-ebooks&Soring=newest&q=harry potter",
      );

      List<BookModel> books = [];
      for (var item in data['item']) {
        books.add(BookModel.fromJson(item));
      }
      return right(books);
    } on Exception catch (e) {
      return left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks() {
    // TODO: implement fetchFeaturedBooks
    throw UnimplementedError();
  }
}
