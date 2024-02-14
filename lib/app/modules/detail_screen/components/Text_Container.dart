import 'package:flutter/material.dart';

class CustomContainer extends StatelessWidget {
  final IconData iconData;
  final String firstText;
  final String secondText;
  final Color borderColor;
  final Color containerColor;
  final Color secondTextColor;
  final String thirdText;
  final bool isFirstTextStriked;

  const CustomContainer({
    Key? key,
    required this.iconData,
    required this.firstText,
    required this.secondText,
    required this.borderColor,
    required this.containerColor,
    required this.secondTextColor,
    required this.thirdText,
    this.isFirstTextStriked = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: containerColor,
        border: Border.all(color: borderColor, width: 2),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(iconData,color: borderColor,),
              const SizedBox(width: 5),
              Expanded(
                child: Text(
                  firstText,
                  style: TextStyle(
                    decoration:
                        isFirstTextStriked ? TextDecoration.lineThrough : null,
                  ),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 9, vertical: 3),
                decoration: BoxDecoration(
                  color: borderColor,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Text(
                  secondText,
                  style: TextStyle(color: secondTextColor),
                ),
              ),
            ],
          ),
          const SizedBox(height: 4),
          thirdText != "" ? Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              thirdText,
              style: const TextStyle(fontSize: 14),
            ),
          ) : Container(),
        ],
      ),
    );
  }
}
