import 'package:coffee_shop/presentations/constant/custom_text.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatefulWidget {
  final String title;
  final void Function() onPressed;
  const CustomButton({super.key, required this.title, required this.onPressed});

  @override
  State<CustomButton> createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: MediaQuery.of(context).size.width,
      margin: const EdgeInsets.only(bottom: 10),
      child: ElevatedButton(
        onPressed: widget.onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFFC67C4E),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        child: CustomText(
          title: widget.title,
          color: Colors.white,
        ),
      ),
    );
  }
}
