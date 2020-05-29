import 'package:movie_app/api/api_provider.dart';

class ApiRepository {
  ApiProvider _apiProvider = ApiProvider();

  Future<dynamic> getMovieDetailByName(Map<String, dynamic> query) {
    return _apiProvider.getMovieDetailByName(query);
  }

  Future<dynamic> getMoviesBySearch(Map<String, dynamic> query) {
    return _apiProvider.getMovieDetailByName(query);
  }
}
