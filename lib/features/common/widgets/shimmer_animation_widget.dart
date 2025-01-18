import 'package:code_fetch_mobile_app/constants/color_constants.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAnimationWidget extends StatelessWidget {
  const ShimmerAnimationWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6, // Number of shimmer placeholders
      itemBuilder: (context, index) {
        return Shimmer.fromColors(
          baseColor: ColorConstants.greyColorTwo,
          highlightColor: ColorConstants.greyColorThree,
          child: ListTile(
            leading: Container(
              width: 40,
              height: 40,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: ColorConstants.whiteColor,
              ),
            ),
            title: Container(
              height: 16,
              width: double.infinity,
              color: ColorConstants.whiteColor,
              margin: const EdgeInsets.only(bottom: 5),
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 14,
                  width: 200,
                  color: ColorConstants.whiteColor,
                  margin: const EdgeInsets.only(bottom: 5),
                ),
                Row(
                  children: [
                    Container(
                      height: 12,
                      width: 50,
                      color: ColorConstants.whiteColor,
                    ),
                    const SizedBox(width: 10),
                    Container(
                      height: 12,
                      width: 50,
                      color: ColorConstants.whiteColor,
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}