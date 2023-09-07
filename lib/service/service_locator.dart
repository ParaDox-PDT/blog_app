import 'package:flutter_defualt_project/data/network/open_api_service.dart';
import 'package:flutter_defualt_project/data/network/secure_api_service.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void getItSetup(){
  getIt.registerLazySingleton<OpenApiService>(() => OpenApiService());
  getIt.registerLazySingleton<SecureApiService>(() => SecureApiService());
}