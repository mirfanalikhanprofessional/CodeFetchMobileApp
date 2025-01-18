import 'package:flutter/material.dart';

import '../../constants/color_constants.dart';

class LoadingWidget extends StatelessWidget {
  const LoadingWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: SizedBox(
        width: 20,
        height: 20,
        child: CircularProgressIndicator(
          color: ColorConstants.darkGrayColor,
          strokeWidth: 2,
        ),
      ),
    );
  }
}
