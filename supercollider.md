# Introducción a SuperCollider: concepto, arquitectura, sintaxis y aplicaciones

> «SuperCollider es un entorno y lenguaje de programación de audio para síntesis en tiempo real y composición algorítmica». — James McCartney

> «SuperCollider es un marco para la investigación acústica, la música algorítmica, la programación interactiva y el 'live coding'».

---

## ¿Qué es SuperCollider?

**SuperCollider** es un entorno y lenguaje de programación de audio de código abierto, diseñado para:

- **Síntesis de audio en tiempo real**.
- **Procesamiento digital de señales (DSP)**.
- **Composición algorítmica**.
- **Performance en vivo (live coding)**.
- **Investigación acústica y musical**.

Fue creado originalmente en **1996 por James McCartney** y, desde entonces, ha evolucionado hasta convertirse en una de las herramientas más potentes y flexibles para música electrónica, arte sonoro y investigación en computación musical.

Características principales:

| Característica | Descripción |
|---|---|
| **Tiempo real** | Síntesis y procesamiento con baja latencia. |
| **Lenguaje dinámico** | Tipado dinámico, orientado a objetos, interactivo. |
| **Código abierto** | GPL-3.0 a partir de la versión 3.4; comunidad activa. |
| **Multiplataforma** | Linux, macOS, Windows. |
| **Extensible** | UGens (unit generators) personalizados en C++. |
| **Live coding** | Ideal para programación en vivo y performances. |

SuperCollider no es solo un sintetizador: es un **lenguaje completo** para describir sonidos, estructuras temporales, patrones rítmicos y sistemas interactivos.

---

## Contexto histórico y conceptual

### Antecedentes en la computación musical

SuperCollider hereda ideas y diseños de:

- **MUSIC I–V** (Max Mathews, Barry Vercoe): primeros lenguajes de síntesis por software.
- **CSound** (Barry Vercoe): lenguaje de descripción de instrumentos + partitura.
- **MIDI** (1983): protocolo de comunicación musical digital.
- **Max/MSP y Pure Data**: programación visual por objetos.

SuperCollider se distingue por:

- Ser **textual** (no visual), pero muy conciso.
- Tener un **motor de tiempo real integrado**.
- Permitir **cambio de código en vivo** sin detener el audio.
- Ofrecer **Patrones (Patterns)** para secuencias rítmicas y armónicas.

### Filosofía de diseño

SuperCollider está diseñado para:

- **Exploración sonora**: experimentar con síntesis, efectos, estructuras.
- **Composición algorítmica**: generar música mediante reglas, azar, algoritmos.
- **Interactividad**: responder a MIDI, OSC, sensores, red.
- **Live coding**: escribir y modificar código durante la performance.

La filosofía es:

> «El sonido es código, y el código es sonido».

---

## Arquitectura de SuperCollider

SuperCollider tiene dos componentes principales:

1. **El lenguaje (sclang)**: el intérprete y entorno de programación.
2. **El servidor de audio (scsynth)**: el motor de síntesis en tiempo real.

### 1. El lenguaje (sclang)

-corre en la **computadora del usuario**.
- Es un **intérprete interactivo** (como una consola REPL).
- Se usa para:
  - Escribir código.
  - Controlar el servidor de audio.
  - Manejar entradas/salidas (MIDI, OSC, archivos).
  - Crear estructuras de alto nivel (Patrones, GUI, recursos).

El lenguaje se ejecuta en un proceso llamado **sclang** (SuperCollider language).

### 2. El servidor de audio (scsynth)

- Es el **motor de síntesis** que genera el sonido.
- Se ejecuta como un proceso separado (**scsynth**).
- Puede estar:
  - En la misma máquina (local).
  - En otra máquina (remoto, por red).
- Recibe comandos del lenguaje mediante **protocolo OSC** (Open Sound Control).
- Gestiona:
  - ** yardımci (synth)**: instancias de síntesis.
  - **Nodes**: estructura jerárquica de sonidos (synths, buses, groups).
  - **Buses**: canales de audio y control para señales.
  - **UGens**: unidades generadoras de sonido (osciladores, filtros, efectos, etc.).

### Relación lenguaje–servidor

El flujo típico es:

1. El **lenguaje** crea y controla **synths**.
2. Los **synths** se ejecutan en el **servidor**.
3. El **servidor** envía audio a la salida de sonido.
4. El **lenguaje** puede modificar los synths en tiempo real.

Ejemplo conceptual:

```supercollider
// El lenguaje envía comandos al servidor
{ Sinewave.ar(440) }.play;
//        ↑                   ↑
//  lenguaje (sclang)    servidor (scsynth)
```

### Nodes, Buses y UGens

#### Nodes (nodos)

Los **nodes** son la estructura jerárquica de sonido en el servidor:

- **Synth**: instancia de un bosque de UGens (un «instrumento»).
- **Group**: grupo de synths u otros groups.
- **Bus**: canal de audio o control.

Los nodes se organizan en un árbol:

```text
server
 └─ Group principal
      ├─ Group «batería»
      │    ├─ Synth (kick)
      │    └─ Synth (snare)
      └─ Group «bajo»
           └─ Synth (bajo)
```

Se pueden:

- Agregar, quitar, mover nodes.
- Controlar parámetros de synths individualmente o por grupo.

#### Buses (buses)

Los **buses** son canales de audio y control:

- **Audio-rate buses**: para señales de audio.
- **Control-rate buses**: para valores de control (menos rápidos).

Se usan para:

- Enviar señales entre UGens.
- Compartir señales entre synths.
- Aplicar efectos en bus (reverb, delay global).

Ejemplo conceptual:

```supercollider
// Bus de audio
var bus = Bus.audio(s, 2); // 2 canales (estéreo)
```

#### UGens (unit generators)

Los **UGens** son las unidades básicas de síntesis y procesamiento:

- Osciladores: `SinOsc`, `LFRect`, `LFSaw`.
- Generadores de ruido: `WhiteNoise`, `PinkNoise`.
- Filtros: `RLPF`, `RLPF`, ` damages`.
- Efectos: `Reverb`, `Delay`, `Distortion`.
- Envolventes: `EnvGen`, `Line`, `Lag`.
- Operaciones: `Sum`, `Mul`, `Clip`, `Wrap`.

Cada UGen tiene:

- **Entradas**: argumentos (frecuencia, ganancia, etc.).
- **Salidas**: señales de audio o control.

Ejemplo:

```supercollider
SinOsc.ar(440, 0, 0.2)
// ↑          ↑  ↑  ↑
// UGen     freq  fase  amplitud
```

---

## Instalación y entorno de trabajo

### Instalación

1. Descargar desde: https://supercollider.github.io/
2. Instalar según el sistema operativo:
   - **macOS**: instalador .pkg.
   - **Linux**: paquetes en repositorios (Ubuntu, Fedora, etc.) o construir desde fuente.
   - **Windows**: instalador .exe.
3. Abrir **SuperCollider IDE** (aplicación principal).

### IDE de SuperCollider

El IDE incluye:

- **Editor de código**: con resaltado de sintaxis.
- **Post window**: consola de salida (logs, resultados).
- **Help browser**: documentación integrada.
- **Repl interactivo**: evaluación de código en tiempo real.

Atajos útiles:

- `Ctrl+Enter` (o `Cmd+Return` en macOS): ejecutar línea seleccionada.
- `Ctrl+Shift+B`: arranque/parada del servidor de audio.
- `Ctrl+Shift+P`: buscar ayuda.

### Arrancar el servidor

```supercollider
s.boot;  // Arrancar servidor de audio
s.quit;  // Detener servidor
```

Cuando el servidor está activo, puedes ejecutar síntesis en tiempo real.

---

## Sintaxis básica del lenguaje

SuperCollider tiene una sintaxis similar a Smalltalk, con algunas particularidades.

### 1. Comentarios

```supercollider
// Comentario de una línea

/*
  Comentario
  de varias
  líneas
*/
```

### 2. Asignación de variables

```supercollider
var x;          // declaración
x = 42;         // asignación

var freq = 440; // declaración y asignación
var amp = 0.2;
```

Variables locales empiezan con `var`.

### 3. Funciones (blocks)

Las funciones se escriben entre llaves `{}`:

```supercollider
{
  SinOsc.ar(440, 0, 0.2)
}
```

- Se pueden pasar como argumentos.
- Se pueden evaluar con `.play`, `.value`, `.trace`, etc.

### 4. Evaluación y ejecución

```supercollider
{ SinOsc.ar(440, 0, 0.2) }.play;
// ↑ función            ↑ ejecuta en el servidor
```

- `.play` envía la función al servidor como un synth.
- `.value` evalúa la función en el lenguaje (sin audio).

### 5. Argumentos de funciones

```supercollider
{ arg freq = 440, amp = 0.2;
  SinOsc.ar(freq, 0, amp)
}.play;
```

- `arg` define argumentos con valores por defecto.
- Se pueden pasar al crear el synth.

### 6. Colecciones: listas, arreglos, diccionarios

**Listas (arreglos):**

```supercollider
  // lista de frecuencias
.sum   // métodos sobre listas[1][2][3][4][5]
```

**Diccionarios:**

```supercollider
\freq -> 440,
\amp -> 0.2,
\pan -> 0
)
```

Se accede con:

```supercollider
d[\freq]
```

### 7. Mensajes y métodos

En SuperCollider, se envían **mensajes** a objetos:

```supercollider
440 * 2        // mensaje * a 440
.sum  // mensaje sum a la lista[2][3][1]
```

Mensajes comunes:

- `.play`: enviar al servidor.
- `.free`: liberar synth.
- `.trace`: imprimir valor en post window.
- `.poll`: enviar valor continuamente al lenguaje.

---

## Síntesis de audio básica

### 1. Osciladores básicos

#### SinOsc (onda sinusoidal)

```supercollider
{ SinOsc.ar(440, 0, 0.2) }.play;
```

- `440`: frecuencia en Hz.
- `0`: fase.
- `0.2`: amplitud (ganancia).

#### LFSaw (diente de sierra)

```supercollider
{ LFSaw.ar(220, 0, 0.2) }.play;
```

#### LFRect (onda rectangular)

```supercollider
{ LFRect.ar(110, 0, 0.15) }.play;
```

### 2. Mezcla de osciladores

```supercollider
{
  var osc1 = SinOsc.ar(440, 0, 0.1);
  var osc2 = SinOsc.ar(442, 0, 0.1); // ligero desajuste
  (osc1 + osc2) * 0.5
}.play;
```

### 3. Modulación de frecuencia (FM)

```supercollider
{
  var mod = SinOsc.ar(5, 0, 100); // modulador a 5 Hz, ±100 Hz
  var carrier = SinOsc.ar(440 + mod, 0, 0.2);
  carrier
}.play;
```

### 4. Envolventes (envelopes)

Para evitar clicks, se usan envolventes de amplitud:

```supercollider
{
  var env = EnvGen.ar(
    Env.perc(0.01, 0.3), // ataque 0.01 s, decaimiento 0.3 s
    gate: 1
  );
  var osc = SinOsc.ar(440, 0, 0.3);
  osc * env
}.play;
```

Env comunes:

- `Env.perc(ataque, decaimiento)`: percusión.
- `Env.sine`: envolvente sinusoidal.
- `Env.asr(ataque, sustain, release)`: attack-sustain-release.

### 5. Filtros

```supercollider
{
  var osc = LFSaw.ar(220, 0, 0.3);
  var filter = RLPF.ar(osc, 800, 1, 0.2); // resonante bajo paso
  filter
}.play;
```

- `RLPF`: bajo paso resonante.
- `RP HP`: alto paso resonante.
- Tercer argumento: resonancia (Q).
- Cuarto: ganancia.

### 6. Efectos básicos

#### Delay

```supercollider
{
  var src = SinOsc.ar(440, 0, 0.2);
  var delay = DelayN.ar(src, 0.2, 0.15); // max 0.2 s, delay 0.15 s
  (src + delay) * 0.5
}.play;
```

#### Reverb

```supercollider
{
  var src = SinOsc.ar(440, 0, 0.2);
  var rev = FreeVerb.ar(src, 0.5, 0.8, 0.5);
  rev
}.play;
```

- `FreeVerb`: reverb simple con mix, dry/wet.

#### Distorsión

```supercollider
{
  var osc = LFSaw.ar(110, 0, 0.3);
  var dist = clip2(osc * 2); // soft clipping
  dist
}.play;
```

---

## Control en tiempo real y parámetros

### 1. Control de parámetros de synth

Se pueden controlar parámetros de un synth en tiempo real:

```supercollider
// Crear synth con argumentos
x = { arg freq = 440, amp = 0.2;
  SinOsc.ar(freq, 0, amp)
}.play;

// Cambiar frecuencia
x.set(\freq, 660);

// Cambiar amplitud
x.set(\amp, 0.1);

// Liberar synth
x.free;
```

### 2. Buses de control

Para compartir control entre synths:

```supercollider
var bus = Bus.control(s, 1);

// Sintetizador 1
{
  var freq = Line.kr(220, 880, 2); // línea de 2 s
  Bus.set(bus, freq);
  SinOsc.ar(freq, 0, 0.2)
}.play;

// Sintetizador 2 que usa el mismo bus
{
  var freq = Bus.get(bus);
  SinOsc.ar(freq, 0, 0.1)
}.play;
```

### 3. Ligero (Lag) y suavizado

Para suavizar cambios bruscos:

```supercollider
{
  var env = EnvGen.ar(Env.perc(0.01, 0.5));
  var lag = Lag.kr(env, 0.1); // suavizado de 0.1 s
  SinOsc.ar(440 * lag, 0, 0.2)
}.play;
```

---

## Patrones (Patterns) y secuenciación

SuperCollider tiene un sistema de **Patrones** poderoso para secuencias rítmicas y armónicas.

### 1. Concepto de Pattern

Un **Pattern** es una descripción de una secuencia de valores que se generan en tiempo real cuando se iteran.

Se usan principalmente con:

- `Pbind`: secuenciador de eventos.
- `Pseq`, `Prand`, `Pwhite`: generadores de secuencias.
- `Ppar`: patrones en paralelo.

### 2. Pbind básico

```supercollider
(
Pbind(
  \instrument, \default,
  \note, Pseq(, inf),  // notas MIDI
  \dur, 0.25                           // duración en beats
).play;
)
```

- `\instrument`: instrumento a usar (por defecto `\default`).
- `\note`: nota en MIDI (60 = C4).
- `\dur`: duración en beats.

### 3. Patrones rítmicos

```supercollider
(
Pbind(
  \instrument, \default,
  \note, Pseq(, inf),
  \dur, Pseq([0.25, 0.25, 0.5, 0.25, 0.25, 0.5, inf], inf)
).play;
)
```

### 4. Patrones aleatorios

```supercollider
(
Pbind(
  \instrument, \default,
  \note, Prand(, inf),
  \dur, 0.25
).play;
)
```

### 5. Patrones en paralelo

```supercollider
(
Ppar([
  Pbind(\instrument, \default, \note, Pseq(, inf), \dur, 0.5),
  Pbind(\instrument, \default, \note, Pseq(, inf), \dur, 0.25)
]).play;
)
```

### 6. Integración con TidalCycles

TidalCycles es un sistema de live coding de patrones rítmicos basado en Haskell, que usa **SuperCollider como backend**. Muestra cómo SuperCollider puede ser el motor de sonido de otros sistemas de live coding.

---

## Interacción: MIDI, OSC, sensores

### 1. MIDI

SuperCollider puede recibir y enviar eventos MIDI:

```supercollider
// Escuchar MIDI
MIDIdef.noteOn(\midiNote, { |vel, note, chan, src|
  postf("Nota: ", note, " Velocidad: ", vel, "\n");
});
```

Se pueden mapear notas MIDI a parámetros de synth:

```supercollider
// Ejemplo conceptual: nota MIDI → frecuencia
freq = noteNumber.transform(midiToFreq);
```

### 2. OSC (Open Sound Control)

OSC es un protocolo para comunicación entre aplicaciones:

- De otros programas a SuperCollider.
- De SuperCollider a otros programas.

Ejemplo: recibir OSC:

```supercollider
OSCdef(\msg, { |msg|
  postf("OSC: ", msg, "\n");
}, \/note);
```

Enviar OSC:

```supercollider
OSCmsg(\'/note\', [60, 1.0]);
```

### 3. Sensores y hardware

SuperCollider puede:

- Leer datos de sensores vía Arduino + OSC.
- Usar cámaras y procesar video con外衣 (exterior).
- Integrarse con Max/MSP, Pure Data, TouchDesigner.

---

## Aplicaciones generales de SuperCollider

### 1. Música electrónica y live coding

- Creación de:
  - Techno, IDM, ambient, noise, experimental.
  - Patrones rítmicos, secuencias, improvisación.
- Live coding:
  - Cambiar patrones, efectos, estructuras en vivo.
  - Algoraves, performances en escena.

### 2. Composición algorítmica

- Generar música mediante:
  - Reglas, algoritmos, autómatas celulares.
  - Procesos estocásticos, teoría de conjuntos.
  - IA/ML (integrado con Python, TensorFlow, etc.).

### 3. Investigación acústica y sonora

- Experimentación con:
  - Síntesis granular, espectral, FM, AM.
  - Espacialización, binaural, ambisonics.
  - Análisis espectral, modelado físico.

### 4. Arte sonoro e instalaciones

- Instalaciones interactivas:
  - Sensores, sensores de movimiento, cámaras.
  - Sonido generativo que cambia con el tiempo/ambiente.
- Obras sonoras en espacios públicos.

### 5. Educación

- Enseñanza de:
  - Programación musical.
  - Síntesis de audio.
  - Teoría musical y algoritmos.
- Herramienta para:
  - Talleres de computación musical.
  - Cursos de DSP, acústica, música electrónica.

### 6. Integración con otras herramientas

- **DAWs**: vía JACK, PulseAudio, ALSA, CoreAudio.
- **Max/MSP, Pure Data**: comunicación por OSC.
- **Python, R, Julia**: integración para ML, análisis de datos.
- **Visual**: Processing, openFrameworks, Blender + Python.

---

## Ejemplos prácticos completos

### 1. Instrumento simple con envolvente

```supercollider
(
SynthDef(\sinePerc, { arg freq = 440, amp = 0.3, dur = 0.3;
  var env = EnvGen.ar(Env.perc(0.01, dur), amp, doneAction: 2);
  var osc = SinOsc.ar(freq, 0, 1);
  osc * env
}).add;
)

// Usar
x = Synth(\sinePerc, [\freq, 660, \dur, 0.5]);
```

### 2. Batería simple con Pattern

```supercollider
(
SynthDef(\bd, {
  var env = EnvGen.ar(Env.perc(0.01, 0.3), doneAction: 2);
  var freq = Line.kr(150, 40, 0.3);
  var osc = SinOsc.ar(freq, 0, 1);
  osc * env * 0.8
}).add;

SynthDef(\sn, {
  var env = EnvGen.ar(Env.perc(0.01, 0.15), doneAction: 2);
  var noise = WhiteNoise.ar(1);
  var filter = BPF.ar(noise, 1000, 1);
  filter * env * 0.6
}).add;
)

(
Pbind(
  \instrument, \bd,
  \note, Pseq(, inf),
  \dur, 0.5
).play;

Pbind(
  \instrument, \sn,
  \note, Pseq(, inf),
  \dur, 0.25
).play;
)
```

### 3. Live coding con cambios en tiempo real

```supercollider
// Iniciar patrón
p = Pbind(
  \instrument, \default,
  \note, Pseq(, inf),
  \dur, 0.25
).play;

// Cambiar en vivo
p.set(\note, Pseq(, inf));
p.set(\dur, 0.125);

// Detener
p.stop;
```

---

## Recursos y comunidad

- **Sitio oficial**: https://supercollider.github.io/
- **Documentación**: ayuda integrada en el IDE (`Help` → `Search`).
- **Foros y comunidades**:
  - SuperCollider mailing list.
  - Discord, Reddit, GitHub.
- **Repositorios**:
  - Quarks (paquetes): https://github.com/supercollider/quarks
- **Tutoriales**:
  - Help integrados en el IDE.
  - Tutoriales en YouTube, blogs, cursos.

---

> «SuperCollider es un laboratorio sonoro donde el código es el instrumento y la performance es la experiencia».