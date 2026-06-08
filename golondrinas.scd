//////////////////////////////////////////////////////
// LIVE CODING: PROGRAMAR EL PRESENTE              //
// Espacio "Las Golondrinas" - Fundacion Balseiro //
///////////////////////////////////////////////////

// Prof. Luis Tamagnini - Escuela de Música - FHUMyAr - UNR
// 2026


s.boot;         // server

s.makeWindow;
s.scope;

// para parar la ejecución de un sonido: cmd + . (MAC) / cntrl + . (PC)

/////////////
// posible error
play({SinOsc.ar(LFNoise0.kr(12, mul: 600, add: 1000), 0, 0.5)})
{SinOsc.ar(LFNoise0.kr(12, mul: 600, add: 1000), 0, 0.5)}.play
/////////////
// parámetros
// síntesis sustractiva: generador de impulsos pasado por un filtro pasa bajos
play({RLPF.ar(Dust.ar([12, 15]), LFNoise1.ar(1/[3, 4], 1500, 1600), 0.02)})


7!5

scope({   RLPF.ar(Saw.ar(100,0.5),MouseX.kr(20,5000),MouseY.kr(0.001,1))*Env.perc(0.01,5).ar(2,Impulse.kr(1))             } )


SynthDef(\triggerSaw,{
	arg out = 0,freq=200;
	var s=RLPF.ar(Saw.ar([freq,freq*1.01],0.5),MouseX.kr(20,5000),MouseY.kr(0.001,1))*Env.perc(0.01,5).ar(2,Impulse.kr(1));
	Out.ar(out,s)
}).add


s.freqscope

Synth(\sonido,[\freq,333.rand,\release,5.0.rand,\out,0])


x = Synth(\triggerSaw)
~patten1 = Synth(\triggerSaw)

Task
x.set(\freq, [60,62,64,67,69].choose.midicps  )

(
t = Task({
    50.do({ arg i;
        i.squared.postln;
		~patten1.set(\freq, [60,62,64,67,69].choose.midicps  );
		0.5.wait;
    });
});
)

t.start;
t.pause;
t.resume;
t.reset;
t.stop;


[29,48,36].sum




{  SinOsc.ar( {50+1000.rand.postln}!22,0,0.05).sum * Env.perc.ar(2) !2 }.play

{  Splay.ar( SinOsc.ar( {50+1000.rand.postln}!22,0,0.05)) * Env.perc.ar(2)  }.play




5 * s.sampleRate


b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");

b = Buffer.readChannel(s,Platform.resourceDir +/+ "sounds/a11wlk01.wav",);


b.play

BufRd


{ BufRd.ar(1, b, LFSaw.ar( BufDur.ir(b).reciprocal * MouseX.kr).range(0, BufFrames.ir(b))* -1 ) }.play;

{ BufRd.ar(1, b, SinOsc.ar(0.1) * BufFrames.ir(b)) }.play;



{  FreeVerb.ar( GrainBuf.ar(1,Impulse.ar(30),sndbuf:b,dur:MouseX.kr(0.001,1),pos:MouseY.kr(0,1)),0.33,0.3,0.5 )}.play


{  FreeVerb.ar( GrainBuf.ar(1,Impulse.ar(30),sndbuf:b,dur:MouseX.kr(0.001,1),pos:MouseY.kr(0,1)) )}.play

{  CombC.ar( GrainBuf.ar(1,Impulse.ar(30),sndbuf:b,dur:MouseX.kr(0.001,1),pos:MouseY.kr(0,1)) ,0.2,0.1,20)}.play


///////////// ejemplo de síntesis aditiva

play({
	var sines = 10, freq = 60, speed = 6;
	Mix.fill(sines,
		{arg x;
			Pan2.ar(
				SinOsc.ar(x+1*freq,
					mul: max(0,
						LFNoise1.kr(speed) +
						Line.kr(1, -1, 30)
					)
				), rand2(1.0))})/sines})

/////////////
// mensajes y argumentos

rand(100)

exprand(1.0, 100.0)

thisThread.randSeed = 676; {rand(10.0)} ! 10;

dup("echo", 20)

round([3.141, 5.9265, 358.98], 0.01)

sort([23, 54, 678, 1, 21, 91, 34, 78])

round(dup({exprand(1, 10)}, 100), 0.1)

sort(round(dup({exprand(1, 10)}, 100), 0.1))


/////////////
// anidado o "nesting"

                            exprand(1.0, 1000.0)
                   dup({exprand(1.0, 1000.0)}, 100)
           sort(dup({exprand(1.0, 1000.0)}, 100))
round(sort(dup({exprand(1.0, 1000.0)}, 100)), 0.01)

///////////// anidado en una función de audio

(
play(
	{
		CombN.ar(
			SinOsc.ar(
				midicps(
					LFNoise1.ar(3, 24,
						LFSaw.ar([5, 5.123], 0, 3, 80)
					)
				),
				0, 0.4),
			1, 0.3, 2)
	}
)
)

// RECEIVER (RECEPTOR U OBJETO)


/////////////

[45, 13, 10, 498, 78].sort  // notacion "receiver"
sort([45, 13, 10, 498, 78]) // ntacion "funcional"

"echo".dup(20)

50.midicps

444.cpsmidi

100.rand

{100.rand}.dup(50)

[1.001, 45.827, 187.18].round(0.1)




//TRUE OOP!
/////////////

1000.0 // un número

1000.0.rand

1000.0.rand.round(0.01)

1000.0.rand.round(0.01).post

{1000.0.rand.round(0.01).postln}.dup(100).plot

{1000.0.rand.round(0.01).postln}.dup(100).postln.sort.plot

//Mac only
1000.0.rand.round(0.01).postln.asString.speak


// "enclosure"
// "" () [] {}

5 + 10 * 4
5 + (10 * 4) // parentesis para forzar precedencia
5+10.squared
(5+10).squared

// los [] agrupan una "collección de elementos o "intems" en lo que
// llamamos un ARRAY, que es un tipo de colección
// estas pueden tener cualquier cantidad de items de un mismo tipo o diferente
// pueden recibir mensajes y operar en funcion de ellos
// tambien se pueden realizar operaciones matematicas

[0, 11, 10, 1, 9, 8, 2, 3, 7, 4, 6, 5].reverse // retrogradación dse una serie

12 - [0, 11, 10, 1, 9, 8, 2, 3, 7, 4, 6, 5].reverse // retrogradación e inversión

[0, 2, 4, 5, 6, 7, 9, 11].scramble // escala diatónica

[60, 62, 64, 67, 69].mirror // pentatonica

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].rotate

[60, 62, 64, 65, 67, 69, 71].midicps.round(0.1) // midi a frequencia en Hz

[1, 0.75, 0.5, 0.25, 0.125].choose // posibles duraciones

0.125 * [1, 2, 3, 4, 5, 6, 7, 8].choose

[1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11].permute(6)

/////////////
// las {} llaves o "curly brackets" definen FUNCIONES, estas ejecutan tareas
// especificas que usualmente son repetidas cientos o miles de veces

exprand(1, 1000.0)

{exprand(1, 1000.0)}

dup(rand(1000.0), 5)  // elige un número, lo replica

dup({rand(1000.0)}, 5)  // replica la función de elegir un número

// idem anterior
[rand(1000.0), rand(1000.0), rand(1000.0), rand(1000.0), rand(1000.0)]

/////////////
// las funciones tambien responden a una serie de mensajes como
// play, plot, scope, dup, etc

{LFNoise0.ar}.play  //ejecuta en el server un generador de números aleatorios

{LFNoise0.ar(10000)}.plot // dibuja una curva a partir de la funcion

{LFNoise0.ar(10000)}.scope // ejecuta en server y muestra osciloscopio

{100.rand}.dup(10) // elige 10 números aleatorios

{100.rand} ! 10 // idem

{100.rand}.dup(10).postln.plot // elige 10 numeros, informa y dibuja curva

{100.rand}.dup(100).sort.plot // elige 100 numeros, ordena y dibuja curva
//////////////////////////////////////////////////////////////////////////

// repaso de elementos de lenguaje y sintaxis
// objeto o receiver, mensajes y argumentos
objeto.mensaje(arg1,arg1,etc)
// funciones
{generalmente muchas lineas de código}
// colecciones
[lista de cosas]
// Strings o texto
"texto entre comillas"
// símbolos
'palabra_entre_comillas_simples' o \palabra_precedida_por_backslash

/////////////
// MULTICHANNEL EXPANSION (expansión multicanal)
// si un Array es usado como argumento en una UGen el patch es duplicado
// y la señal resultante es automaticamente asignada a canales contiguos de salida

{SinOsc.ar([200,202],0,0.2)}.play

{Blip.ar(25, LFNoise0.kr(5, 12, 14), 0.3)}.play // un canal

{Blip.ar(25, LFNoise0.kr([5, 10], 12, 14), 0.3)}.play // stereo

{Blip.ar(25, LFNoise0.kr([5, 10, 2, 25], 12, 14), 0.3)}.play // quad

{Blip.ar(25, LFNoise0.kr([5, 4, 7, 9, 5, 1, 9, 2], 12, 14), 0.3)}.play // 8

/////////////

{PMOsc.ar(440, 550, 7)}.play // par de osciladores en modulacion de fase

{PMOsc.ar(440, MouseY.kr(1, 550), MouseX.kr(1, 15))}.play

{PMOsc.ar(100, 500, 10, 0, 0.5)}.play // argumentos listados en orden

{PMOsc.ar(carfreq: 100, modfreq: 500, pmindex: 10, mul: 0.5)}.play // keywords

{PMOsc.ar(carfreq: 100, mul: 0.5, pmindex: 10, modfreq: 500)}.play // mix

{SinOsc.ar(mul: MouseX.kr(0, 1.0))}.scope

///////////// VCO, VCF, VCA

(
{
	Blip.ar(
		TRand.kr( // frequencia o VCO
			100, 1000, // rango
			Impulse.kr(Line.kr(1, 20, 60))), // trigger
		TRand.kr( // numero de armonicos o VCF
			1, 10, // rango
			Impulse.kr(Line.kr(1, 20, 60))), // trigger
		Linen.kr( // mul, o amplitud, VCA
			Impulse.kr(Line.kr(1, 20, 60)), // trigger
			0, // ataque
			0.5, // sustain
			1/Line.kr(1, 20, 60)) // trigger
		)
}.play
)

/////////////
// VARIABLES

(
a = 440;
b = 3;
c = "math operations";
[c, a, b, a*b, a + b, a.pow(b), a.mod(b)]
)

// idem
["math operations", 440, 3, 440*3, 440 + 3, 440.pow(3), 440.mod(3)]

/////////////

(
{
r = MouseX.kr(1/3, 10);
SinOsc.ar(mul: Linen.kr(Impulse.kr(r), 0, 1, 1/r))
}.play
)

///////////// síntesis utilizando variables y sentencias

(
// primero ejecutar
p = { // p igual a la funcion...
r = Line.kr(1, 20, 60); // rate
// r = LFTri.kr(1/10) * 3 + 7;
t = Impulse.kr(r); // trigger
// t = Dust.kr(r);
e = Linen.kr(t, 0, 0.5, 1/r); // envolvente usando r and t
f = TRand.kr(1, 10, t); // trigger random usando t
// f = e + 1 * 4;
Blip.ar(f*100, f, e) // f, y e usedos en Blip
}.play
)

p.free;  // stop