import 'package:flutter/material.dart';
import 'package:pricing_calculator/src/constants/app_sizes.dart';
import 'package:pricing_calculator/src/constants/colors.dart';
import 'package:pricing_calculator/src/shared/text_widget.dart';

class InputFieldWidget extends StatelessWidget {
  const InputFieldWidget({
    super.key,
    this.label,
    required this.hintColor,
    this.initialValue,
    required this.hintText,
    this.hintSize = 14,
    required this.onChanged,
    this.validator,
    this.textFieldkey,
    this.obscureText = false,
    this.suffixIcon,
    this.prefixicon,
    this.onTap,
    this.maxLines = 1,
    this.fontWeight = FontWeight.w600,
    this.labelColor = AppColors.black,
    this.labelFontSize = 14,
    this.enabledBorderRadius = 30,
    this.verticalContentPadding = 0,
    this.controller,
    this.horizontalContentPadding = 10,
    this.labelPadding = const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
    this.keyboardType = TextInputType.text,
    this.readOnly = false,
    this.fillColor,
  });
  final String? label;
  final String hintText;
  final double hintSize;
  final void Function(String?) onChanged;
  final void Function()? onTap;

  final String? Function(String?)? validator;
  final GlobalKey<FormFieldState>? textFieldkey;
  final bool obscureText;
  final Widget? suffixIcon;
  final TextInputType keyboardType;
  final Widget? prefixicon;
  final String? initialValue;

  final int? maxLines;
  final double enabledBorderRadius;
  final double verticalContentPadding;
  final bool readOnly;
  final FontWeight fontWeight;
  final Color hintColor;
  final double labelFontSize;
  final TextEditingController? controller;
  final Color labelColor;
  final double horizontalContentPadding;
  final EdgeInsets labelPadding;
  final Color? fillColor;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        if (label != null) ...[
          TextWidget(text: label!),
          gapH4,
        ],
        TextFormField(
          controller: controller,
          onTap: onTap,
          key: textFieldkey,
          initialValue: initialValue,
          onChanged: onChanged,
          readOnly: readOnly,
          maxLines: maxLines,
          validator: validator,
          obscureText: obscureText,
          style: const TextStyle(color: AppColors.black),
          keyboardType: keyboardType,
          decoration: InputDecoration(
            prefixIcon: prefixicon,
            filled: true,
            fillColor: fillColor ?? Theme.of(context).colorScheme.surface,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(
                color: hintColor,
                fontSize: hintSize,
                fontWeight: FontWeight.w300,
                fontFamily: 'Neue Plak'),
            contentPadding: EdgeInsets.symmetric(
                horizontal: horizontalContentPadding,
                vertical: verticalContentPadding),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 0, 0),
                width: 2.0,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(enabledBorderRadius),
              borderSide: const BorderSide(
                color: Color.fromARGB(255, 255, 0, 0),
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(enabledBorderRadius),
              borderSide: const BorderSide(
                color: AppColors.mainGrey,
                width: 0.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Colors.transparent,
                width: 0,
              ),
              borderRadius: BorderRadius.circular(enabledBorderRadius),
            ),
            hintText: hintText,
          ),
        ),
      ]),
    );
  }
}
