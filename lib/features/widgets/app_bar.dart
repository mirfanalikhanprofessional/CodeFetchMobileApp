import 'package:flutter/material.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final IconData? icon;
  final String title;
  final Color iconColor;
  final Color textColor;
  final double fontSize;
  final double height;
  final VoidCallback? onPressed;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;

  const AppBarWidget({
    super.key,
    required this.title,
    this.icon,
    this.iconColor = Colors.black,
    this.textColor = Colors.black,
    this.fontSize = 20,
    this.height = 56, // Standard AppBar height to avoid overlap
    this.onPressed,
    this.actions = const [],
    this.bottom,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: icon != null
          ? IconButton(
        icon: Icon(icon, color: iconColor),
        onPressed: onPressed,
      )
          : null,
      title: Text(
        title,
        style: TextStyle(
          color: textColor,
          fontSize: fontSize,
        ),
      ),
      toolbarHeight: height,
      centerTitle: true,
      automaticallyImplyLeading: icon != null,
      actions: actions,
      bottom: bottom,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height); // Ensures fixed size for AppBar
}
