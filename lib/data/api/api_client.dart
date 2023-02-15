import 'package:flutter_ecommerce_app/utils/app_constants.dart';
import 'package:get/get.dart';

class ApiClient extends GetConnect implements GetxService {
  late String token;
  final String appBaseUrl;

  late Map<String, String> mainHeaders;

  ApiClient({required this.appBaseUrl}) {
    baseUrl = appBaseUrl;
    timeout = const Duration(seconds: 30);
    token = AppConstans.TOKEN;
    mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Autorization': 'Bearer $token',
    };
  }

  void updateHeader(String token) {
    mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Autorization': 'Bearer $token',
    };
  }

  Future<Response> getData(String url) async {
    try {
      Response response = await get(url);
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String url, dynamic body) async {
    print('body----------${body.toString()}');
    try {
      Response response = await post(
        url,
        body,
        headers: mainHeaders,
      );
      return response;
    } catch (e) {
      print(e.toString());
      return Response(statusCode: 1, statusText: e.toString());
    }
  }
}
