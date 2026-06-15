import 'package:ecommerce/features/auth/domain/entities/login_params.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/register_params.dart';
import '../../domain/usecases/RegisterUseCase.dart';
import '../../domain/usecases/get_curent_usecase.dart';
import '../../domain/usecases/login_usecase.dart';
import '../../domain/usecases/logout_usecase.dart';

import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;

  final RegisterUseCase registerUseCase;

  final LogoutUseCase logoutUseCase;

  final GetCurrentUserUseCase getCurrentUserUseCase;

  AuthBloc(
    this.loginUseCase,

    this.registerUseCase,

    this.logoutUseCase,

    this.getCurrentUserUseCase,
  ) : super(AuthInitial()) {
    /// USER LOGIN
    on<UserLoginEvent>(_userLogin);


    /// REGISTER
    on<RegisterEvent>(_register);

    /// LOGOUT
    on<LogoutEvent>(_logout);

    /// GET CURRENT USER
    on<GetCurrentUserEvent>(_getCurrentUser);
  }

  /// USER LOGIN

  Future<void> _userLogin(UserLoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await loginUseCase(
      email: event.email,
      password: event.password,
    );

    result.fold(
      ifLeft: (failure) {
        emit(AuthError(failure.message));
      },
      ifRight: (auth) {
        emit(LoginSuccess(auth));
      },
    );
  }



  Future<void> _register(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await registerUseCase(
      RegisterParams(
        name: event.params.name,
        email: event.params.email,
        password: event.params.password,
        passwordConfirmation: event.params.passwordConfirmation,
      ),
    );

    result.fold(
      ifLeft: (failure) {
        emit(AuthError(failure.message));
      },
      ifRight: (message) {
        emit(RegisterSuccess(message));
      },
    );
  }



  Future<void> _logout(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());

    final result = await logoutUseCase.execute();

    result.fold(
      ifLeft: (failure) => emit(AuthError(failure.message)),
      ifRight: (success) => emit(LogoutSuccess()),
    );
  }



  Future<void> _getCurrentUser(
    GetCurrentUserEvent event,
    Emitter<AuthState> emit,
  ) async {
    emit(AuthLoading());

    final result = await getCurrentUserUseCase.execute();

    result.fold(
      ifLeft: (failure) {
        emit(AuthError(failure.message));
      },
      ifRight: (user) {
        emit(CurrentUserSuccess(user));
      },
    );
  }
}
