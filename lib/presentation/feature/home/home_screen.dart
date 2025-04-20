import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_peek/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:movie_peek/presentation/blocs/navigation/navigation_event.dart';
import 'package:movie_peek/presentation/blocs/navigation/navigation_state.dart';
import 'package:movie_peek/presentation/feature/home/popular_screen.dart';
import 'package:movie_peek/presentation/feature/home/upcoming_screen.dart';
import 'package:movie_peek/presentation/widgets/custom_text.dart';
import 'package:movie_peek/theme/custom_theme_colors.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => NavigationBloc()..add(TabChanged(0)),
      child: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          return Scaffold(
            body: SafeArea(child: _buildBody(context, state.index)),
            bottomNavigationBar: SizedBox(child: _buildBottomNavigationBar(context, state.index)),
          );
        },
      ),
    );
  }
}

Widget _buildBody(BuildContext context, int index) {
  switch (index) {
    case 0:
      return PopularScreen();
    case 1:
      return UpcomingScreen();
    default:
      return PopularScreen();
  }
}

Widget _buildBottomNavigationBar(BuildContext context, int index) {
  final themeColors = Theme.of(context).extension<CustomThemeColors>()!;
  return BottomNavigationBar(
    backgroundColor: themeColors.background,
    type: BottomNavigationBarType.fixed,
    items: <BottomNavigationBarItem>[
      BottomNavigationBarItem(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/icon-star.svg',
              colorFilter: ColorFilter.mode(themeColors.onBackgroundInactive, BlendMode.srcIn),
            ),
            const SizedBox(height: 3),
            CustomText(
              AppLocalizations.of(context)!.popular,
              color: themeColors.onBackgroundInactive,
            ),
          ],
        ),
        activeIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/icon-star.svg',
              colorFilter: ColorFilter.mode(themeColors.primary, BlendMode.srcIn),
            ),
            const SizedBox(height: 3),
            CustomText(
              AppLocalizations.of(context)!.popular,
              color: themeColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        label: AppLocalizations.of(context)!.popular,
      ),
      BottomNavigationBarItem(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/icon-calendar.svg',
              colorFilter: ColorFilter.mode(themeColors.onBackgroundInactive, BlendMode.srcIn),
            ),
            const SizedBox(height: 3),
            CustomText(
              AppLocalizations.of(context)!.upcoming,
              color: themeColors.onBackgroundInactive,
            ),
          ],
        ),
        activeIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/icon-calendar.svg',
              colorFilter: ColorFilter.mode(themeColors.primary, BlendMode.srcIn),
            ),
            const SizedBox(height: 3),
            CustomText(
              AppLocalizations.of(context)!.upcoming,
              color: themeColors.primary,
              fontWeight: FontWeight.bold,
            ),
          ],
        ),
        label: AppLocalizations.of(context)!.upcoming,
      ),
    ],
    currentIndex: index,
    showSelectedLabels: false,
    showUnselectedLabels: false,
    selectedFontSize: 0,
    unselectedFontSize: 0,
    onTap: (index) => context.read<NavigationBloc>().add(TabChanged(index)),
  );
}
