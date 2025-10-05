clear;

Tsoll = 25;%Gewünschte Raumtemperatur  
Taussen = 10;%Außentemperatur als Störgröße
Th = 0.0014; %Verzoegerung bis Heizung da ist (ca. 5 Sekunden in Stunden)
F = 200;%Volumenstrom
Fl = 300;%Volumenstrom Luft von außen
p = 1.225;%Dichte von der Luft
cp = 1.005;%spezifische Wärmekapazität
Vr = 50; %Volumen Raum
Vh = 5; %Volumen Heizung
T1 = Vh/F;
T2 = Vr/F;
Ks = 1/(F*p*cp);
s = tf('s');
Td=44;
T1r=(Td/10);
Kp=1;

PT1=Ks/(1+Th*s);
PT2=1/(s*(T1*T2*s+T1+T2));
Gs=PT1*PT2;

figure(1);
pzmap(Gs);

Gr=Kp*((1+Td*s)/(1+T1r*s));


Go = Gs*Gr;
figure(2);
bode(Go);