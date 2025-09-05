import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:cinerina/core/util/logger.dart';
import 'package:cinerina/feature/initialization/widget/depend_scope.dart';
import 'package:cinerina/feature/search/bloc/search_bloc.dart';
import 'package:cinerina/feature/search/model/search_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uikit/color/colors.dart';
import 'package:uikit/layout/app_size.dart';
import 'package:uikit/layout/windows_scope.dart';
import 'package:uikit/themes/app_theme.dart';
import 'package:cinerina/core/extension/string_extension.dart';

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
    final bloc = DependScope.of(context).dependModel.searchBloc;
    return Scaffold(
      backgroundColor: theme.background,
      body: RefreshIndicator(
        onRefresh: () async => bloc.add(
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
                      const SizedBox(height: 2),
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
                      const SizedBox(height: 2),
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

              flexibleSpace: FlexibleSpaceBar(
                background: Padding(
                  padding: EdgeInsets.only(
                    top: AppSizes.screenHeight(context) * 0.12,
                    left: 16,
                    right: 16,
                    bottom: 16,
                  ),
                  child: TextField(
                    onChanged: (value) => textController.text = value,
                    decoration: InputDecoration(
                      fillColor: theme.background,
                      filled: true,
                      hintText: 'Поиск фильмов...',
                      labelStyle: theme.h2,
                      prefixIcon: IconButton(
                        icon: Icon(Icons.search),
                        onPressed: () => bloc..add(SearchMovie(query: textController.text))
                      ),
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
              bloc: bloc,
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
                                  child: InkWell(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) {
                                            return _MovieDetailScreen(
                                              movie:
                                                  state.searchList.docs?[index],
                                              heroTag: '$index',
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
                                                  '',
                                              description:
                                                  state
                                                      .searchList
                                                      .docs?[index]
                                                      .description ??
                                                  '',

                                              name:
                                                  state
                                                      .searchList
                                                      .docs?[index]
                                                      .name
                                                      .orIfEmpty(
                                                        state
                                                                .searchList
                                                                .docs?[index]
                                                                .alternativeName ??
                                                            '',
                                                      ) ??
                                                  '',
                                            );
                                          },
                                        ),
                                      );
                                    },
                                    child: Row(
                                      children: [
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
                                            errorWidget:
                                                (
                                                  context,
                                                  url,
                                                  error,
                                                ) => SizedBox(
                                                  width: 80,
                                                  height: 120,
                                                  child: ColoredBox(
                                                    color: theme.surface,
                                                    child: Icon(
                                                      Icons.image_not_supported,
                                                      color:
                                                          theme.textSecondary,
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
                                        const SizedBox(
                                          width: AppSizes.spacing12,
                                        ),
                                        Expanded(
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                state
                                                        .searchList
                                                        .docs?[index]
                                                        .name
                                                        .orIfEmpty(
                                                          state
                                                                  .searchList
                                                                  .docs?[index]
                                                                  .alternativeName ??
                                                              '',
                                                        ) ??
                                                    '',
                                                style: theme.h4,
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
                                                  color: theme.textSecondary,
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
                                ),
                                childCount: state.searchList.docs?.length ?? 0,
                              ),
                            ),
                          )
                        : SliverPadding(
                            padding: layout.padding,
                            sliver: SliverGrid(
                              delegate: SliverChildBuilderDelegate(
                                (context, index) => InkWell(
                                  onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return _MovieDetailScreen(
                                          movie: state.searchList.docs?[index],
                                          heroTag: '$index',
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
                                              '',
                                          description:
                                              state
                                                  .searchList
                                                  .docs?[index]
                                                  .description ??
                                              '',

                                          name:
                                              state.searchList.docs?[index].name
                                                  .orIfEmpty(
                                                    state
                                                            .searchList
                                                            .docs?[index]
                                                            .alternativeName ??
                                                        '',
                                                  ) ??
                                              '',
                                        );
                                      },
                                    ),
                                  ),
                                  child: DecoratedBox(
                                    decoration: BoxDecoration(
                                      color: theme.cardBackground,
                                      borderRadius: BorderRadius.circular(
                                        theme.borderRadiusMedium,
                                      ),
                                      border: Border.all(
                                        color: theme.dividerColor,
                                        width: 1,
                                      ),
                                      boxShadow: theme.shadowElevation1,
                                    ),
                                    child: Column(
                                      children: [
                                        Expanded(
                                          flex: 3,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(
                                                theme.borderRadiusLarge,
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
                                                          value:
                                                              downloadProgress
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
                                                        Icons
                                                            .image_not_supported,
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
                                              style: theme.bodyMedium,
                                              textAlign: TextAlign.center,
                                              maxLines: 2,
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
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
                              color: theme.error,
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

class _MovieDetailScreen extends StatelessWidget {
  const _MovieDetailScreen({
    required this.heroTag,
    required this.movie,
    required this.name,
    required this.imageUrl,
    required this.description,
  });

  final String heroTag;
  final String name;
  final String imageUrl;
  final String description;
  final Doc? movie;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;
    final screenHeight = AppSizes.screenHeight(context);

    return Scaffold(
      backgroundColor: theme.background,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: screenHeight * 0.6,
            pinned: true,
            stretch: true,
            backgroundColor: theme.surface.withOpacity(0.95),
            iconTheme: IconThemeData(color: Colors.white),
            elevation: 0,
            flexibleSpace: FlexibleSpaceBar(
              stretchModes: const [
                StretchMode.zoomBackground,
                StretchMode.blurBackground,
              ],
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Hero(
                    tag: heroTag.replaceFirst('movie-', 'movie-poster-'),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      fit: BoxFit.cover,
                      errorWidget: (context, url, error) => Container(
                        color: theme.surface,
                        child: Center(
                          child: Icon(
                            Icons.movie,
                            size: 120,
                            color: theme.textSecondary,
                          ),
                        ),
                      ),
                      progressIndicatorBuilder: (context, url, progress) =>
                          Container(
                            color: theme.surface,
                            child: Center(
                              child: CircularProgressIndicator(
                                value: progress.progress,
                                valueColor: AlwaysStoppedAnimation(
                                  theme.primary,
                                ),
                              ),
                            ),
                          ),
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.black.withOpacity(0.3),
                          Colors.transparent,
                          theme.background.withOpacity(0.8),
                          theme.background,
                        ],
                        stops: const [0.0, 0.3, 0.8, 1.0],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: theme.background,
                  borderRadius: BorderRadius.circular(AppSizes.radiusLarge),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Hero(
                        tag: 'movie-title-${heroTag.split('-').last}',
                        child: ColoredBox(
                          color: Colors.transparent,
                          child: DecoratedBox(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Text(
                              name,
                              style: theme.h1.copyWith(
                                fontSize: 28,
                                fontWeight: FontWeight.bold,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 16),

                      Wrap(
                        spacing: 12,
                        runSpacing: 8,
                        children: [
                          if (movie?.year != null)
                            _InfoChip(
                              icon: Icons.calendar_today,
                              label: movie?.year.toString() ?? '',
                              color: theme.primary,
                            ),
                          if (movie?.rating?.imdb != null)
                            _InfoChip(
                              icon: Icons.star,
                              label: '${movie?.rating?.imdb}/10',
                              color: theme.cardBackground,
                            ),
                          if (movie?.countries != null)
                            _InfoChip(
                              isExpanded:
                                  (movie?.countries
                                              ?.map((country) => country.name)
                                              .join(', ') ??
                                          '')
                                      .length >
                                  20,
                              icon: Icons.public,
                              label:
                                  movie?.countries
                                      ?.map((country) => country.name)
                                      .join(', ') ??
                                  '',
                              color: theme.secondary,
                            ),
                        ],
                      ),

                      const SizedBox(height: 24),
                      SizedBox(
                        width: double.infinity,
                        child: DecoratedBox(
                          decoration: BoxDecoration(
                            color: theme.cardBackground,
                            borderRadius: BorderRadius.circular(
                              theme.borderRadiusMedium,
                            ),
                            border: Border.all(
                              color: theme.dividerColor,
                              width: 1,
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(AppSizes.double16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.description_outlined,
                                      color: theme.primary,
                                      size: 20,
                                    ),
                                    const SizedBox(width: 8),
                                    Text(
                                      'Описание',
                                      style: theme.h4.copyWith(
                                        color: theme.primary,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 12),
                                Text(
                                  description.isEmpty
                                      ? 'Описание не доступно'
                                      : description,
                                  style: theme.h5,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      if (movie?.genres?.isNotEmpty == true) ...[
                        Text('Жанры', style: theme.h4),
                        const SizedBox(height: 8),
                        Wrap(
                          spacing: 8,
                          runSpacing: 8,
                          children: (movie?.genres as List).map((genre) {
                            return DecoratedBox(
                              decoration: BoxDecoration(
                                color: theme.primary,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color: theme.primary,
                                  width: 1,
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(8),
                                child: Text(genre.name ?? '', style: theme.h6),
                              ),
                            );
                          }).toList(),
                        ),
                        const SizedBox(height: 20),
                      ],
                      const SizedBox(height: 40),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final bool isExpanded;

  const _InfoChip({
    required this.icon,
    required this.label,
    required this.color,
    this.isExpanded = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).extension<AppTheme>()!;

    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(AppSizes.radiusRound),
        border: Border.all(color: color, width: 1.5),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
        child: Column(
          children: [
            Row(
              mainAxisSize: isExpanded ? MainAxisSize.max : MainAxisSize.min,
              children: [
                Icon(icon, color: ThemeConstants.textPrimaryLight, size: 20),
                const SizedBox(width: 8),

                isExpanded
                    ? Expanded(child: Text(label, style: theme.h6))
                    : Text(label, style: theme.h6),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
