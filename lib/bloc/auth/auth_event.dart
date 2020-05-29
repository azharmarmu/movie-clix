import 'package:flutter/foundation.dart';
import 'package:equatable/equatable.dart';

@immutable
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class AuthCheckEvent extends AuthEvent {
  @override
  String toString() => 'AuthCheckEvent';

  @override
  List<Object> get props => [];
}

class AuthLoginInEvent extends AuthEvent {
  final String name;
  final String password;

  AuthLoginInEvent({@required this.name, @required this.password});

  @override
  String toString() => 'AuthLoginInEvent';

  @override
  List<Object> get props => [];
}

class AuthLogoutEvent extends AuthEvent {
  AuthLogoutEvent();

  @override
  String toString() => 'AuthLogoutEvent';

  @override
  List<Object> get props => [];
}
