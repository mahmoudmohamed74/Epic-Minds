import 'package:dio/dio.dart';
import 'package:epic_minds/Features/home/data/models/book_model/book_model.dart';
import 'package:epic_minds/Features/search/data/models/search_model.dart';
import 'package:dartz/dartz.dart';
import 'package:epic_minds/Features/search/data/repos/search_repo.dart';
import 'package:epic_minds/core/errors/failure.dart';
import 'package:epic_minds/core/utils/api_service.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);
  @override
  Future<Either<Failure, List<SearchModel>>> getSearchByName({
    required String bookName,
  }) async {
    try {
      var data = await apiService.get(
        endPoint:
            'volumes?Filtering=free-ebooks&Sorting=relevance &q=$bookName',
      );

      List<BookModel> books1 = [];
      List<SearchModel> books = [];
      for (var item in data['items']) {
        books1.add(BookModel.fromJson(item));
      }
      for (var book in books1) {
        books.add(SearchModel.fromBookModel(book));
      }
      return right(books);
    } on Exception catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }
      return left(ServerFailure(e.toString()));
    }
  }
}
