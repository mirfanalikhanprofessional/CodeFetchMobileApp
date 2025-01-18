import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class TextFieldWidget extends StatefulWidget {
  final TextInputType keyboardType;
  final TextEditingController controller;
  final Color textFieldColor;
  final Color borderColor;
  final Color labelColor;
  final String labelText;
  final TextStyle? labelStyle;
  final double borderRadius;
  final double textFontSize;
  final bool obscureText;
  final bool fillTextField;
  final bool enabled;
  final bool readOnly;
  final bool validate;
  final Function? onTap;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final int maxLines;
  final InputDecoration decoration;
  final FormFieldValidator<String>? validator;
  final FloatingLabelBehavior? floatingLabelBehavior;

  @override
  State<TextFieldWidget> createState() => _TextFieldWidgetState();

  const TextFieldWidget({
    this.decoration = const InputDecoration(),
    this.labelStyle,
    this.floatingLabelBehavior,
    required this.keyboardType,
    required this.controller,
    required this.labelText,
    this.borderRadius = 5,
    this.textFontSize = 16,
    this.maxLines = 1,
    this.fillTextField = true,
    this.textFieldColor = ColorConstants.whiteColor,
    this.borderColor = ColorConstants.greyColorOne,
    this.labelColor = ColorConstants.darkGrayColor,
    this.obscureText = false,
    this.enabled = true,
    this.readOnly = false,
    this.validate = true,
    this.onTap,
    this.prefixWidget,
    this.suffixWidget,
    this.validator,
    super.key,
  });
}

class _TextFieldWidgetState extends State<TextFieldWidget> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorWidth: 1,
      cursorColor: ColorConstants.darkGrayColor,
      style: TextStyle(
          color: ColorConstants.darkGrayColor,
          fontSize: widget.textFontSize,
          fontFamily: "AndadaPro"),
      decoration: InputDecoration(
        labelText: widget.labelText,
        floatingLabelBehavior: widget.floatingLabelBehavior,
        labelStyle: TextStyle(
          color: widget.labelColor,
          fontSize: widget.labelStyle?.fontSize ?? 16.0,
        ),
        filled: widget.fillTextField,
        fillColor: widget.textFieldColor,
        contentPadding: const EdgeInsets.symmetric(
          vertical: 15,
          horizontal: 10,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: ColorConstants.darkGrayColor.withOpacity(
                0.3
            ),
            width: 1.5,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: ColorConstants.darkGrayColor.withOpacity(
                0.3
            ),
            width: 1.5,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(widget.borderRadius),
          borderSide: BorderSide(
            color: ColorConstants.darkGrayColor.withOpacity(
              0.3
            ),
            width: 1.5,
          ),
        ),
        prefixIcon: widget.prefixWidget,
        suffixIcon: widget.obscureText
            ? IconButton(
                icon: Icon(
                  _isPasswordVisible ? Icons.visibility : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              )
            : widget.suffixWidget,
      ),
      keyboardType: widget.keyboardType,
      controller: widget.controller,
      obscureText: widget.obscureText && !_isPasswordVisible,
      maxLines: widget.maxLines,
      enabled: widget.enabled,
      readOnly: widget.readOnly,
      textInputAction: TextInputAction.done,
      onTap: () {
        if (widget.onTap != null) {
          widget.onTap!();
        }
      },
      validator: widget.validator,
    );
  }
}

class CustomDropdownButtonFormField extends StatelessWidget {
  final List<DropdownMenuItem<String>> items;
  final String? value;
  final String? labelText;
  final String? hintText;

  final Color focusColor;
  final Color dropdownColor;

  final InputDecoration decoration;
  final ValueChanged<String?>? onChanged;
  final bool enabled;
  final Widget? prefixWidget;
  final Widget? suffixWidget;
  final FormFieldValidator<String>? validator; // Added validator parameter
  final double height;

  const CustomDropdownButtonFormField(
      {super.key,
      required this.items,
      this.validator,
      required this.value,
      this.labelText,
      this.hintText,
      this.enabled = true,
      this.focusColor = ColorConstants.themeColor,
      this.dropdownColor = ColorConstants.themeColor,
      this.decoration = const InputDecoration(
        fillColor: ColorConstants.whiteColor,
        focusColor: ColorConstants.whiteColor,
        hoverColor: ColorConstants.whiteColor,
        filled: true,
        labelStyle: TextStyle(
          fontFamily: "AndadaPro",
          fontSize: 15,
        ),
        border: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.greyColorOne,
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(10),
          ),
          gapPadding: 8.0,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.greyColorOne,
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(10),
          ),
          gapPadding: 8.0,
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.greyColorOne,
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(10),
          ),
          gapPadding: 8.0,
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorConstants.greyColorOne,
          ),
          borderRadius: BorderRadius.horizontal(
            left: Radius.circular(10),
            right: Radius.circular(10),
          ),
          gapPadding: 8.0,
        ),
      ),
      this.onChanged,
      this.prefixWidget,
      this.suffixWidget,
      this.height = 50,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: DropdownButtonFormField<String>(
        items: items,
        focusColor: focusColor,
        dropdownColor: enabled ? dropdownColor : Colors.grey,
        value: value,
        decoration: decoration.copyWith(
            prefixIcon: prefixWidget,
            suffixIcon: suffixWidget,
            border: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstants.greyColorOne,
              ),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(5),
                right: Radius.circular(5),
              ),
              gapPadding: 8.0,
            ),
            enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstants.greyColorOne,
              ),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(5),
                right: Radius.circular(5),
              ),
              gapPadding: 8.0,
            ),
            focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstants.greyColorOne,
              ),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(5),
                right: Radius.circular(5),
              ),
              gapPadding: 8.0,
            ),
            errorBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: ColorConstants.greyColorOne,
              ),
              borderRadius: BorderRadius.horizontal(
                left: Radius.circular(5),
                right: Radius.circular(5),
              ),
              gapPadding: 8.0,
            ),
            labelText: labelText,
            labelStyle: const TextStyle(
                color: ColorConstants.darkGrayColor,
                fontSize: 18,
                fontFamily: "AndadaPro")),
        onChanged: enabled ? onChanged : null,
        hint: Text(
          hintText ?? "Select an option",
          style: TextStyle(
              color: enabled ? ColorConstants.darkGrayColor : Colors.grey,
              fontSize: 15),
        ),
        disabledHint: enabled
            ? null
            : Text(
                hintText ?? "Select an Option",
                style: const TextStyle(color: Colors.grey, fontSize: 15),
              ),
        style: const TextStyle(
            fontFamily: "AndadaPro",
            fontSize: 13,
            color: ColorConstants.darkGrayColor),
        iconDisabledColor: ColorConstants.darkGrayColor,
        iconEnabledColor: ColorConstants.darkGrayColor,
        validator: validator,
      ),
    );
  }
}
