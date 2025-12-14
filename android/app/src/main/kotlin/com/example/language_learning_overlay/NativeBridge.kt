package com.example.language_learning_overlay

import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

object NativeBridge {

    private lateinit var channel: MethodChannel

    fun init(flutterEngine: FlutterEngine) {
        channel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "lens_bridge"
        )
    }

    fun sendText(text: String) {
        channel.invokeMethod("onTextSelected", text)
    }
}
