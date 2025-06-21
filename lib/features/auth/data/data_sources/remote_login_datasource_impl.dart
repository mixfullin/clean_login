import 'package:clean_login/core/database/apis/api_consumer.dart';
import 'package:clean_login/core/database/apis/end_points.dart';
import 'package:clean_login/features/auth/data/data_sources/remote_login_datasource.dart';
import 'package:clean_login/features/auth/data/models/login_model.dart';
import 'package:clean_login/features/auth/domain/entities/login_request.dart';

class RemoteLoginDatasourceImpl implements RemoteLoginDatasource{
  final ApiConsumer api ;

  RemoteLoginDatasourceImpl({required this.api});
  @override
  Future<LoginModel> login(LoginRequest request) async{
    final response = await api.post(EndPoints.login,
    data: {
      ApiKeys.userName : request.username,
      ApiKeys.userPassword : request.password,
    }
    
    );
    return LoginModel.fromJson(response);

  }
}