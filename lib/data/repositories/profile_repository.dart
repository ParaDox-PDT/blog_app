import 'package:flutter_defualt_project/data/network/secure_api_service.dart';
import 'package:flutter_defualt_project/service/service_locator.dart';

import '../models/universal_data.dart';

class ProfileRepository {

  ProfileRepository();

  Future<UniversalData> getUserData() async => getIt.get<SecureApiService>().getProfileData();
}