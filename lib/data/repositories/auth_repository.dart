import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/data/network/api_service.dart';
import 'package:image_picker/image_picker.dart';

import '../models/universal_data.dart';
import '../models/user/user_model.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<UniversalData> sendCodeToGmail(
      {required String gmail, required String password}) async {
    return apiService.sendCodeToEmail(gmail: gmail, password: password);
  }

  Future<UniversalData> registerUser({required UserModel userModel, required XFile xFile}) async {
    return apiService.registerUser(userModel: userModel, xFile: xFile);
  }

  Future<UniversalData> loginUser(
      {required String gmail, required String password}) async{
    return apiService.loginUser(gmail: gmail, password: password);
  }

  Future<UniversalData> confirmCode({required String code}) async{
    return apiService.confirmCode(code: code);
  }

  String getToken()=>StorageRepository.getString("token");

  bool isStart()=>StorageRepository.getBool("isStart");
}
