import 'package:bloc/bloc.dart';
import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/data/models/universal_data.dart';
import 'package:flutter_defualt_project/data/repositories/auth_repository.dart';
import 'package:meta/meta.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  final AuthRepository authRepository;

  Future<void> checkLoggedAndOnBoardingState() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!authRepository.isStart()) {
      emit(OnBoardingState());
    } else if (authRepository.getToken().isEmpty) {
      emit(AuthUnAuthenticatedState());
    } else {
      emit(AuthLoadingState());
    }
  }

  Future<void> sendCodeToGmail(
      {required String gmail, required String password}) async {
    emit(AuthLoadingState());
    UniversalData universalData =
        await authRepository.sendCodeToGmail(gmail: gmail, password: password);
    if (universalData.error.isEmpty) {
      emit(AuthSendCodeSuccessState());
    } else {
      emit(
        AuthErrorState(errorText: universalData.error),
      );
    }
  }

  Future<void> confirmCode({required String code}) async {
    emit(AuthLoadingState());
    UniversalData universalData = await authRepository.confirmCode(code: code);
    if (universalData.error.isEmpty) {
      emit(AuthConfirmCodeSuccessState());
    } else {
      emit(
        AuthErrorState(errorText: universalData.error),
      );
    }
  }

  Future<void> loginUser(
      {required String gmail, required String password}) async {
    emit(AuthLoadingState());
    UniversalData universalData =
        await authRepository.loginUser(gmail: gmail, password: password);
    if (universalData.error.isEmpty) {
      StorageRepository.putString("token", universalData.data);
      emit(AuthLoggedState());
    } else {
      emit(
        AuthErrorState(errorText: universalData.error),
      );
    }
  }
}
