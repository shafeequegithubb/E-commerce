import 'package:ecommerce_spinecode/core%20/constant/color_constant.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorConstants.mainwhite,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Your cart",
          style: TextStyle(color: ColorConstants.mainwhite),
        ),
        backgroundColor: ColorConstants.primerygreen,
      ),
      body: Center(child: Text("Currently no items are available")),
    );
  }
}
