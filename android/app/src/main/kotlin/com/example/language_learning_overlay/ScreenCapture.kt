package com.example.language_learning_overlay

import android.app.Activity
import android.content.Intent

object ScreenCapture {

    fun start(activity: Activity, data: Intent) {
        // TEMP: confirm pipeline works
        NativeBridge.sendText("Screen capture permission granted")
    }
}
