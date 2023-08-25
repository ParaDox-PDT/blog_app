part of 'auth_cubit.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitial extends AuthState {
  @override
  List<Object?> get props => throw [];
}

class AuthUnAuthenticatedState extends AuthState {
  @override
  List<Object?> get props => throw [];
}

class OnBoardingState extends AuthState{
  @override
  List<Object?> get props => throw [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => throw [];
}

class AuthErrorState extends AuthState {
  final String errorText;

  AuthErrorState({required this.errorText});

  @override
  List<Object?> get props => throw [errorText];
}

class AuthSendCodeSuccessState extends AuthState {
  @override
  List<Object?> get props => throw [];
}

class AuthConfirmCodeSuccessState extends AuthState {
  @override
  List<Object?> get props => throw [];
}

class AuthLoggedState extends AuthState {
  @override
  List<Object?> get props => throw [];
}
