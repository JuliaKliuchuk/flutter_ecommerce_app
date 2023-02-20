import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/controllers/auth_controller.dart';
import 'package:flutter_ecommerce_app/controllers/location_controller.dart';
import 'package:flutter_ecommerce_app/controllers/user_controller.dart';
import 'package:flutter_ecommerce_app/models/address_model.dart';
import 'package:flutter_ecommerce_app/routes/route_helper.dart';
import 'package:flutter_ecommerce_app/utils/colors.dart';
import 'package:flutter_ecommerce_app/utils/dimensions.dart';
import 'package:flutter_ecommerce_app/widgets/app_text_field.dart';
import 'package:flutter_ecommerce_app/widgets/big_text.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:get/get.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({super.key});

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {
  late final TextEditingController _addressController = TextEditingController();
  late final TextEditingController _contactPersonName = TextEditingController();
  late final TextEditingController _contactPersonNumber =
      TextEditingController();

  late bool _isLogged;

  CameraPosition _cameraPosition =
      const CameraPosition(target: LatLng(53.915968, 27.496964), zoom: 17);

  late LatLng _initialPosition = const LatLng(53.915968, 27.496964);

  @override
  void initState() {
    _isLogged = Get.find<AuthController>().userLoggedIn();

    if (_isLogged) {
      Get.find<UserController>().getUserData();
    }

    if (Get.find<LocationController>().addressList.isNotEmpty) {
      Get.find<LocationController>().getUserAddress();

      _cameraPosition = CameraPosition(
        target: LatLng(
            double.parse(Get.find<LocationController>().getAddress['latitude']),
            double.parse(
                Get.find<LocationController>().getAddress['longitude'])),
      );
      _initialPosition = LatLng(
          double.parse(Get.find<LocationController>().getAddress['latitude']),
          double.parse(Get.find<LocationController>().getAddress['longitude']));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Address page'),
        backgroundColor: AppColors.mainColor,
      ),
      body: GetBuilder<UserController>(builder: (userController) {
        if (_contactPersonName.text.isEmpty) {
          _contactPersonName.text = userController.userModel.name;
          _contactPersonNumber.text = userController.userModel.phone;

          if (Get.find<LocationController>().addressList.isNotEmpty) {
            _addressController.text =
                Get.find<LocationController>().getUserAddress().address;
          }
        }

        return GetBuilder<LocationController>(builder: (locationController) {
          _addressController.text = '${locationController.placemark.name ?? ''}'
              '${locationController.placemark.locality ?? ''}'
              '${locationController.placemark.postalCode ?? ''}'
              '${locationController.placemark.country ?? ''}';

          // print(' _addressController.text ----------${_addressController.text}');
          return SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // map
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
                      color: AppColors.mainColor,
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
                      myLocationEnabled: true,
                      onCameraIdle: () {
                        locationController.updatePosition(
                            _cameraPosition, true);
                      },
                      onCameraMove: (position) => _cameraPosition = position,
                      onMapCreated: (GoogleMapController controller) {
                        locationController.setMapControlle(controller);
                      },
                    ),
                  ]),
                ),

                // switch address type
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20),
                  child: SizedBox(
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: locationController.addressTypeList.length,
                      itemBuilder: ((context, index) {
                        return InkWell(
                          onTap: () {
                            locationController.setAddressTypeIndex(index);
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: Dimensions.width10),
                            padding: EdgeInsets.symmetric(
                              horizontal: Dimensions.width20,
                              vertical: Dimensions.height10,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(
                                    Dimensions.radius20 / 4),
                                color: Theme.of(context).cardColor,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey[200]!,
                                      spreadRadius: 1,
                                      blurRadius: 5)
                                ]),
                            child: Row(children: [
                              Icon(
                                index == 0
                                    ? Icons.home_filled
                                    : index == 1
                                        ? Icons.work
                                        : Icons.location_on,
                                color:
                                    locationController.addressTypeIndex == index
                                        ? AppColors.mainColor
                                        : Theme.of(context).disabledColor,
                              )
                            ]),
                          ),
                        );
                      }),
                    ),
                  ),
                ),

                // text fields
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20),
                  child: const BigText(text: 'Delivery address'),
                ),
                SizedBox(height: Dimensions.height10),
                AppTextFieldWidget(
                  textController: _addressController,
                  hintText: 'Your address',
                  icon: Icons.map,
                ),
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20),
                  child: const BigText(text: 'Contact name'),
                ),
                SizedBox(height: Dimensions.height10),
                AppTextFieldWidget(
                  textController: _contactPersonName,
                  hintText: 'Your name',
                  icon: Icons.person,
                ),
                SizedBox(height: Dimensions.height20),
                Padding(
                  padding: EdgeInsets.only(left: Dimensions.width20),
                  child: const BigText(text: 'Your number'),
                ),
                SizedBox(height: Dimensions.height10),
                AppTextFieldWidget(
                  textController: _contactPersonNumber,
                  hintText: 'Your phone',
                  icon: Icons.phone,
                ),
              ],
            ),
          );
        });
      }),
      bottomNavigationBar:
          GetBuilder<LocationController>(builder: (locationController) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: Dimensions.height20 * 8,
              padding: EdgeInsets.only(
                top: Dimensions.height30,
                bottom: Dimensions.height30,
                left: Dimensions.width20,
                right: Dimensions.width20,
              ),
              decoration: BoxDecoration(
                  color: AppColors.buttonBgColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.radius20 * 2),
                    topRight: Radius.circular(Dimensions.radius20 * 2),
                  )),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  GestureDetector(
                    onTap: () {
                      AddressModel addressModel = AddressModel(
                        addressType: locationController.addressTypeList[
                            locationController.addressTypeIndex],
                        address: _addressController.text,
                        contactPersonName: _contactPersonName.text,
                        contactPersonNumber: _contactPersonNumber.text,
                        longitude:
                            locationController.position.longitude.toString(),
                        latitude:
                            locationController.position.latitude.toString(),
                      );
                      log('addressModel-------${addressModel.toJson()}');

                      locationController
                          .addAddress(addressModel)
                          .then((response) {
                        if (response.isSuccess) {
                          Get.toNamed(RouteHelper.getInitial());
                          Get.snackbar('Address', 'Added successfully');
                        } else {
                          Get.snackbar('Address', 'Address not saved');
                        }
                      });
                    },
                    child: Container(
                      padding: EdgeInsets.only(
                        top: Dimensions.height20,
                        bottom: Dimensions.height20,
                        left: Dimensions.width20,
                        right: Dimensions.width20,
                      ),
                      decoration: BoxDecoration(
                        borderRadius:
                            BorderRadius.circular(Dimensions.radius20),
                        color: AppColors.mainColor,
                      ),
                      child: const BigText(
                        text: 'Save address',
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        );
      }),
    );
  }
}
