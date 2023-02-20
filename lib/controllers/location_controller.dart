import 'dart:convert';
import 'dart:developer';

import 'package:flutter_ecommerce_app/models/response_model.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../data/repository/location_repo.dart';
import '../models/address_model.dart';

class LocationController extends GetxController implements GetxService {
  final LocationRepo locationRepo;

  LocationController({
    required this.locationRepo,
  });

  bool _loading = false;
  final bool _updateAddressData = true;
  final bool _changeAddress = true;
  int _addressTypeIndex = 0;

  late Position _position;
  late Position _pickPosition;

  late Placemark _placemark = Placemark();
  late Placemark _pickPlacemark = Placemark();

  late List<AddressModel> _addressList = [];
  late List<AddressModel> _allAddressList;
  final List<String> _addressTypeList = ['home', 'office', 'other'];
  late Map<String, dynamic> _getAddress;
  late GoogleMapController _mapController;

  List<AddressModel> get addressList => _addressList;
  Map get getAddress => _getAddress;
  bool get isLoadig => _loading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;
  Placemark get placemark => _placemark;
  Placemark get pickPlacemark => _pickPlacemark;
  List<String> get addressTypeList => _addressTypeList;
  int get addressTypeIndex => _addressTypeIndex;
  List<AddressModel> get allAddressList => _allAddressList;

  void setMapControlle(GoogleMapController mapController) {
    _mapController = mapController;
  }

  void updatePosition(CameraPosition position, bool fromAddress) async {
    if (_updateAddressData) {
      _loading = true;
      update();

      try {
        if (fromAddress) {
          _position = Position(
            longitude: position.target.longitude,
            latitude: position.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        } else {
          _pickPosition = Position(
            longitude: position.target.longitude,
            latitude: position.target.latitude,
            timestamp: DateTime.now(),
            accuracy: 1,
            altitude: 1,
            heading: 1,
            speed: 1,
            speedAccuracy: 1,
          );
        }

        if (_changeAddress) {
          String address = await getAddressFromGeocode(LatLng(
            position.target.latitude,
            position.target.longitude,
          ));

          fromAddress
              ? _placemark = Placemark(name: address)
              : _pickPlacemark = Placemark(name: address);
        }
      } catch (e) {
        log('error---- $e');
      }
    }
  }

  Future<String> getAddressFromGeocode(LatLng latLng) async {
    String address = 'Unknow location found';

    Response response = await locationRepo.getAddressFromGeocode(latLng);

    if (response.body['status'] == 'OK') {
      address = response.body['results'][0]['formatted_address'].toString();
      // log('address -------$address');
    } else {
      print('Error getting google api');
    }
    update();
    return address;
  }

  AddressModel getUserAddress() {
    late AddressModel addressModel;
    _getAddress = jsonDecode(locationRepo.getUserAddress());

    try {
      addressModel =
          AddressModel.fromJson(jsonDecode(locationRepo.getUserAddress()));
    } catch (e) {
      print('getUserAddress error --- $e');
    }

    return addressModel;
  }

  void setAddressTypeIndex(int index) {
    _addressTypeIndex = index;
    update();
  }

  Future<ResponseModel> addAddress(AddressModel addressModel) async {
    _loading = true;
    update();

    Response response = await locationRepo.addAddress(addressModel);
    ResponseModel responseModel;

    if (response.statusCode == 200) {
      log(response.body.toString());

      await getAddressList();

      String message = response.body['message'];
      responseModel = ResponseModel(true, message);

      await saveUserAddress(addressModel);
    } else {
      print('address not saved');
      responseModel = ResponseModel(false, response.statusText!);
    }
    update();
    return responseModel;
  }

  Future<void> getAddressList() async {
    Response response = await locationRepo.getAllAddress();
    if (response.statusCode == 200) {
      _addressList = [];
      _allAddressList = [];

      response.body.forEach((address) {
        _addressList.add(AddressModel.fromJson(address));
        _allAddressList.add(AddressModel.fromJson(address));
      });
    } else {
      _addressList = [];
      _allAddressList = [];
    }

    update();
  }

  Future<bool> saveUserAddress(AddressModel addressModel) async {
    String userAddress = jsonEncode(addressModel.toJson());
    return await locationRepo.saveUserAddress(userAddress);
  }

  void clearAddressList() {
    _addressList = [];
    _allAddressList = [];
    update();
  }
}
