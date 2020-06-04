import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:movie_app/data/movie_repository.dart';
import 'package:movie_app/data/shared_preferences.dart';

import 'package:movie_app/data/user_repository.dart';
import './bloc.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final UserRepo _userRepo = UserRepo();
  final MovieRepo _movieRepo = MovieRepo();

  @override
  AuthState get initialState => AuthInitialState();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    if (event is AuthCheckEvent) {
      final bool userExists = await _userRepo.checkUser();

      if (userExists) {
        yield AuthCheckSuccessState();
      } else {
        yield AuthCheckFailureState();
      }
    } else if (event is AuthLoginInEvent) {
      try {
        yield AuthLoadingState();
        final Map<String, dynamic> response =
            await _movieRepo.getMovieDetailsByName(event.name, event.password);

        if (response['success']) {
          yield AuthLoginSuccessState();
        } else {
          yield AuthLoginFailureState(
            email: event.name,
            password: event.password,
            message: response['message'],
          );
        }
      } catch (e) {
        yield AuthLoginFailureState(
          email: event.name,
          password: event.password,
          message: 'Is the device online?',
        );
      }
    } else if (event is AuthLogoutEvent) {
      await MySharedPreferences().setUser(false);
      yield AuthCheckFailureState();
    }
  }
}
