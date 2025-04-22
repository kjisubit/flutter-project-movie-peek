import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_peek/presentation/widgets/custom_button.dart';
import 'package:movie_peek/routes/route_list.dart';

class IntroScreen extends StatelessWidget {
  const IntroScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Align(
              alignment: Alignment.center,
              child: MoviePeekButton(
                onPressed: () => context.push('/${RouteList.home}'),
                radius: 50,
                child: Text(AppLocalizations.of(context)!.goToHome),
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
