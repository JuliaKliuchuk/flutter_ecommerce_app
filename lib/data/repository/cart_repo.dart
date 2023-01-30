import 'dart:convert';

import 'package:flutter_ecommerce_app/models/cart_model.dart';
import 'package:flutter_ecommerce_app/utils/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartRepo {
  final SharedPreferences sharedPreferences;

  CartRepo({required this.sharedPreferences});

  List<String> cart = [];
  List<String> cartHistory = [];

  void addToCartList(List<CartModel> cartList) {
    // sharedPreferences.remove(AppConstans.CART_LIST);
    // sharedPreferences.remove(AppConstans.CART_HISTORY_LIST);
    cart = [];
    var time = DateTime.now().toString();

    // convert list to string
    for (var element in cartList) {
      element.time = time;
      cart.add(jsonEncode(element));
    }

    sharedPreferences.setStringList(AppConstans.CART_LIST, cart);

    getCartList();
  }

  List<CartModel> getCartList() {
    List<String> carts = [];

    if (sharedPreferences.containsKey(AppConstans.CART_LIST)) {
      carts = sharedPreferences.getStringList(AppConstans.CART_LIST)!;
    }

    List<CartModel> cartList = [];
    // convert String to CartModel
    for (var element in carts) {
      cartList.add(CartModel.fromJson(jsonDecode(element)));
    }

    return cartList;
  }

  List<CartModel> getCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstans.CART_HISTORY_LIST)) {
      cartHistory = [];
      cartHistory =
          sharedPreferences.getStringList(AppConstans.CART_HISTORY_LIST)!;
    }

    List<CartModel> cartHistoryList = [];
    // convert String to CartModel
    for (var element in cartHistory) {
      cartHistoryList.add(CartModel.fromJson(jsonDecode(element)));
    }

    return cartHistoryList;
  }

  void addToCartHistoryList() {
    if (sharedPreferences.containsKey(AppConstans.CART_HISTORY_LIST)) {
      cartHistory =
          sharedPreferences.getStringList(AppConstans.CART_HISTORY_LIST)!;
    }

    for (var i = 0; i < cart.length; i++) {
      cartHistory.add(cart[i]);
    }

    removeCart();

    sharedPreferences.setStringList(AppConstans.CART_HISTORY_LIST, cartHistory);

    print('getCartHistoryList-----${getCartHistoryList().length.toString()}');
    for (var i = 0; i < getCartHistoryList().length; i++) {
      print('time-----${getCartHistoryList()[i].time.toString()}');
    }
  }

  void removeCart() {
    cart = [];
    sharedPreferences.remove(AppConstans.CART_LIST);
  }
}
