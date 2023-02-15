import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:flutter_ecommerce_app/data/api/api_client.dart';
import 'package:flutter_ecommerce_app/models/sign_up_model.dart';
import 'package:flutter_ecommerce_app/utils/app_constants.dart';

class AuthRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  AuthRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> registration(SignUpModel data) async {
    return await apiClient.postData(
      AppConstans.REGISTRATION_URL,
      data.toJson(),
    );
  }

  Future<Response> login(String phone, String password) async {
    return await apiClient.postData(
      AppConstans.LOGIN_URL,
      {'phone': phone, 'password': password},
    );
  }

  bool userLoggedIn() {
    return sharedPreferences.containsKey(AppConstans.TOKEN);
  }

  Future<String> getUserToken() async {
    return sharedPreferences.getString(AppConstans.TOKEN) ?? 'None';
  }

  Future<bool> saveUserToken(String token) async {
    apiClient.token = token;
    apiClient.updateHeader(token);
    return await sharedPreferences.setString(AppConstans.TOKEN, token);
  }

  Future<void> saveUserPhoneAndPass(String phone, String pass) async {
    try {
      await sharedPreferences.setString(AppConstans.PHONE, phone);
      await sharedPreferences.setString(AppConstans.PASSWORD, pass);
    } catch (e) {
      rethrow;
    }
  }

  bool clearSharedData() {
    sharedPreferences.remove(AppConstans.TOKEN);
    sharedPreferences.remove(AppConstans.PHONE);
    sharedPreferences.remove(AppConstans.PASSWORD);
    apiClient.token = '';
    apiClient.updateHeader('');
    return true;
  }
}
