import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'features/trending_repository/bloc/bloc.dart';
import 'features/trending_repository/screens/trending_repository_screen.dart';
import 'repositories/trending_repositories_repository.dart';
import 'use_case/trending_repository_use_case.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {

    final trendingRepository = TrendingRepositoriesRepository();
    final trendingRepositoryUseCase = TrendingRepositoryUseCase(
      trendingRepository,
    );


    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => TrendingRepositoryBloc(
            trendingRepositoryUseCase,
          ),
        ),

      ],
      child: MaterialApp(
        title: 'Code Trending Repository Fetch',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const TrendingRepositoryScreen(),
      ),
    );
  }
}
