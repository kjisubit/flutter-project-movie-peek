package com.js.movie_peek

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {

    companion object {
        private const val CHANNEL = "com.js.movie_peek/native"
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, CHANNEL)
            .setMethodCallHandler { call, result ->
                when (call.method) {
                    "openNativeMovieScreen" -> {
                        val title = call.argument<String>("title") ?: ""
                        val posterUrl = call.argument<String>("posterUrl") ?: ""
                        val rating = call.argument<Double>("rating") ?: 0.0

                        val intent = Intent(this, NativeMovieActivity::class.java).apply {
                            putExtra(NativeMovieActivity.EXTRA_TITLE, title)
                            putExtra(NativeMovieActivity.EXTRA_POSTER_URL, posterUrl)
                            putExtra(NativeMovieActivity.EXTRA_RATING, rating)
                        }
                        startActivity(intent)
                        result.success(null)
                    }
                    else -> result.notImplemented()
                }
            }

        flutterEngine.platformViewsController.registry
            .registerViewFactory(NativeViewFactory.VIEW_TYPE, NativeViewFactory())
    }
}
