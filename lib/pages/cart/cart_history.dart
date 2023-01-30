import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/controllers/cart_controller.dart';
import 'package:flutter_ecommerce_app/utils/app_constants.dart';
import 'package:flutter_ecommerce_app/utils/colors.dart';
import 'package:flutter_ecommerce_app/utils/dimensions.dart';
import 'package:flutter_ecommerce_app/widgets/big_text.dart';
import 'package:get/get.dart';

class CartHistory extends StatelessWidget {
  const CartHistory({super.key});

  @override
  Widget build(BuildContext context) {
    var getCartHistoryList = Get.find<CartController>().getCartHistoryList();

    Map<String, int> cartItemsPerOrder = {};

    for (var i = 0; i < getCartHistoryList.length; i++) {
      if (cartItemsPerOrder.containsKey(getCartHistoryList[i].time)) {
        cartItemsPerOrder.update(
            getCartHistoryList[i].time!, (value) => ++value);
      } else {
        cartItemsPerOrder.putIfAbsent(getCartHistoryList[i].time!, () => 1);
      }
    }

    List<int> cartOrderTimeToList() {
      return cartItemsPerOrder.entries.map((e) => e.value).toList();
    }

    List<int> itemsRerOrder = cartOrderTimeToList();

    var listCounter = 0;

    return Scaffold(
      body: Column(
        children: [
          Container(
            color: AppColors.mainColor,
            width: double.maxFinite,
            height: 100,
            padding: const EdgeInsets.only(top: 50),
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
          Expanded(
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
                      for (int i = 0; i < itemsRerOrder.length; i++)
                        Container(
                          margin: EdgeInsets.only(bottom: Dimensions.height20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const BigText(text: '05/02/2021'),
                              SizedBox(height: Dimensions.height10),
                              Row(
                                children: [
                                  Wrap(
                                      direction: Axis.horizontal,
                                      children: List.generate(itemsRerOrder[i],
                                          (index) {
                                        if (listCounter <
                                            getCartHistoryList.length) {
                                          listCounter++;
                                        }

                                        return index <= 2
                                            ? Container(
                                                margin: EdgeInsets.only(
                                                    right:
                                                        Dimensions.width10 / 2),
                                                height: 80,
                                                width: 80,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            Dimensions
                                                                    .radius15 /
                                                                2),
                                                    image: DecorationImage(
                                                        fit: BoxFit.cover,
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
                                      }))
                                ],
                              ),
                            ],
                          ),
                        )
                    ],
                  ),
                )),
          )
        ],
      ),
    );
  }
}
