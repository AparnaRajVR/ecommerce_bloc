// part of 'splash_bloc.dart';

// @immutable
// sealed class SplashState {}

// final class SplashInitial extends SplashState {}

///////////
part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class SplashLoading extends SplashState {}

class SplashLoaded extends SplashState {
  final bool isLoggedIn;

  SplashLoaded({required this.isLoggedIn});
}

