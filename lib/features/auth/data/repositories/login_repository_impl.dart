import 'package:clean_login/core/errors/exceptions.dart';
import 'package:clean_login/core/errors/failure_model.dart';
import 'package:clean_login/features/auth/data/data_sources/remote_login_datasource.dart';
import 'package:clean_login/features/auth/domain/entities/login_entity.dart';
import 'package:clean_login/features/auth/domain/entities/login_request.dart';
import 'package:clean_login/features/auth/domain/repositories/login_repository.dart';
import 'package:dartz/dartz.dart';

class LoginRepositoryImpl implements LoginRepository {
  final  RemoteLoginDatasource remoteLoginDatasource;

  LoginRepositoryImpl({required this.remoteLoginDatasource});
  @override
  Future<Either<Failure, LoginEntity>> login(LoginRequest request) async{
    try {
      final remoteUser = await remoteLoginDatasource.login(request);
      return Right(remoteUser);
    } on ServerException catch (e) {
      return Left(Failure(errMessage: e.errorModel.errMessage));
    } catch (e) {
      return Left(Failure(errMessage:  e.toString()));
    }
    
  }

}