import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:cinerina/feature/search/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/layout/app_size.dart';
import 'package:uikit/themes/app_theme.dart';
import 'package:uikit/utils/layout_type_enum.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> with LoggerMixin {
  @override
  Widget build(BuildContext context) {
    final themeController = DependScope.of(context).dependModel.themeController;
    final theme = Theme.of(context).extension<AppTheme>()!;

    return Scaffold(
      backgroundColor: theme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: AppSizes.screenHeight(context) * 0.2,
            backgroundColor: Colors.red,
            actions: [
              // Оборачиваем кнопки в ListenableBuilder
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Theme switch
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        themeController.isDark
                            ? Icons.dark_mode
                            : Icons.light_mode,
                        size: 16,
                        color: Colors.white,
                      ),
                      Switch.adaptive(
                        value: themeController.isDark,
                        onChanged: (value) {
                          logInfo(
                            '🌙 Theme toggle: ${themeController.isDark} -> switching',
                          );
                          themeController.toggleTheme();
                        },
                      ),
                    ],
                  ),
                  SizedBox(width: 16),
                  // Layout switch
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        themeController.isList
                            ? Icons.view_list
                            : Icons.grid_view,
                        size: 16,
                        color: Colors.white,
                      ),
                      Switch.adaptive(
                        value: themeController.isList,
                        onChanged: (value) {
                          logInfo(
                            '🎛️ Layout toggle: ${themeController.isList} -> switching',
                          );
                          logInfo(
                            '📋 layoutType: ${themeController.layoutType}',
                          );
                          themeController.toggleLayout();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),

          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return switch (state) {
                SearchInitial() => SliverToBoxAdapter(child: Container()),
                SearchLoading() => SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator.adaptive()),
                ),
                SearchLoaded() =>
                  themeController.isList
                      ? SliverList(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => Container(
                              height: 80,
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.yellow,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  state.searchList.docs?[index].name ??
                                      '',
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            childCount: state.searchList.docs?.length ?? 0,
                          ),
                        )
                      : SliverGrid(
                          delegate: SliverChildBuilderDelegate(
                            (context, index) => Container(
                              margin: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Center(
                                child: Text(
                                  state
                                          .searchList
                                          .docs?[index]
                                          .name ??
                                      '',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                            childCount: state.searchList.docs?.length ?? 0,
                          ),
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                crossAxisSpacing: 8,
                                mainAxisSpacing: 8,
                                childAspectRatio: 1.0,
                              ),
                        ),
                SearchError() => SliverToBoxAdapter(child: Container()),
              };
            },
          ),
        ],
      ),
    );
  }
}
