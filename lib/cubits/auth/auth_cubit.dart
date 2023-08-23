import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_defualt_project/data/models/universal_data.dart';
import 'package:flutter_defualt_project/data/models/user/user_model.dart';
import 'package:flutter_defualt_project/data/repositories/auth_repository.dart';
import 'package:image_picker/image_picker.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit({required this.authRepository}) : super(AuthInitial());

  final AuthRepository authRepository;

   int gender = 0;
   XFile? file;

   changeGender(int newGender){
     gender=newGender;
   }

   changeXFIle(XFile newFile){
     file=newFile;
   }

   XFile? getXFile(){
     return file;
   }

   int getGender(){
     return gender;
   }

  Future<void> checkLoggedAndOnBoardingState() async {
    await Future.delayed(const Duration(seconds: 3));
    if (!authRepository.isStart()) {
      emit(OnBoardingState());
    } else if (authRepository.getToken().isEmpty) {
      emit(AuthUnAuthenticatedState());
    } else {
      emit(AuthLoggedState());
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
      authRepository.setBool();
      authRepository.setToken(token: universalData.data as String);
      emit(AuthLoggedState());
    } else {
      emit(
        AuthErrorState(errorText: universalData.error),
      );
    }
  }


  Future<void> registerUser({required UserModel userModel})async{
    emit(AuthLoadingState());
    UniversalData universalData = await authRepository.registerUser(userModel: userModel);
    if (universalData.error.isEmpty) {
      debugPrint("TOKEN${universalData.data}");
      authRepository.setBool();
      authRepository.setToken(token: universalData.data as String);
      emit(AuthLoggedState());
    } else {
      emit(AuthErrorState(errorText: universalData.error));
    }
  }

  Future<void> logOutUser()async{
    emit(AuthLoadingState());
    bool? isDeleted=await authRepository.deleteToken();
    if(isDeleted!=null){
      emit(AuthUnAuthenticatedState());
    }
  }
}
