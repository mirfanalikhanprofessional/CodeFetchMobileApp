import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';
import 'text_widget.dart';

class LoadingButton extends StatelessWidget {
  final String text;
  final double borderRadius;
  final double width;
  final double height;
  final bool animateOnTap;
  final bool isLoading;
  final VoidCallback? onPressed;
  final EdgeInsetsGeometry padding;
  final ButtonStyle? style;
  final Color backgroundColor;
  final bool showIcon;
  final bool showIconWithText;
  final IconData? icon;
  final double iconSize;
  final Color iconColor;

  const LoadingButton({
    super.key,
    required this.text,
    this.onPressed,
    this.animateOnTap = true,
    this.isLoading = false,
    this.borderRadius = 10,
    this.width = 200,
    this.height = 40,
    this.padding = const EdgeInsets.all(16.0),
    this.backgroundColor = ColorConstants.themeColor,
    this.style,
    this.showIcon = false, // Default value to not show icon
    this.showIconWithText = false,
    this.icon,
    this.iconSize = 24.0,
    this.iconColor = Colors.white,
  });

  @override
  Widget build(BuildContext context) {
    bool isIconAvailable = showIcon && icon != null;
    return GestureDetector(
      onTap: onPressed != null
          ? () async {
              onPressed!();
            }
          : null,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.all(Radius.circular(borderRadius)),
        ),
        child: Center(
          child: animateOnTap
              ? isLoading
                  ? const CircularProgressIndicator(
                      color: ColorConstants.darkGrayColor,
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisSize:
                          isIconAvailable ? MainAxisSize.min : MainAxisSize.max,
                      children: [
                        if (isIconAvailable) ...[
                          Icon(
                            icon,
                            size: iconSize,
                            color: iconColor,
                          ),
                        ] else if (showIconWithText) ...[
                          Icon(
                            icon,
                            size: iconSize,
                            color: iconColor,
                          ),
                          const SizedBox(width: 8),
                          TextWidget(
                            text: text,
                            color: ColorConstants.darkGrayColor,
                          ), // Spacing between icon and text
                        ] else ...[
                          TextWidget(
                            text: text,
                            color: ColorConstants.darkGrayColor,
                          ),
                        ]
                      ],
                    )
              : Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize:
                      isIconAvailable ? MainAxisSize.min : MainAxisSize.max,
                  children: [
                    if (isIconAvailable) ...[
                      Icon(
                        icon,
                        size: iconSize,
                        color: iconColor,
                      ),
                    ] else if (showIconWithText) ...[
                      Icon(
                        icon,
                        size: iconSize,
                        color: iconColor,
                      ),
                      const SizedBox(width: 8),
                      TextWidget(
                        text: text,
                        color: ColorConstants.darkGrayColor,
                      ), // Spacing between icon and text
                    ] else ...[
                      TextWidget(
                        text: text,
                        color: ColorConstants.darkGrayColor,
                      ),
                    ]
                  ],
                ),
        ),
      ),
    );
  }
}
