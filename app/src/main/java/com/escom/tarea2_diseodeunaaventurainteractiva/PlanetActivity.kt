package com.escom.tarea2_diseodeunaaventurainteractiva

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.Button
import android.widget.ImageView
import android.widget.TextView
import android.widget.Toast

class PlanetActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_planet)

        // Recibir datos del planeta seleccionado
        val planetName = intent.getStringExtra("planetName") ?: "Planeta Desconocido"

        // Configurar UI
        val tvPlanetName = findViewById<TextView>(R.id.tvPlanetName)
        val btnViewMoons = findViewById<Button>(R.id.btnViewMoons)
        val planetImage = findViewById<ImageView>(R.id.planetImage)
        val pointInterest1 = findViewById<ImageView>(R.id.pointInterest1)
        val pointInterest2 = findViewById<ImageView>(R.id.pointInterest2)
        val pointInterest3 = findViewById<ImageView>(R.id.pointInterest3)

        tvPlanetName.text = planetName

        // Cambiar imagen según el planeta (CON IMÁGENES PROPIAS)
        val imageResource = when (planetName) {
            "Tierra" -> R.drawable.earth
            "Marte" -> R.drawable.mars
            "Júpiter" -> R.drawable.jupiter
            "Saturno" -> R.drawable.saturn
            "Neptuno" -> R.drawable.neptune
            else -> android.R.drawable.ic_dialog_info
        }
        planetImage.setImageResource(imageResource)

        // Botón para ver lunas
        btnViewMoons.setOnClickListener {
            val intent = Intent(this, MoonActivity::class.java).apply {
                putExtra("moonName", when (planetName) {
                    "Tierra" -> "Luna"
                    "Marte" -> "Fobos y Deimos"
                    "Júpiter" -> "Europa"
                    "Saturno" -> "Titán"
                    "Neptuno" -> "Tritón"
                    else -> "Luna de $planetName"
                })
                putExtra("planetName", planetName) // Enviamos también el planeta
            }
            startActivity(intent)
            overridePendingTransition(R.anim.slide_in_right, R.anim.slide_out_left)
        }

        // Puntos de interés interactivos
        pointInterest1.setOnClickListener {
            showPlanetInfo(planetName, "🌋 Volcán activo")
        }

        pointInterest2.setOnClickListener {
            showPlanetInfo(planetName, "🕳️ Gran cráter de impacto")
        }

        pointInterest3.setOnClickListener {
            showPlanetInfo(planetName, "🏗️ Base de investigación")
        }
    }

    private fun showPlanetInfo(planetName: String, feature: String) {
        Toast.makeText(this, "🔍 $feature en $planetName descubierto!", Toast.LENGTH_LONG).show()
    }

    // Animación al regresar
    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.zoom_in_reverse, R.anim.zoom_out_reverse)
    }
}