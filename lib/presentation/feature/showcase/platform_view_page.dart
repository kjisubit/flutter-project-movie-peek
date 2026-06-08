import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:movie_peek/l10n/app_localizations.dart';

const _viewType = 'com.js.movie_peek/native_view';
const _creationParams = {'padding': 16, 'itemSpacing': 12};

class PlatformViewPage extends StatelessWidget {
  const PlatformViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.platformView),
      ),
      body: switch (defaultTargetPlatform) {
        TargetPlatform.android => _AndroidNativeView(),
        TargetPlatform.iOS => _IOSNativeView(),
        _ => const Center(child: Text('Unsupported platform')),
      },
    );
  }
}

class _AndroidNativeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return PlatformViewLink(
      viewType: _viewType,
      surfaceFactory: (context, controller) {
        return AndroidViewSurface(
          controller: controller as AndroidViewController,
          gestureRecognizers: const <Factory<OneSequenceGestureRecognizer>>{},
          hitTestBehavior: PlatformViewHitTestBehavior.opaque,
        );
      },
      onCreatePlatformView: (params) {
        return PlatformViewsService.initSurfaceAndroidView(
          id: params.id,
          viewType: _viewType,
          layoutDirection: TextDirection.ltr,
          creationParams: _creationParams,
          creationParamsCodec: const StandardMessageCodec(),
          onFocus: () => params.onFocusChanged(true),
        )
          ..addOnPlatformViewCreatedListener(params.onPlatformViewCreated)
          ..create();
      },
    );
  }
}

class _IOSNativeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return UiKitView(
      viewType: _viewType,
      layoutDirection: TextDirection.ltr,
      creationParams: _creationParams,
      creationParamsCodec: const StandardMessageCodec(),
    );
  }
}