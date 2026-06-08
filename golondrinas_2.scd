 s.boot


ProxySpace

p = ProxySpace.push;


p.makeTempoClock(  124/60 );
p.quant=0;



~pattern.play

~pattern.quant=1


p.push


~grain.play

p.gui


b = Buffer.read(s, Platform.resourceDir +/+ "sounds/a11wlk01.wav");

~grain = { GrainBuf.ar(1,Dust.ar(10),sndbuf:b,dur:MouseX.kr(0.001,1),pos:MouseY.kr(0,1))}

~grain.fadeTime=5
~grain.quant=0

~grain.play


~pattern=Pbind(
	\note, Pwrap(Pwhite(34, 88), 1, 20).round(2),
	\dur, 0.5
);



o = ServerOptions.new;
o.memSize = 2**18;
s.options = o;
s.boot


SynthDef( \fmPiano, {
	|out = 0, freq = 200, amp = 1,attack = 0.01, release = 3|
	var s = SinOsc.ar([freq,freq],0,amp) * Env.perc(attack,release).ar(2);
	Out.ar(out,s)
} ).add

SynthDef( \fmPerc, {
	|out = 0, freq = 200, amp = 1,attack = 0.01, release = 3|
	var e,s;
	e = Env.perc(attack,release);
	s =  RLPF.ar(SinOsc.ar([freq,freq]+SinOsc.ar(1234,0,111111),0,amp),
		900 * e.ar(0,timeScale:(attack+release)),
		0.3)  * e.ar(2);
	Out.ar(out,s)
} ).add


s.scope

~pattern= Pbind(
	\instrument,Prand([\fmPiano,\fmPerc],inf),
	// \midinote, Pwrand([48,50,52,55,57,60]+12,[1,1,2,2,3,4].normalizeSum,inf),
	\midinote, Pexprand(20,90),
	\dur, Prand([1,1,2],inf),
	// \release,0.5
	\release,Pseq([0.5,1,0.2,3],inf),
	\attack, Pexprand(0.001,0.5),
	\amp,Pseq([0.5,0.35,0.35],inf)
);

~pattern.fadeTime = 2

~pattern.play

~pattern.end(10)

~pattern=Pbind(
);







p.clock.tempo_(8)

p.gui




p.clock.tempo_(1.17);
x={exprand(1,1111111)}!3;
y={exprand(3,33033)}!4;
r=1.0!4;
2.do({r=f.at(\rand).value(r)});


r=f.at(\golden).value(r)

~track_1.quant=1;

(
~track_1={
	var e,t,f,m,i;
	e=Env.perc;

	t=TDuty.ar( Drand(r/~tempo.kr,inf),0);

	f=Demand.ar(t,0,Dseq([99],inf));

	i=Demand.ar(t,0,Dseq(x,inf));
	m=Demand.ar(t,0,Dseq(y,inf));

	MoogVCF.ar(SinOsc.ar([f,f+111]+SinOsc.ar(m,0,i))*e.ar(0,t,Demand.ar(t,0,Dseq(r*0.3,inf))),2094+20,0)*0.35};
)
~track_1.play;

~track_1.rebuild;


bosca.music@gmail.com