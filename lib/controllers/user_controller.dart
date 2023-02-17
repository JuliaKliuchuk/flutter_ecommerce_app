import 'dart:developer';

import 'package:flutter_ecommerce_app/models/response_model.dart';
import 'package:flutter_ecommerce_app/models/user_model.dart';
import 'package:get/get.dart';

import '../data/repository/user_repo.dart';

class UserController extends GetxController implements GetxService {
  final UserRepo userRepo;

  UserController({
    required this.userRepo,
  });

  bool _isLoading = false;
  late UserModel _userModel;

  bool get isLoading => _isLoading;
  UserModel get userModel => _userModel;

  Future<ResponseModel> getUserData() async {
    Response response = await userRepo.getUserData();
    late ResponseModel responseModel;

    if (response.statusCode == 200) {
      _userModel = UserModel.fromJson(response.body);

      log(response.body.toString());

      _isLoading = true;
      responseModel = ResponseModel(true, 'successfully');
    } else {
      responseModel = ResponseModel(false, response.statusText!);
    }

    update();
    return responseModel;
  }
}
