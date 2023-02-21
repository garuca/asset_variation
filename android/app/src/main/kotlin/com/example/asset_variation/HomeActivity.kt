package com.example.asset_variation

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.util.Log
import android.widget.Button


class HomeActivity : AppCompatActivity() {
    companion object {
        const val REQUEST_CODE = 2
        private const val APPLICATION_ID = "com.example.asset_variation"
        const val CHOOSE_PARAM = "$APPLICATION_ID.home-activity.params.choose"
    }
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setTheme(R.style.Theme_MyApplication);
        setContentView(R.layout.activity_home)
        val openChart = findViewById<Button>(R.id.open_chart)
        openChart.setOnClickListener {
            val intent = Intent()
            intent.putExtra(CHOOSE_PARAM, false)
            setResult(2, intent)

            finish() //finishing activity
        }
        val openTable = findViewById<Button>(R.id.open_table)
        openTable.setOnClickListener {
            val intent = Intent()
            intent.putExtra(CHOOSE_PARAM, true)
            setResult(2, intent)

            finish() //finishing activity

        }
    }
}