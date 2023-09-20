import 'package:assignment/core/utils/app_colors.dart';
import 'package:assignment/core/utils/page_size.dart';
import 'package:flutter/material.dart';

class CTAButton extends StatelessWidget {
  final VoidCallback callbackFunction;
  final String buttonText;
  const CTAButton(
      {super.key, required this.callbackFunction, required this.buttonText});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callbackFunction,
      child: Container(
        decoration: BoxDecoration(
          color: AppColors.buttonColor,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(
              25,
            ),
            topRight: Radius.circular(
              25,
            ),
          ),
        ),
        height: 50,
        width: screenWidth,
        child: Center(
            child: Text(
          buttonText,
          style: TextStyle(color: AppColors.whiteColor),
        )),
      ),
    );
  }
}
