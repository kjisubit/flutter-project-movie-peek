import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:movie_peek/presentation/widgets/custom_text_button.dart';
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
              child: CustomTextButton(
                label: AppLocalizations.of(context)!.goToHome,
                onPressed: () => context.push('/${RouteList.home}'),
                radius: 50,
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
