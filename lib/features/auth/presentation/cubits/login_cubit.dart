import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/login_request.dart';
import '../../domain/usecases/login_usecase.dart';
import 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  final LoginUsecase loginUsecase;

  LoginCubit(this.loginUsecase) : super(LoginInitial());

  Future<void> login({required String username, required String password}) async {
    emit(LoginLoading());

    final result = await loginUsecase(LoginRequest(username: username, password: password));

    result.fold(
      (failure) => emit(LoginFailure(message: failure.errMessage)),
      (entity) => emit(LoginSuccess(entity:  entity)),
    );
  }
}
