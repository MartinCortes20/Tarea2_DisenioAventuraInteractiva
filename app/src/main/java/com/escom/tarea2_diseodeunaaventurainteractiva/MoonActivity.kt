package com.escom.tarea2_diseodeunaaventurainteractiva

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast

class MoonActivity : AppCompatActivity() {
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_moon)

        // Recibir datos del planeta
        val moonName = intent.getStringExtra("moonName") ?: "Luna Desconocida"

        // Configurar UI
        val tvMoonName = findViewById<TextView>(R.id.tvMoonName)
        val btnMoonInfo = findViewById<Button>(R.id.btnMoonInfo)
        val pointOfInterest = findViewById<ImageView>(R.id.pointOfInterest)

        tvMoonName.text = moonName

        // Botón de información
        btnMoonInfo.setOnClickListener {
            Toast.makeText(this, "Información sobre $moonName", Toast.LENGTH_SHORT).show()
        }

        // Punto de interés interactivo
        pointOfInterest.setOnClickListener {
            Toast.makeText(this, "🏗️ Base lunar en $moonName\n¡Exploración exitosa!", Toast.LENGTH_LONG).show()
        }
    }

    // Animación al salir
    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.slide_in_left, R.anim.slide_out_right)
    }
}