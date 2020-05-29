import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitialState extends AuthState {
  @override
  String toString() => 'AuthInitialState';

  @override
  List<Object> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  String toString() => 'AuthLoadingState';

  @override
  List<Object> get props => [];
}

class AuthCheckSuccessState extends AuthState {
  @override
  String toString() => 'AuthCheckSuccessState';

  @override
  List<Object> get props => [];
}

class AuthLoginSuccessState extends AuthState {
  @override
  String toString() => 'AuthLoginSuccessState';

  @override
  List<Object> get props => [];
}

class AuthCheckFailureState extends AuthState {
  AuthCheckFailureState();

  @override
  String toString() => 'AuthCheckFailureState';

  @override
  List<Object> get props => [];
}

class AuthLoginFailureState extends AuthState {
  final String email;
  final String password;
  final String message;

  AuthLoginFailureState({
    @required this.email,
    @required this.password,
    @required this.message,
  });

  @override
  String toString() => 'AuthLoginFailureState';

  @override
  List<Object> get props => [];
}
