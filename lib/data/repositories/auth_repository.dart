import 'package:flutter_defualt_project/data/local/storage_repository/storage_repository.dart';
import 'package:flutter_defualt_project/data/network/api_service.dart';


import '../models/universal_data.dart';
import '../models/user/user_model.dart';

class AuthRepository {
  final ApiService apiService;

  AuthRepository({required this.apiService});

  Future<UniversalData> sendCodeToGmail(
      {required String gmail, required String password}) async {
    return apiService.sendCodeToEmail(gmail: gmail, password: password);
  }

  Future<UniversalData> registerUser({required UserModel userModel}) async {
    return apiService.registerUser(userModel: userModel);
  }

  Future<UniversalData> loginUser(
      {required String gmail, required String password}) async {
    return apiService.loginUser(gmail: gmail, password: password);
  }

  Future<UniversalData> confirmCode({required String code}) async {
    return apiService.confirmCode(code: code);
  }

  String getToken() => StorageRepository.getString("token");

  Future<void> setToken({required String token}) async =>
      StorageRepository.putString("token", token);

  Future<UniversalData> getArticles()async{
    return apiService.getArticles();
  }

  Future<bool?> deleteToken() async => StorageRepository.deleteString("token");

  bool isStart() => StorageRepository.getBool("isStart");

  Future<void> setBool() async =>
      await StorageRepository.putBool("isStart", true);
}
