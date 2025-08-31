import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:cinerina/feature/search/bloc/search_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/layout/app_size.dart';
import 'package:uikit/layout/windows_scope.dart';
import 'package:uikit/themes/app_theme.dart';

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
    final layout = LayoutInherited.of(context);
    final textController = TextEditingController();

    return Scaffold(
      backgroundColor: theme.background, // Основной фон экрана
      body: RefreshIndicator(
        onRefresh: () async => context.read<SearchBloc>().add(
          SearchMovie(query: textController.text, completer: Completer()),
        ),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              pinned: true,
              floating: false,
              toolbarHeight: AppSizes.screenHeight(context) * 0.12,
              expandedHeight: AppSizes.screenHeight(context) * 0.2,
              collapsedHeight: AppSizes.screenHeight(context) * 0.12,
              backgroundColor: theme.surface,

              // Switches в title вместо actions
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                        color: theme.textPrimary,
                      ),
                      const SizedBox(height: 4),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch.adaptive(
                          value: themeController.isDark,
                          activeColor: theme.primary,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
                          onChanged: (value) {
                            logInfo(
                              '🌙 Theme toggle: ${themeController.isDark} -> switching',
                            );
                            themeController.toggleTheme();
                          },
                        ),
                      ),
                    ],
                  ),
                  // Layout switch
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        themeController.isList
                            ? Icons.view_list
                            : Icons.grid_view,
                        size: 16,
                        color: theme.textPrimary,
                      ),
                      const SizedBox(height: 4),
                      Transform.scale(
                        scale: 0.8,
                        child: Switch.adaptive(
                          value: themeController.isList,
                          activeColor: theme.secondary,
                          materialTapTargetSize:
                              MaterialTapTargetSize.shrinkWrap,
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
                      ),
                    ],
                  ),
                ],
              ),

              // Поиск в flexibleSpace
              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.only(
                    top: AppSizes.screenHeight(context) * 0.12,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: TextField(
                    controller: textController,
                    onChanged: (value) => context.read<SearchBloc>().add(
                      SearchMovie(query: value),
                    ),
                    decoration: InputDecoration(
                      fillColor: theme.background,
                      filled: true,
                      hintText: 'Поиск фильмов...',
                      labelStyle: theme.h2,
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(
                          AppSizes.radiusLarge,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            BlocBuilder<SearchBloc, SearchState>(
              builder: (context, state) {
                return switch (state) {
                  SearchEmpty() => SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Text(
                          'Ничего не нашлось',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  ),
                  SearchInitial() => SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Text(
                          'Начните поиск',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                      ),
                    ),
                  ),
                  SearchLoading() => SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: CircularProgressIndicator.adaptive(
                          valueColor: AlwaysStoppedAnimation(theme.primary),
                        ),
                      ),
                    ),
                  ),
                  SearchLoaded() =>
                    themeController.isList
                        ? SliverPadding(
                            padding: layout.padding,
                            sliver: SliverList(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => Padding(
                                  padding: EdgeInsets.only(
                                    bottom: layout.spacing,
                                  ),
                                  child: Row(
                                    children: [
                                      // Адаптивный размер изображения для списка
                                      ClipRRect(
                                        borderRadius: BorderRadius.circular(
                                          theme.borderRadiusSmall,
                                        ),
                                        child: CachedNetworkImage(
                                          progressIndicatorBuilder:
                                              (
                                                context,
                                                url,
                                                downloadProgress,
                                              ) => SizedBox(
                                                width: 80,
                                                height: 120,
                                                child: ColoredBox(
                                                  color: theme.surface,
                                                  child: Center(
                                                    child: CircularProgressIndicator(
                                                      value: downloadProgress
                                                          .progress,
                                                      valueColor:
                                                          AlwaysStoppedAnimation(
                                                            theme.primary,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                          errorWidget: (context, url, error) =>
                                              SizedBox(
                                                width: 80,
                                                height: 120,
                                                child: ColoredBox(
                                                  color: theme.surface,
                                                  child: Icon(
                                                    Icons.image_not_supported,
                                                    color: theme.textSecondary,
                                                    size: 24,
                                                  ),
                                                ),
                                              ),
                                          height: 120,
                                          width: 80,
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              state
                                                  .searchList
                                                  .docs?[index]
                                                  .poster
                                                  ?.previewUrl
                                                  .orIfEmpty(
                                                    state
                                                            .searchList
                                                            .docs?[index]
                                                            .poster
                                                            ?.url ??
                                                        '',
                                                  ) ??
                                              'https://www.svgrepo.com/svg/508699/landscape-placeholder',
                                        ),
                                      ),
                                      const SizedBox(width: AppSizes.spacing12),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              state.searchList.docs?[index].name
                                                      .orIfEmpty(
                                                        state
                                                                .searchList
                                                                .docs?[index]
                                                                .alternativeName ??
                                                            '',
                                                      ) ??
                                                  '',
                                              style: theme
                                                  .h4, // Основной текст заголовка
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            const SizedBox(
                                              height: AppSizes.spacing4,
                                            ),
                                            Text(
                                              state
                                                      .searchList
                                                      .docs?[index]
                                                      .description ??
                                                  '',
                                              style: theme.bodySmall.copyWith(
                                                color: theme
                                                    .textSecondary, // Вторичный текст
                                              ),
                                              maxLines: 3,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                childCount: state.searchList.docs?.length ?? 0,
                              ),
                            ),
                          )
                        : SliverPadding(
                            padding: layout.padding,
                            sliver: SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => DecoratedBox(
                                  decoration: BoxDecoration(
                                    color: theme.cardBackground, // Фон карточки
                                    borderRadius: BorderRadius.circular(
                                      theme.borderRadiusMedium,
                                    ),
                                    border: Border.all(
                                      color: theme.dividerColor, // Граница
                                      width: 1,
                                    ),
                                    boxShadow: theme.shadowElevation1, // Тень
                                  ),
                                  child: Column(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(
                                              theme.borderRadiusMedium,
                                            ),
                                            topRight: Radius.circular(
                                              theme.borderRadiusMedium,
                                            ),
                                          ),
                                          child: CachedNetworkImage(
                                            width: double.infinity,
                                            fit: BoxFit.cover,
                                            progressIndicatorBuilder:
                                                (
                                                  context,
                                                  url,
                                                  downloadProgress,
                                                ) => SizedBox(
                                                  child: ColoredBox(
                                                    color: theme.surface,
                                                    child: Center(
                                                      child: CircularProgressIndicator(
                                                        value: downloadProgress
                                                            .progress,
                                                        valueColor:
                                                            AlwaysStoppedAnimation(
                                                              theme.primary,
                                                            ),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            errorWidget:
                                                (
                                                  context,
                                                  url,
                                                  error,
                                                ) => SizedBox(
                                                  child: ColoredBox(
                                                    color: theme.surface,
                                                    child: Icon(
                                                      Icons.image_not_supported,
                                                      color:
                                                          theme.textSecondary,
                                                      size: 48,
                                                    ),
                                                  ),
                                                ),
                                            imageUrl:
                                                state
                                                    .searchList
                                                    .docs?[index]
                                                    .poster
                                                    ?.previewUrl
                                                    .orIfEmpty(
                                                      state
                                                              .searchList
                                                              .docs?[index]
                                                              .poster
                                                              ?.url ??
                                                          '',
                                                    ) ??
                                                'https://www.svgrepo.com/svg/508699/landscape-placeholder',
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8),
                                          child: Text(
                                            state.searchList.docs?[index].name
                                                    .orIfEmpty(
                                                      state
                                                              .searchList
                                                              .docs?[index]
                                                              .alternativeName ??
                                                          '',
                                                    ) ??
                                                '',
                                            style: theme
                                                .bodyMedium, // Основной текст
                                            textAlign: TextAlign.center,
                                            maxLines: 2,
                                            overflow: TextOverflow.ellipsis,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                childCount: state.searchList.docs?.length ?? 0,
                              ),
                              gridDelegate:
                                  SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: layout.columns,
                                    crossAxisSpacing: layout.spacing,
                                    mainAxisSpacing: layout.spacing,
                                    childAspectRatio: 0.75,
                                  ),
                            ),
                          ),
                  SearchError() => SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Center(
                        child: Column(
                          children: [
                            Icon(
                              Icons.error_outline,
                              size: 64,
                              color: theme.error, // Цвет ошибки
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Произошла ошибка',
                              style: theme.h4.copyWith(color: theme.error),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              'Попробуйте еще раз',
                              style: theme.bodyMedium.copyWith(
                                color: theme.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                };
              },
            ),
          ],
        ),
      ),
    );
  }
}

extension StringExtensions on String? {
  String orIfEmpty(String alternative) {
    if (this == null || this!.isEmpty) {
      return alternative;
    }
    return this!;
  }
}
