import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:movie_app/models/movie_model.dart';

@immutable
abstract class LandingState extends Equatable {
  const LandingState();
}

class LandingInitialState extends LandingState {
  @override
  String toString() => 'LandingInitialState';

  @override
  List<Object> get props => [];
}

class LandingLoadingState extends LandingState {
  @override
  String toString() => 'LandingLoadingState';

  @override
  List<Object> get props => [];
}

class LandingSearchSuccessState extends LandingState {
  final MovieListModel movieList;

  LandingSearchSuccessState({@required this.movieList});

  @override
  String toString() => 'LandingSearchSuccessState';

  @override
  List<Object> get props => [];
}

class LandingSearchFailureState extends LandingState {
  final String title;
  final String message;

  LandingSearchFailureState({@required this.title, @required this.message});

  @override
  String toString() => 'LandingSearchFailureState';

  @override
  List<Object> get props => [];
}
