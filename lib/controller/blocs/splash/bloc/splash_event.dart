// part of 'splash_bloc.dart';

// @immutable
// sealed class SplashEvent {}

//////
part of 'splash_bloc.dart';

@immutable
abstract class SplashEvent {}

class AppStarted extends SplashEvent {}
