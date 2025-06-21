import 'package:clean_login/core/errors/failure_model.dart';
import 'package:clean_login/features/auth/domain/entities/login_entity.dart';
import 'package:clean_login/features/auth/domain/entities/login_request.dart';
import 'package:dartz/dartz.dart';

abstract class LoginRepository {
  Future<Either<Failure, LoginEntity>> login(LoginRequest request);
}
