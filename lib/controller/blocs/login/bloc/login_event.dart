// part of 'login_bloc.dart';

// @immutable
// sealed class LoginEvent {}

part of 'login_bloc.dart';

abstract class LoginEvent {}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  LoginButtonPressed({required this.username, required this.password});
}