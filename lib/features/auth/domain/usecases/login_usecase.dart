import 'package:clean_login/core/errors/failure_model.dart';
import 'package:clean_login/features/auth/domain/entities/login_entity.dart';
import 'package:clean_login/features/auth/domain/entities/login_request.dart';
import 'package:clean_login/features/auth/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUsecase {
  final LoginRepository repository;

  LoginUsecase({required this.repository});
  Future<Either<Failure, LoginEntity>> call(LoginRequest request) {
    return repository.login(request);
  }
}
