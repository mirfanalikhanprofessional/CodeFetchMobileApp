

import 'package:code_fetch_mobile_app/constants/string_constants.dart';
import 'package:flutter/material.dart';

import '../../../constants/asset_constants.dart';
import '../../../constants/color_constants.dart';
import '../../../wrappers/trending_repository_wrapper.dart';
import '../../widgets/image_widget.dart';
import '../../widgets/text_widget.dart';

class TrendingRepositoryTileList extends StatelessWidget {
  const TrendingRepositoryTileList({
    required this.repositories,
    super.key,
  });

  final List<TrendingRepositoryWrapper> repositories;

  @override
  Widget build(BuildContext context) {
    if (repositories.isEmpty) {
      return const Center(
        child: TextWidget(
          text: StringConstants.noRepositoriesFound,
          color: ColorConstants.darkGrayColor,
        ),
      );
    }

    return ListView.builder(
      itemCount: repositories.length,
      itemBuilder: (context, index) {
        final repo = repositories[index];

        return ListTile(
          leading: SizedBox(
            width: 40,
            height: 40,
            child: ImageWidget(
              borderRadius: 100,
              imageUrlOrPath: repo.ownerAvatarUrl ?? '',
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: repo.ownerUsername ?? '',
                color: ColorConstants.darkGrayColor,
                textAlign: TextAlign.left,
                fontSize: 13,
              ),
              TextWidget(
                text: repo.repoName ?? '',
                color: ColorConstants.darkGrayColor,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.left,
                fontSize: 15,
              ),
            ],
          ),
          subtitle: SizedBox(
            height: 60,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextWidget(
                  text: repo.description ?? 'No description available',
                  color: ColorConstants.darkGrayColor,
                  textAlign: TextAlign.left,
                  maxLine: 2,
                  softWrap: true,
                ),
                Row(
                  children: [
                    Row(
                      children: [
                        const ImageWidget(
                          width: 20,
                          height: 20,
                          imageUrlOrPath: AssetConstants.starIcon,
                          isAsset: true,
                        ),
                        TextWidget(
                          text: repo.starsCount.toString(),
                          color: ColorConstants.darkGrayColor,
                        ),
                      ],
                    ),
                    const SizedBox(width: 10),
                    Row(
                      children: [
                        const Icon(
                          Icons.circle,
                          color: ColorConstants.blueColor,
                          size: 14,
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        TextWidget(
                          text: repo.language ?? 'Unknown',
                          color: ColorConstants.darkGrayColor,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
          onTap: () {
            // Navigate to details or perform another action
          },
        );
      },
    );
  }
}
