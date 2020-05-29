import 'dart:convert';

import 'package:movie_app/api/api_repository.dart';
import 'package:movie_app/data/shared_preferences.dart';
import 'package:movie_app/models/movie_model.dart';

abstract class MovieRepository {
  Future<Map<String, dynamic>> getMovieDetailsByName(
      String name, String password);

  Future<Map<String, dynamic>> getMoviesBySearch(String searchKey);
}

class MovieRepo extends MovieRepository {
  ApiRepository _apiRepository = ApiRepository();

  @override
  Future<Map<String, dynamic>> getMovieDetailsByName(
      String name, String password) async {
    Map<String, dynamic> _responseMap = Map();

    Map<String, dynamic> query = Map();
    query['t'] = name;
    query['y'] = password;
    query['type'] = 'movie';
    query['plot'] = 'short';

    final result = await _apiRepository.getMovieDetailByName(query);

    final jsonData = json.decode(result.toString());

    bool response = false;

    if (jsonData['Response'].toLowerCase() == 'true') {
      response = true;
    } else {
      _responseMap['message'] = jsonData['Error'];
    }

    await MySharedPreferences().setUser(response);
    _responseMap['success'] = response;
    return _responseMap;
  }

  @override
  Future<Map<String, dynamic>> getMoviesBySearch(String searchKey) async {
    Map<String, dynamic> _responseMap = Map();

    Map<String, dynamic> query = Map();
    query['s'] = searchKey;
    query['type'] = 'movie';
    query['page'] = '1';

    final result = await _apiRepository.getMoviesBySearch(query);

    final jsonData = json.decode(result.toString());

    print('response: $jsonData');

    bool response = false;

    if (jsonData['Response'].toLowerCase() == 'true') {
      response = true;
      _responseMap['movieList'] = MovieListModel.fromJson(jsonData);
    } else {
      _responseMap['message'] = jsonData['Error'];
    }

    _responseMap['success'] = response;
    return _responseMap;
  }
}
