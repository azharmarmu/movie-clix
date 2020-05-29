import 'package:dio/dio.dart';

class ApiProvider {
  static final baseUrl = 'http://www.omdbapi.com/';
  static final apiKey = 'dc09e98d';
  Dio dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: 5000,
      receiveTimeout: 3000,
      queryParameters: {'apikey': apiKey},
    ),
  );

  //get movie-detail by name
  Future<dynamic> getMovieDetailByName(query) async {
    return await dio
        .get(
          '',
          queryParameters: query,
        )
        .then(
          (value) => value,
          onError: (error) => error.response,
        );
  }

  //get movies by search
  Future<dynamic> getMoviesBySearch(query) async {
    return await dio
        .get(
          '',
          queryParameters: query,
        )
        .then(
          (value) => value,
          onError: (error) => error.response,
        );
  }
}
