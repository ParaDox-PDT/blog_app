import '../models/universal_data.dart';
import '../network/api_service.dart';

class ProfileRepository {
  final ApiService apiService;

  ProfileRepository({required this.apiService});

  Future<UniversalData> getUserData() async => apiService.getProfileData();
}