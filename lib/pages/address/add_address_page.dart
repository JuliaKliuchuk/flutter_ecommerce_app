import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_app/controllers/location_controller.dart';
import 'package:flutter_ecommerce_app/controllers/user_controller.dart';
import 'package:flutter_ecommerce_app/utils/colors.dart';
import 'package:flutter_ecommerce_app/utils/dimensions.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  final TextEditingController _addressController = TextEditingController();
  final TextEditingController _contactPersonName = TextEditingController();
  final TextEditingController _contactPersonNumber = TextEditingController();

  late bool _isLogged;

  CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(53.915968, 27.496964), zoom: 17);

  late final LatLng _initialPosition = const LatLng(53.915968, 27.496964);

  @override
  void initState() {
    _isLogged = Get.find<AuthController>().userLoggedIn();

    if (_isLogged) {
      Get.find<UserController>().getUserData();
    }

    // if (Get.find<LocationController>().addressList.isEmpty) {
    //   _cameraPosition = CameraPosition(
    //     target: LatLng(
    //         double.parse(Get.find<LocationController>().getAddress['latitude']),
    //         Get.find<LocationController>().getAddress['longitude']),
    //   );
    //   _initialPosition = LatLng(
    //       double.parse(Get.find<LocationController>().getAddress['latitude']),
    //       Get.find<LocationController>().getAddress['longitude']);
    // }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address page'),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<LocationController>(builder: (locationController) {
        return Column(
          children: [
            Container(
              height: 140,
              width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.only(
                left: Dimensions.width10,
                right: Dimensions.width10,
                top: Dimensions.height10,
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(
                  width: 2,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              child: Stack(children: [
                GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _initialPosition,
                    zoom: 17,
                  ),
                  zoomControlsEnabled: false,
                  compassEnabled: false,
                  indoorViewEnabled: true,
                  mapToolbarEnabled: false,
                  onCameraIdle: () {
                    locationController.updatePosition(_cameraPosition, true);
                  },
                  onCameraMove: (position) => _cameraPosition = position,
                  onMapCreated: (GoogleMapController controller) {
                    locationController.setMapControlle(controller);
                  },
                ),
              ]),
            )
          ],
        );
      }),
    );
  }
}
