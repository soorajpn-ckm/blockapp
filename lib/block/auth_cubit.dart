import 'package:flutter_bloc/flutter_bloc.dart';

class AuthState {
  bool isLogged = false;
  CustomUser loggedUser;
}

class CustomUser {
  String mail;
}

final AuthCubit counterCubit = AuthCubit(AuthState());

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(AuthState state) : super(state);

  logIn() {
    loginUsingGoogle();
  }

  logout() {
    state.isLogged = false;
    state.loggedUser = null;
  }
}

bool loginUsingGoogle() {
  return true;
}
