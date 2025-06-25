import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_peek/l10n/app_localizations.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:movie_peek/presentation/blocs/navigation/navigation_bloc.dart';
import 'package:movie_peek/presentation/blocs/navigation/navigation_event.dart';
import 'package:movie_peek/presentation/blocs/navigation/navigation_state.dart';
import 'package:movie_peek/presentation/feature/upcoming/upcoming_screen.dart';
import 'package:movie_peek/theme/custom_theme_colors.dart';

import '../today_popular/today_popular_screen.dart';

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
            bottomNavigationBar: SizedBox(
              child: _buildBottomNavigationBar(context, state.index),
            ),
          );
        },
      ),
    );
  }
}

Widget _buildBody(BuildContext context, int index) {
  switch (index) {
    case 0:
      return TodayPopularScreen();
    case 1:
      return UpcomingScreen();
    default:
      return TodayPopularScreen();
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
              colorFilter: ColorFilter.mode(
                themeColors.onBackgroundInactive,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              AppLocalizations.of(context)!.popular,
              style: TextStyle(
                color: themeColors.onBackgroundInactive,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        activeIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/icon-star.svg',
              colorFilter: ColorFilter.mode(
                themeColors.primary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              AppLocalizations.of(context)!.todayPopular,
              style: TextStyle(
                color: themeColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        label: 'today popular',
      ),
      BottomNavigationBarItem(
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/icon-calendar.svg',
              colorFilter: ColorFilter.mode(
                themeColors.onBackgroundInactive,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              AppLocalizations.of(context)!.upcoming,
              style: TextStyle(
                color: themeColors.onBackgroundInactive,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        activeIcon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              'assets/svg/icon-calendar.svg',
              colorFilter: ColorFilter.mode(
                themeColors.primary,
                BlendMode.srcIn,
              ),
            ),
            const SizedBox(height: 3),
            Text(
              AppLocalizations.of(context)!.upcoming,
              style: TextStyle(
                color: themeColors.primary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        label: 'upcoming',
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
