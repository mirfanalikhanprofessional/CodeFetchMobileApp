import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottie/lottie.dart';

import '../../../constants/asset_constants.dart';
import '../../../constants/color_constants.dart';
import '../../../constants/string_constants.dart';
import '../../../services/logger_service.dart';
import '../../common/widgets/shimmer_animation_widget.dart';
import '../../widgets/field_widget.dart';
import '../../widgets/text_widget.dart';
import '../bloc/bloc.dart';
import '../widgets/trending_repository_list_tile.dart';

class TrendingRepositoryScreen extends StatefulWidget {
  const TrendingRepositoryScreen({super.key});

  @override
  State<TrendingRepositoryScreen> createState() => _TrendingRepositoryScreenState();
}

class _TrendingRepositoryScreenState extends State<TrendingRepositoryScreen> {
  late final trendingRepositoryBloc = BlocProvider.of<TrendingRepositoryBloc>(context);
  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const TextWidget(
          text: StringConstants.trendingRepositories,
          color: ColorConstants.darkGrayColor,
          fontSize: 18,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        actions: [
          PopupMenuButton<int>(
            onSelected: (value) {
              // Handle menu item selection
              if (value == 1) {
                // Do something when the first option is selected
                LoggerService.logs('Option 1 selected');
              } else if (value == 2) {
                // Do something when the second option is selected
                LoggerService.logs('Option 2 selected');
              }
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem<int>(
                value: 1,
                child: TextWidget(
                  text: 'Option 1',
                  color: ColorConstants.darkGrayColor,
                ),
              ),
              const PopupMenuItem<int>(
                value: 1,
                child: TextWidget(
                  text: 'Option 2',
                  color: ColorConstants.darkGrayColor,
                ),
              ),
            ],
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 8,
        ),
        child: Column(
          children: [
            // Search Input Field
            TextFieldWidget(
              controller: _searchController,
              keyboardType: TextInputType.text,
              labelText: StringConstants.searchRepositories,
              suffixWidget: IconButton(
                icon: Icon(
                  Icons.search,
                  color: ColorConstants.darkGrayColor.withOpacity(
                    0.8
                  ),
                ),
                onPressed: () {
                  final query = _searchController.text.trim();
                  if (query.isNotEmpty) {
                    trendingRepositoryBloc.add(
                      SearchForTrendingRepository(query: query),
                    );
                  }
                },
              ),
            ),
            const SizedBox(height: 10),
            // Repository List
            Expanded(
              child: BlocBuilder<TrendingRepositoryBloc, TrendingRepositoryState>(
                builder: (context, state) {
                  if (state is TrendingRepositoryLoadingState) {
                    return const ShimmerAnimationWidget();
                  } else if (state is TrendingRepositoryLoadedState) {
                    return TrendingRepositoryTileList(
                      repositories: trendingRepositoryBloc.trendingRepositoryListWrapper?.trendingListRepositoryListWrapper ?? [],
                    );
                  } else if (state is TrendingRepositoryErrorState) {
                    return Lottie.asset(
                      AssetConstants.errorAnimation,
                      width: 250,
                      height: 250,
                      fit: BoxFit.contain,
                    );
                  }
                  return const Center(
                    child: TextWidget(
                      text: StringConstants.searchForTrendingRepositories,
                      color: ColorConstants.darkGrayColor,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


