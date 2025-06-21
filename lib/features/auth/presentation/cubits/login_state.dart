import 'package:clean_login/features/auth/domain/entities/login_entity.dart';
import 'package:equatable/equatable.dart';

abstract class LoginState extends Equatable {
    @override
  List<Object?> get props => [];
}
class LoginInitial extends LoginState{}
class LoginLoading extends LoginState{}
class LoginSuccess extends LoginState{
  final LoginEntity entity ;

  LoginSuccess({required this.entity}); 
    @override
  List<Object?> get props => [entity];
}
class LoginFailure extends LoginState {
  final String message ;

  LoginFailure({required this.message}); 
   @override
  List<Object?> get props => [message];

}