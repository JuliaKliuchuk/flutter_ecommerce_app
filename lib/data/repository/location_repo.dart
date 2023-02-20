import 'package:flutter_ecommerce_app/data/api/api_client.dart';
import 'package:flutter_ecommerce_app/models/address_model.dart';
import 'package:flutter_ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;

  LocationRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> getAddressFromGeocode(LatLng latLng) async {
    return apiClient.getData('${AppConstans.GEOCODE_URL}'
        '?lat=${latLng.latitude}&lng=${latLng.longitude}');
  }

  String getUserAddress() {
    return sharedPreferences.getString(AppConstans.USER_ADDRESS) ?? '';
  }

  Future<Response> addAddress(AddressModel addressModel) async {
    return await apiClient.postData(
        AppConstans.ADD_USER_ADDRESS, addressModel.toJson());
  }

  Future<Response> getAllAddress() async {
    return await apiClient.getData(AppConstans.ADDRESS_LIST_URL);
  }

  Future<bool> saveUserAddress(String address) async {
    apiClient.updateHeader(sharedPreferences.getString(AppConstans.TOKEN)!);
    return await sharedPreferences.setString(AppConstans.USER_ADDRESS, address);
  }
}
