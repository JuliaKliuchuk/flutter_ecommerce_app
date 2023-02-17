import 'dart:developer';

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
  final int _addressTypeIndex = 0;

  late Position _position;
  late Position _pickPosition;

  final Placemark _placemark = Placemark();
  final Placemark _pickPlacemark = Placemark();

  final List<AddressModel> _addressList = [];
  late List<AddressModel> _allAddressList;
  final List<String> _addressTypeList = ['home', 'office', 'other'];
  late Map<String, dynamic> _getAddress;
  late GoogleMapController _mapController;

  List<AddressModel> get addressList => _addressList;
  Map get getAddress => _getAddress;
  bool get isLoadig => _loading;
  Position get position => _position;
  Position get pickPosition => _pickPosition;

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
      log('address -------$address');
    } else {
      print('Error getting google api');
    }
    return address;
  }
}
