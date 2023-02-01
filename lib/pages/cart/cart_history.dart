import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/base/no_data_page.dart';
import 'package:flutter_ecommerce_app/controllers/cart_controller.dart';
import 'package:flutter_ecommerce_app/models/cart_model.dart';
import 'package:flutter_ecommerce_app/routes/route_helper.dart';
import 'package:flutter_ecommerce_app/utils/app_constants.dart';
import 'package:flutter_ecommerce_app/utils/colors.dart';
import 'package:flutter_ecommerce_app/utils/dimensions.dart';
import 'package:flutter_ecommerce_app/widgets/big_text.dart';
import 'package:flutter_ecommerce_app/widgets/small_text.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList =
        Get.find<CartController>().getCartHistoryList().reversed.toList();

    Map<String, int> cartItemsPerOrder = {};

    for (var i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartItemsPerOrderToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<String> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.key).toList();
    }

    List<int> itemsPerOrder = cartItemsPerOrderToList();

    var listCounter = 0;

    Widget timeWidget(int index) {
      var outputDate = DateTime.now().toString();

      if (index < getCartHistoryList.length) {
        DateTime parseDate = DateFormat('yyy-MM-dd HH:mm:ss')
            .parse(getCartHistoryList[listCounter].time!);
        var dateFormat = DateFormat('MM/dd/yyyy hh:mm a');
        outputDate = dateFormat.format(parseDate);
      }

      return BigText(text: outputDate);
    }

    return Scaffold(
      body: Column(
        children: [
          // header
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            height: Dimensions.height10 * 10,
            padding: EdgeInsets.only(top: Dimensions.height45),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: const [
                  BigText(
                    text: 'Your cart history',
                    color: Colors.white,
                  ),
                  Icon(
                    Icons.shopping_cart_outlined,
                    color: Colors.white,
                  )
                ]),
          ),
          // body
          GetBuilder<CartController>(builder: (cartController) {
            return cartController.getCartHistoryList().isNotEmpty
                ? Expanded(
                    child: Container(
                        margin: EdgeInsets.only(
                          top: Dimensions.height20,
                          right: Dimensions.width20,
                          left: Dimensions.width20,
                        ),
                        child: MediaQuery.removePadding(
                          removeTop: true,
                          context: context,
                          child: ListView(
                            children: [
                              for (int i = 0; i < itemsPerOrder.length; i++)
                                Container(
                                  height: Dimensions.height30 * 4,
                                  margin: EdgeInsets.only(
                                      bottom: Dimensions.height20),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      timeWidget(listCounter),
                                      SizedBox(height: Dimensions.height10),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Wrap(
                                              direction: Axis.horizontal,
                                              children: List.generate(
                                                  itemsPerOrder[i], (index) {
                                                if (listCounter <
                                                    getCartHistoryList.length) {
                                                  listCounter++;
                                                }

                                                return index <= 2
                                                    ? Container(
                                                        margin: EdgeInsets.only(
                                                            right: Dimensions
                                                                    .width10 /
                                                                2),
                                                        height: Dimensions
                                                                .height20 *
                                                            4,
                                                        width:
                                                            Dimensions.width20 *
                                                                4,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius.circular(
                                                                    Dimensions
                                                                            .radius15 /
                                                                        2),
                                                            image: DecorationImage(
                                                                fit: BoxFit
                                                                    .cover,
                                                                image: NetworkImage(AppConstans
                                                                        .BASE_URL +
                                                                    AppConstans
                                                                        .UPLOAD_URL +
                                                                    getCartHistoryList[
                                                                            listCounter -
                                                                                1]
                                                                        .img!))),
                                                      )
                                                    : Container();
                                              })),
                                          SizedBox(
                                            height: Dimensions.height20 * 4,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                const SmallText(
                                                  text: 'Total',
                                                  color: AppColors.titleColor,
                                                ),
                                                BigText(
                                                  text:
                                                      '${itemsPerOrder[i].toString()} items',
                                                  color: AppColors.titleColor,
                                                ),
                                                GestureDetector(
                                                  onTap: () {
                                                    var orderTime =
                                                        cartOrderTimeToList();
                                                    Map<int, CartModel>
                                                        moreOrder = {};
                                                    for (var j = 0;
                                                        j <
                                                            getCartHistoryList
                                                                .length;
                                                        j++) {
                                                      if (getCartHistoryList[j]
                                                              .time ==
                                                          orderTime[i]) {
                                                        moreOrder.putIfAbsent(
                                                            getCartHistoryList[j]
                                                                .id!,
                                                            () => CartModel.fromJson(
                                                                jsonDecode(jsonEncode(
                                                                    getCartHistoryList[
                                                                        j]))));
                                                      }
                                                    }
                                                    Get.find<CartController>()
                                                        .setItems = moreOrder;
                                                    Get.find<CartController>()
                                                        .addToCartList();
                                                    Get.toNamed(RouteHelper
                                                        .getCartPage());
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal:
                                                                Dimensions
                                                                    .width10,
                                                            vertical: Dimensions
                                                                    .height10 /
                                                                2),
                                                    decoration: BoxDecoration(
                                                      borderRadius: BorderRadius
                                                          .circular(Dimensions
                                                                  .radius15 /
                                                              2),
                                                      border: Border.all(
                                                          color: AppColors
                                                              .mainColor,
                                                          width: 1),
                                                    ),
                                                    child: const SmallText(
                                                      text: 'one more',
                                                      color:
                                                          AppColors.mainColor,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                            ],
                          ),
                        )),
                  )
                : SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    child: const Center(
                      child: NoDataPage(
                        text: 'Your did\'t buy anything so far !',
                        imgPath: 'assets/image/empty_box.png',
                      ),
                    ),
                  );
          })
        ],
      ),
    );
  }
}
