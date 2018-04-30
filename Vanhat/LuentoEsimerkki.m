M =32;
k =0: M /2 -1;
% Reaaliset taajuusnaytteet M:n pituiselle FIR-suodattimelle ¨
% Indekseissa otettu huomioon Matlabin indeksointi 1 l ¨ ahtien ¨
Hr =zeros(size(k ));
Hr (0+1)=1;
Hr (1+1)=1;
Hr (2+1)=1;
Hr (3+1)=0.5;
% Proakis taulukon 8.3 (4th ed. 10.3) mukaan
G =( -1).^k .* Hr ;
G(M -k +1)= - G(k +1);
% Taajuusvaste saman taulukon mukaan
H=G .*exp(1i*pi*(0: M )/ M );
% Taajuusnaytteistysmenetelm ¨ an kertoimet A(k) ¨
% Otetaan vain reaaliosa, laskennassa saattaa tulla
% pienia imaginaariosia mukaan ¨
A_l=H(k +2)+ H(M -k );
A_l=real(A_l)
% Taajuusnaytteistysmenetelm ¨ an kertoimet B(k) ¨
B_l=H(k +2).*exp(-1i *2*pi*k /32)+ H(M -k ).*exp(1i *2*pi*k /32);
B_l=real(B_l)
h =[];
for n =0: M/2 -1
h(n +1)=1/ M *( G (0+1)+2*sum(G(k +2).*cos((2*pi*( k +1)/ M )*( n +0.5))));
end
% Taydennet ¨ a¨an M:n pituiseksi symmetriseksi ¨
h =[ h h(length(h ): -1:1)]
% Tarkistetaan, etta taajuusvaste todellakin on sellainen kuin ¨
% on haluttu. freqz antaa taajuusvasteen valill ¨ a 0...pi, joten ¨
% otetaan M/2 naytett ¨ a.¨
[ Hcheck , wcheck ]=freqz(h ,1 ,M /2);
abs( Hcheck )
% Otetaan viela tihe ¨ amm ¨ all ¨ a jaolla, jotta voidaan piirt ¨ a¨a¨
% tarkempi taajuusvaste
[Hoo ,w ]=freqz(h ,1);
figure(1) , plot(w ,abs( Hoo ))
figure(2) , plot(w ,angle( Hoo ))