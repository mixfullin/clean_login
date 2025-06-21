import 'package:clean_login/features/auth/data/data_sources/remote_login_datasource_impl.dart';
import 'package:clean_login/features/auth/presentation/cubits/login_cubit.dart';
import 'package:get_it/get_it.dart';
import 'package:dio/dio.dart';
import 'package:clean_login/core/database/apis/api_consumer.dart';
import 'package:clean_login/core/database/apis/dio_consumer.dart';
import 'package:clean_login/features/auth/data/data_sources/remote_login_datasource.dart';
import 'package:clean_login/features/auth/data/repositories/login_repository_impl.dart';
import 'package:clean_login/features/auth/domain/repositories/login_repository.dart';
import 'package:clean_login/features/auth/domain/usecases/login_usecase.dart';


final getIt = GetIt.instance;

Future<void> init() async {
  //! Core
  //  API Consumer
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(dio: getIt()));

  //  Dio
  getIt.registerLazySingleton(() => Dio());
  //! Login 
  //  Cubit
  getIt.registerFactory(() => LoginCubit(loginUsecase:  getIt()));

  //  UseCase
  getIt.registerLazySingleton(() => LoginUsecase(repository:  getIt()));

  //  Repository
  getIt.registerLazySingleton<LoginRepository>(() => LoginRepositoryImpl(remoteLoginDatasource: getIt()));

  //  Remote Data Source
  getIt.registerLazySingleton<RemoteLoginDatasource>(() => RemoteLoginDatasourceImpl(api: getIt()));
}
