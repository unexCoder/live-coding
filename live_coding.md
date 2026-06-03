# Live Coding

<p style="font-size: 24px;padding:20px">
Live coding o "programación conversacional" (conversational programming) es el acto de modificar el código fuente de un programa mientras se está ejecutando.
</p>

> «El código es poesía ejecutable». — Algorave

> «Live coding es la práctica de programar en tiempo real como performance musical». — Alex McLean

---

## Live coding en la práctica de las artes mediales

**Live coding** (programación en vivo) es una práctica artística en la que el creador escribe y modifica código de programación **durante la performance**, generando música, visuales, danza o arte interactivo en tiempo real. El código no es solo un medio para producir el resultado final: es parte visible y central de la obra.

Características principales:

| Característica | Descripción |
|---|---|
| **Tiempo real** | El código se ejecuta mientras se escribe; los cambios son inmediatos. |
| **Transparencia** | El público suele ver la pantalla del programador (proyectada). |
| **Improvisación** | La creación es espontánea, no está totalmente predefinida. |
| **Interactividad** | El código puede responder a sensores, red, audiencia u otros artistas. |
| **Cultura open source** | La mayoría de herramientas son libres y comunitarias. |

El live coding no es solo «música con código»: es una **estética de la improvisación programada**, donde errores, giros inesperados y decisiones en tiempo real forman parte de la expresión.

---

## Contexto histórico conceptual

### Raíces en la música algorítmica y la informática musical

El live coding hereda ideas de:

- **Música algorítmica** (desde el motete isorrítmico S. XIII–XIV hasta el serialismo S. XX).
- **Musikalisches Würfelspiel** (S. XVIII): música generada por azar con dados.
- **Suite Illiac** (1957): primera composición por computadora electrónica.
- **Xenakis y los procesos estocásticos**: uso de modelos matemáticos en la composición.
- **Serialismo y postserialismo**: racionalización extrema de parámetros musicales.
- **Computación musical** (Max Mathews, MUSIC I–V, Csound, MIDI): primeras lenguas de síntesis y composición por computadora.

Estas tradiciones ya veían la música como **estructura formalizable**, pero el live coding añade una dimensión clave: **la escritura del algoritmo como acto performático en vivo**.

- **Años 90–2000**: aparece SuperCollider (1996), con un lenguaje dinámico, orientado a objetos y pensado para tiempo real; se convierte en un punto de inflexión para el live coding musical.

El live coding como **movimiento organizado** emerge a finales de los 90 y principios de los 2000, con:

- **Algoraves** (desde ~2010): festivales y eventos donde toda la música se hace live coding.
- Comunidades en IRCAM, MIT, Cambridge, Brighton, y redes globales.
---

## Fundamentos conceptuales

### Código como performance

- El **acto de programar** es parte de la obra, no solo un medio.
- El código es **visible** (proyectado) y **audible** (sonido/visuales).
- El error, la corrección y el experimento son parte estética.
- **Código en constante reescritura**.
- **Obra abierta** que nunca es exactamente la misma dos veces.

### Estética de la improvisación programada

- **Improvisación musical** (jazz, electromusicología).
- **Programación interactiva** (tiempo real, concurrencia).
- **Estética digital** (glitch, ruido, patrones algorítmicos).

### Cultura libre y comunidad

- **Software libre y open source**: SuperCollider, TidalCycles, Sonic Pi, Pure Data, FAUST.
- **Compartir código**: sets publicados, repositorios, tutoriales.
- **Educación abierta**: Sonic Pi en escuelas, talleres comunitarios.

El live coding es, en gran medida, un **movimiento cultural** que valora:

- Colaboración y comunidad.
- Acceso abierto a herramientas.
- Experimentación colectiva.

---

## Herramientas y lenguajes clave

### Lenguajes y entornos principales

| Herramienta | Año | Características | Uso típico |
|---|---|---|---|
| **SuperCollider** | 1996 | Tiempo real, sintaxis potente,oriented to objects, open source | Live coding musical, síntesis avanzada |
| **TidalCycles** | 2010 | Basado en Haskell, patrones rítmicos, backend SuperCollider | Música electrónica algorítmica en vivo |
| **Sonic Pi** | 2012 | Basado en Ruby/SuperCollider, educativo, simple | Enseñanza, live coding accesible |
| **Overtone** | 2010 | Clojure + SuperCollider, enfoque funcional | Live coding funcional, música en vivo |

### Ejemplo de sintaxis: SuperCollider y TidalCycles

**SuperCollider** (esquema básico):

```supercollider
// Un parche simple de SuperCollider
x={ |f=440| SinOsc.ar(f) }.play
x.set(\f,200)
```

**TidalCycles** (Haskell, patrones rítmicos):

```haskell
-- Patrón rítmico
d1 $ sound "bd sn"
```

**Sonic Pi** (Ruby-like, educativo):

```ruby
live_loop :bit do
  use_bpm 120
  play :C4
  sleep 0.5
  play :E4
  sleep 0.5
end
```

---

## Lenguajes y estéticas

### [TidalCycles](https://tidalcycles.org/)

Tidal Cycles es un entorno de "live coding" gratuito y de código abierto para generar patrones algorítmicos, escrito en Haskell. Tidal utiliza SuperCollider, otro software de código abierto, para la síntesis y generacion de audio y MIDI. Tidal ha inspirado una familia de entornos similares de código abierto que adoptan su modelo de patrones temporales, conocido como «Uzulangs», entre los que se incluye el entorno web Strudel.

Tidal Cycles permite crear patrones mediante código. Incluye un lenguaje para describir secuencias flexibles (por ejemplo, polifónicas, polirrítmicas o generativas) de sonidos, notas, parámetros y todo tipo de información.


[![TidalCycles](https://img.youtube.com/vi/XYe8AKYPUYc/maxresdefault.jpg)](https://www.youtube.com/watch?v=XYe8AKYPUYc)

### [Hydra](https://github.com/hydra-synth/hydra)

Conjunto de herramientas para la programación conversacional de elementos visuales en red. Inspiradas en los sintetizadores modulares analógicos, estas herramientas constituyen una exploración del uso de la transmisión en streaming a través de la web para enrutar fuentes y salidas de vídeo en tiempo real.

Hydra utiliza múltiples búferes de fotogramas para permitir la mezcla, la composición y la colaboración dinámicas entre flujos visuales conectados a través del navegador. Se pueden aplicar transformaciones de coordenadas y de color a cada salida mediante funciones encadenadas.

[![Hydra](https://img.youtube.com/vi/LE0adfFv8eo/maxresdefault.jpg)](https://www.youtube.com/watch?v=LE0adfFv8eo)

### [Orca](https://github.com/hundredrabbits/Orca)

Orca es un [lenguaje de programación esotérico](https://en.wikipedia.org/wiki/Esoteric_programming_language) diseñado para crear rápidamente secuenciadores procedimentales, en el que cada letra del alfabeto representa una operación: las minúsculas actúan en cada compás, mientras que las mayúsculas lo hacen en cada fotograma.

Esta aplicación no es un sintetizador, sino un entorno de programación en directo capaz de enviar señales MIDI, OSC y UDP a tus interfaces audiovisuales, como Ableton, Renoise, VCV Rack o SuperCollider.

[![Orca](https://img.youtube.com/vi/hOEi7X88PeQ/maxresdefault.jpg)](https://www.youtube.com/watch?v=hOEi7X88PeQ)

### [Conductive](https://hackage.haskell.org/package/conductive-base)

Conductive es un conjunto de paquetes de Haskell destinados a la programación en directo y a aplicaciones musicales en tiempo real. Uno de sus objetivos principales es controlar la sincronización de los eventos. Conductive-base es la biblioteca principal del conjunto de bibliotecas Conductive. Esta biblioteca incluye las funciones play, pause, stop y reset, así como los tipos de datos correspondientes: MusicalEnvironment, Player y TempoClock.

[![Conductive](https://img.youtube.com/vi/8LR-AvsRQEs/maxresdefault.jpg)](https://www.youtube.com/watch?v=8LR-AvsRQEs)

### [Strudel](https://strudel.cc/)

Strudel es una versión en JavaScript de Tidalcycles, un popular lenguaje de programación musical para  live coding escrito en Haskell. Strudel es software libre y de código abierto: puedes redistribuirlo y/o modificarlo según los términos de la Licencia Pública General Affero de GNU. Puedes encontrar el código fuente en Codeberg.


## TOPLAP - Temporal Organisation for the Parsimony of Live AudioVisual Programming

[TOPLAP Blog](https://blog.toplap.org/)

[Github](https://github.com/toplap/awesome-livecoding)


## Referencias y recursos

- **SuperCollider**: https://supercollider.github.io/
- **TidalCycles**: https://tidalcycles.org/
- **Sonic Pi**: https://sonic-pi.net/
- **Algorave**: https://algorave.com/
- **Iannis Xenakis**: [Formalized Music: Thought and Mathematics in Composition](https://en.wikipedia.org/wiki/Formalized_Music)
- **Comunidad de live coding**: foros, Discord, GitHub, repositorios públicos.

---
## Live Coding con Supercollider

[![Live coding con Supercollider](https://img.youtube.com/vi/09o9IUanLng/maxresdefault.jpg)](https://www.youtube.com/watch?v=09o9IUanLng)
