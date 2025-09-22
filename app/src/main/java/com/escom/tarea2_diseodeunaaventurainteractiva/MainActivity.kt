package com.escom.tarea2_diseodeunaaventurainteractiva

import android.content.Intent
import androidx.appcompat.app.AppCompatActivity
import android.os.Bundle
import android.widget.ImageView
import android.widget.Toast

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        // Configurar clicks en los planetas (agrega estos IDs en el layout)
        setupPlanetClicks()

        // Puntos de interés
        findViewById<ImageView>(R.id.pointInterest1).setOnClickListener {
            Toast.makeText(this, "⭐ ¡Estrella fugaz avistada!", Toast.LENGTH_SHORT).show()
        }
        findViewById<ImageView>(R.id.pointInterest2).setOnClickListener {
            Toast.makeText(this, "🛰️ Satélite detectado", Toast.LENGTH_SHORT).show()
        }
        findViewById<ImageView>(R.id.pointInterest3).setOnClickListener {
            Toast.makeText(this, "☄️ ¡Cometa interestelar!", Toast.LENGTH_SHORT).show()
        }
    }

    private fun setupPlanetClicks() {
        // Necesitarías agregar IDs a cada tarjeta de planeta
        // Por ahora, puedes hacerlo manualmente o mantener la lista
    }

    override fun finish() {
        super.finish()
        overridePendingTransition(R.anim.fade_in, R.anim.fade_out)
    }
}