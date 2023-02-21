package com.example.asset_variation

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainActivity : FlutterActivity() {
    private var channel: MethodChannel? = null

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == HomeActivity.REQUEST_CODE) {
            val choose = data.getBooleanExtra(HomeActivity.CHOOSE_PARAM, false)
            val mapWithValues = hashMapOf(
                "choose" to choose,
            )
            channel?.invokeMethod("sendData", mapWithValues)

        }
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {


        GeneratedPluginRegistrant.registerWith(flutterEngine)
        channel = MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            "com.example.asset_variation/channel"
        )
        channel?.setMethodCallHandler { call, result ->
            if (call.method == "startActivity") {
                val intent = Intent(this@MainActivity, HomeActivity::class.java)
                startActivityForResult(intent, 2) // Activity is star
            } else {
                result.notImplemented()
            }

        }

    }
}
