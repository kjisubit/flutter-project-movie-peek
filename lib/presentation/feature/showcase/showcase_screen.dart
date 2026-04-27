import 'package:flutter/material.dart';
import 'package:movie_peek/l10n/app_localizations.dart';

class ShowcaseScreen extends StatelessWidget {
  const ShowcaseScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.showcase),
      ),
      body: const Center(
        child: Text('Showcase'),
      ),
    );
  }
}