// part of 'login_bloc.dart';

// @immutable
// sealed class LoginState {}

// final class LoginInitial extends LoginState {}

part of 'login_bloc.dart';

abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;

  LoginFailure({required this.error});
}