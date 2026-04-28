import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_peek/l10n/app_localizations.dart';
import 'package:movie_peek/presentation/widgets/movie_surface.dart';
import 'package:movie_peek/routes/route_list.dart';
import 'package:movie_peek/theme/custom_theme_colors.dart';
// TODO: import platform channel for native screen launch

class ShowcaseScreen extends StatelessWidget {
  const ShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(
        title: Text(l10n.showcase),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          _ShowcaseItem(
            title: l10n.nativeScreen,
            description: l10n.nativeScreenDesc,
            onTap: null, // TODO: MethodChannel로 네이티브 화면 호출
          ),
          const SizedBox(height: 12),
          _ShowcaseItem(
            title: l10n.platformView,
            description: l10n.platformViewDesc,
            onTap: () => context.pushNamed(RouteList.platformView),
          ),
        ],
      ),
    );
  }
}

class _ShowcaseItem extends StatelessWidget {
  final String title;
  final String description;
  final VoidCallback? onTap;

  const _ShowcaseItem({
    required this.title,
    required this.description,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<CustomThemeColors>()!;
    return MovieSurface(
      onTap: onTap,
      borderRadius: BorderRadius.circular(12),
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: colors.onBackgroundActive,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  description,
                  style: TextStyle(
                    color: colors.onBackgroundInactive,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ),
          Icon(Icons.chevron_right, color: colors.onBackgroundInactive),
        ],
      ),
    );
  }
}
