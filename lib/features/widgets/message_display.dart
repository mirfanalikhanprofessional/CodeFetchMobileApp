import 'package:animated_snack_bar/animated_snack_bar.dart';
import 'package:flutter/material.dart';


class MessageDisplay{


  void showWarningMessage(BuildContext context, String message){
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.warning,
      mobileSnackBarPosition: MobileSnackBarPosition.top, // Position of snackbar on mobile devices
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight, // Position of snackbar on desktop devices
    ).show(context);

  }

  void showErrorMessage(BuildContext context, String message){
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.error,
      mobileSnackBarPosition: MobileSnackBarPosition.top, // Position of snackbar on mobile devices
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight, // Position of snackbar on desktop devices
    ).show(context);

  }

  void showSuccessMessage(BuildContext context, String message){
    AnimatedSnackBar.material(
      message,
      type: AnimatedSnackBarType.success,
      mobileSnackBarPosition: MobileSnackBarPosition.top, // Position of snackbar on mobile devices
      desktopSnackBarPosition: DesktopSnackBarPosition.topRight, // Position of snackbar on desktop devices
    ).show(context);

  }

}