import 'package:flutter_ecommerce_app/data/api/api_client.dart';
import 'package:get/get.dart';

import '../../utils/app_constants.dart';

class UserRepo {
  final ApiClient apiClient;

  UserRepo({
    required this.apiClient,
  });

  Future<Response> getUserData() async {
    return await apiClient.getData(AppConstans.USER_INFO_URL);
  }
}
