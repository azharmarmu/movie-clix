import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:movie_app/data/movie_repository.dart';

import './bloc.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  final MovieRepo _movieRepo = MovieRepo();

  @override
  LandingState get initialState => LandingInitialState();

  @override
  Stream<LandingState> mapEventToState(
    LandingEvent event,
  ) async* {
    if (event is LandingInitialEvent) {
      yield LandingInitialState();
    } else if (event is LandingSearchEvent) {
      try {
        yield LandingLoadingState();
        final Map<String, dynamic> response =
            await _movieRepo.getMoviesBySearch(event.searchKey);

        if (response['success']) {
          yield LandingSearchSuccessState(
            movieList: response['movieList'],
          );
        } else {
          yield LandingSearchFailureState(
            title: response['message'],
            message: 'Try another word',
          );
        }
      } on SocketException {
        yield LandingSearchFailureState(
          title: 'Check Internet!',
          message: 'Is the device online?',
        );
      }
    }
  }
}
