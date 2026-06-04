package com.js.movie_peek.platformview

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.Button
import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Toast
import com.js.movie_peek.R
import io.flutter.plugin.platform.PlatformView

internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?) : PlatformView {

    private val layout: LinearLayout

    override fun getView(): View = layout

    override fun dispose() {}

    init {
        val density = context.resources.displayMetrics.density
        val paddingPx = ((creationParams?.get("padding") as? Int ?: 16) * density).toInt()
        val itemSpacingPx = ((creationParams?.get("itemSpacing") as? Int ?: 12) * density).toInt()

        layout = LinearLayout(context).apply {
            orientation = LinearLayout.VERTICAL
            setPadding(paddingPx, paddingPx, paddingPx, paddingPx)
            setBackgroundColor(Color.WHITE)
        }

        val textView = TextView(context).apply {
            text = "Android Native Text View"
            textSize = 16f
            setTextColor(Color.BLACK)
        }

        val button = Button(context).apply {
            text = "Android Native Button"
            setTextColor(Color.WHITE)
            setBackgroundResource(R.drawable.bg_native_button)
            setOnClickListener {
                Toast.makeText(context, "Native button clicked!", Toast.LENGTH_SHORT).show()
            }
        }

        val buttonParams = LinearLayout.LayoutParams(
            LinearLayout.LayoutParams.MATCH_PARENT,
            LinearLayout.LayoutParams.WRAP_CONTENT,
        ).apply { topMargin = itemSpacingPx }

        layout.addView(textView)
        layout.addView(button, buttonParams)
    }
}
