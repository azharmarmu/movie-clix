import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class LandingEvent extends Equatable {
  const LandingEvent();
}

class LandingInitialEvent extends LandingEvent {
  LandingInitialEvent();

  @override
  String toString() => 'LandingInitialEvent';

  @override
  List<Object> get props => [];
}

class LandingSearchEvent extends LandingEvent {
  final String searchKey;

  LandingSearchEvent({@required this.searchKey});

  @override
  String toString() => 'LandingSearchEvent';

  @override
  List<Object> get props => [];
}
