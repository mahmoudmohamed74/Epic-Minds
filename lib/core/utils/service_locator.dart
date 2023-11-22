import 'package:dio/dio.dart';
import 'package:epic_minds/Features/home/data/repos/home_repo_impl.dart';
import 'package:epic_minds/core/utils/api_service.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;
void setupServiceLocator() {
  sl.registerSingleton<ApiService>(ApiService(Dio()));
  sl.registerSingleton<HomeRepoImpl>(HomeRepoImpl(sl.get<ApiService>()));
}
