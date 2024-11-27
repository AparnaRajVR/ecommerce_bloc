// import 'package:bloc/bloc.dart';
// import 'package:meta/meta.dart';

// part 'login_event.dart';
// part 'login_state.dart';

// class LoginBloc extends Bloc<LoginEvent, LoginState> {
//   LoginBloc() : super(LoginInitial()) {
//     on<LoginEvent>((event, emit) {
//       // TODO: implement event handler
//     });
//   }
// }

import 'package:bloc/bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../api/login.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepository authRepository;

  LoginBloc({required this.authRepository}) : super(LoginInitial()) {
    on<LoginButtonPressed>(_onLoginButtonPressed);
  }

  Future<void> _onLoginButtonPressed(
    LoginButtonPressed event,
    Emitter<LoginState> emit,
  ) async {
    emit(LoginLoading());

    try {
      await authRepository.authenticate(
        username: event.username,
        password: event.password,
      );
      final prefs = await SharedPreferences.getInstance();
      await prefs.setBool('isLoggedIn', true);
      emit(LoginSuccess());
    } catch (error) {
      emit(LoginFailure(error: error.toString()));
    }
  }
}