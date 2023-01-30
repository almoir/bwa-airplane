part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class AuthLoading extends AuthState {}

class AuthSuccess extends AuthState {
  final UserModel user;

  // ignore: prefer_const_constructors_in_immutables
  AuthSuccess(this.user);

  @override
  List<Object> get props => [user];
}

class AuthFailed extends AuthState {
  final String error;
  // ignore: prefer_const_constructors_in_immutables
  AuthFailed(this.error);

  @override
  List<Object> get props => [error];
}
