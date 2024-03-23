// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors_in_immutables, library_private_types_in_public_api, prefer_const_constructors

import 'package:flutter/material.dart';
import '../../constants/app_colors.dart';

class CustomTextField extends StatefulWidget {
  final String hintText;
  final double height;
  final bool isPassword;
  TextEditingController? controller;

  CustomTextField({
    this.hintText = "",
    this.height = 54,
    this.isPassword = false,
    this.controller,
  });

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool hasFocus = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      padding: EdgeInsets.only(
        left: 20,
        right: 10,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: hasFocus ? kTertiaryColor : kPrimaryColor,
        ),
        color: kSecondaryColor,
      ),
      child: Focus(
        onFocusChange: (bool focus) {
          setState(() {
            hasFocus = focus;
          });
        },
        child: Center(
          child: TextField(
            controller: widget.controller,
            obscureText: widget.isPassword && !isPasswordVisible,
            style: TextStyle(
              color: kPrimaryColor,
            ),
            decoration: InputDecoration(
              hintText: widget.hintText,
              hintStyle: TextStyle(color: kGreyColor),
              border: InputBorder.none,
              suffixIcon: widget.isPassword
                  ? IconButton(
                      icon: Icon(
                        isPasswordVisible
                            ? Icons.visibility_off
                            : Icons.visibility,
                      ),
                      onPressed: () {
                        setState(() {
                          isPasswordVisible = !isPasswordVisible;
                        });
                      },
                    )
                  : null,
            ),
          ),
        ),
      ),
    );
  }
}
