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

    return Scaffold(
      backgroundColor: theme.background, // Основной фон экрана
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            centerTitle: true,   
            expandedHeight: AppSizes.screenHeight(context) * 0.2,
            backgroundColor:
                theme.surface, // Фон при сворачивании и раскрытии
            title: Row(
              mainAxisAlignment: MainAxisAlignment.start,
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
                      color:
                          theme.textPrimary, // Используем цвет текста из темы
                    ),
                    Switch.adaptive(
                      value: themeController.isDark,
                      activeColor:
                          theme.primary, // Цвет активного переключателя
                      onChanged: (value) {
                        logInfo(
                          '🌙 Theme toggle: ${themeController.isDark} -> switching',
                        );
                        themeController.toggleTheme();
                      },
                    ),
                  ],
                ),
                const SizedBox(width: 16), // Отступ между переключателями
                // Layout switch
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      themeController.isList
                          ? Icons.view_list
                          : Icons.grid_view,
                      size: 16,
                      color:
                          theme.textPrimary, // Используем цвет текста из темы
                    ),
                    Switch.adaptive(
                      value: themeController.isList,
                      activeColor: theme
                          .secondary, // Другой цвет для второго переключателя
                      onChanged: (value) {
                        logInfo(
                          '🎛️ Layout toggle: ${themeController.isList} -> switching',
                        );
                        logInfo('📋 layoutType: ${themeController.layoutType}');
                        themeController.toggleLayout();
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
          BlocBuilder<SearchBloc, SearchState>(
            builder: (context, state) {
              return switch (state) {
                SearchInitial() => SliverToBoxAdapter(

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
                                child: Container(
                                  padding: const EdgeInsets.all(16),
                                  decoration: BoxDecoration(
                                    color: theme.cardBackground, // Фон карточки
                                    borderRadius: BorderRadius.circular(
                                      theme.borderRadiusMedium,
                                    ),
                                    border: Border.all(
                                      color: theme
                                          .dividerColor, // Граница карточки
                                      width: 1,
                                    ),
                                    boxShadow: theme.shadowElevation1, // Тень
                                  ),
                                  child: Row(
                                    children: [
                                      // Placeholder для изображения
                                      Container(
                                        width: 60,
                                        height: 80,
                                        decoration: BoxDecoration(
                                          color:
                                              theme.surface, // Фон плейсхолдера
                                          borderRadius: BorderRadius.circular(
                                            theme.borderRadiusSmall,
                                          ),
                                        ),
                                        child: Icon(
                                          Icons.movie,
                                          color: theme.textDisabled,
                                        ),
                                      ),
                                      const SizedBox(width: 12),
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
                                            const SizedBox(height: 4),
                                            Text(
                                              'Дополнительная информация',
                                              style: theme.bodySmall.copyWith(
                                                color: theme
                                                    .textSecondary, // Вторичный текст
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
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
                              (context, index) => Container(
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
                                      child: Container(
                                        margin: const EdgeInsets.all(8),
                                        decoration: BoxDecoration(
                                          color:
                                              theme.surface, // Фон изображения
                                          borderRadius: BorderRadius.circular(
                                            theme.borderRadiusSmall,
                                          ),
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.movie,
                                            size: 32,
                                            color: theme
                                                .textDisabled, // Иконка плейсхолдера
                                          ),
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
