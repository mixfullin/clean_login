import 'package:clean_login/features/auth/data/models/login_model.dart';
import 'package:clean_login/features/auth/domain/entities/login_request.dart';

abstract class RemoteLoginDatasource {
  Future<LoginModel> login(LoginRequest request);
}