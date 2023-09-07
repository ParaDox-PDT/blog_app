import 'package:flutter_defualt_project/data/network/open_api_service.dart';
import 'package:flutter_defualt_project/data/network/secure_api_service.dart';
import 'package:flutter_defualt_project/service/service_locator.dart';

import '../models/universal_data.dart';
import '../models/websites/websites_model.dart';

class WebsiteRepository {
  WebsiteRepository();

  Future<UniversalData> getWebsites() async => getIt.get<OpenApiService>().getWebsites();

  Future<UniversalData> getWebsiteById(int websiteId) async =>
      getIt.get<OpenApiService>().getWebsiteById(websiteId);

  Future<UniversalData> createWebsite(WebsiteModel newWebsite) async =>
      getIt.get<SecureApiService>().createWebsite(websiteModel: newWebsite);
}