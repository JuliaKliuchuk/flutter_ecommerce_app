// ignore_for_file: constant_identifier_names

class AppConstans {
  static const String APP_NAME = 'DBFood';
  static const int APP_VERSION = 1;

  // static const String BASE_URL = 'http://mvs.bslmeiyu.com';
  static const String BASE_URL = 'http://192.168.100.4:8080';
  static const String POPULAR_PRODUCT_URL = '/api/v1/products/popular';
  static const String RECOMMENDED_PRODUCT_URL = '/api/v1/products/recommended';
  static const String UPLOAD_URL = '/uploads/';

// auth end points
  static const String REGISTRATION_URL = '/api/v1/auth/register';
  static const String LOGIN_URL = '/api/v1/auth/login';
  static const String USER_INFO_URL = '/api/v1/customer/info';

  static const String USER_ADDRESS = '/user-address';
  static const String GEOCODE_URL = '/api/v1/config/geocode-api';

  static const String TOKEN = '';
  static const String PHONE = '';
  static const String PASSWORD = '';

  static const String CART_LIST = 'cart-list';
  static const String CART_HISTORY_LIST = 'cart-history-list';
}
