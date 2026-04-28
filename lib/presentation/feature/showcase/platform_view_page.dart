import 'package:flutter/material.dart';
import 'package:movie_peek/l10n/app_localizations.dart';

class PlatformViewPage extends StatelessWidget {
  const PlatformViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.platformView),
      ),
      body: const Center(
        child: Text('Platform View — Coming Soon'),
      ),
    );
  }
}