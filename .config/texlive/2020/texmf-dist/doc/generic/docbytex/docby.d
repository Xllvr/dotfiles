
%% DocBy.\TeX{} -- n�stroj na dokumentov�n� zdrojov�ch k�d�

\def\projectversion{\dbtversion}
\def\headtitle{DocBy.\TeX}

\showboxbreadth=1500 \showboxdepth=2

\chyph
\input docby.tex

\title DocBy.\TeX{} -- n�stroj na dokumentov�n� zdrojov�ch k�d�

\author Petr Ol��k

\centerline{\ulink[http://www.olsak.net/docbytex.html]%
                         {www.olsak.net/docbytex.html}}

\def\db{\dg\nb}
\def\du#1{\api{\nb#1}}
\let\quotehook=\langleactive
\def\insdef#1 {\ifirst{docby.tex}{def\nb#1 }{^^B\cbrace}{++}}
\def\inssdef#1 {\ifirst{docby.tex}{def\nb#1}{\empty}{+-}}
\bgroup
   \catcode`\[=1 \catcode`]=2 \catcode`\{=12 \catcode`\}=12
   \gdef\obrace[{] \gdef\cbrace[}]
\egroup
\def\indexhook{Kontroln� sekvence ozna�en� �ipkou ($\succ$) jsou
   u�ivatelsk�mi p��kazy. Ostatn� kontroln� sekvence jsou 
   v~DocBy.\TeX{}u intern�. Tu�n� je ozna�ena strana, kde je slovo
   dokumentov�no, pak n�sleduje seznam stran s v�skyty slova.
   U�ivatelsk� p��kazy maj� v seznamu str�nek podtr�en� ��slo, 
   co� je str�nka, kde je p��kaz vylo�en na u�ivatelsk� �rovni. 
   \medskip}
\def\nn#1 {\noactive{\nb#1}} \nn insert \nn undefined

\def\cnvbookmark#1{\lowercase{\lowercase{#1}}}
\def\bookmarkshook{\lo �e \lo �s \lo �c \lo �r \lo �z \lo �y
   \lo �a \lo �i \lo �e \lo �u \lo �u \lo �o \lo �n }
\def\lo #1#2{\lccode`#1=`#2}

\dotoc \bookmarks

\sec �vod
%%%%%%%%%

DocBy.\TeX{} umo��uje jednodu�e dokumentovat pomoc� \TeX{}u 
zdrojov� k�dy programu napsan�m v~jazyce~C p��padn� v jak�mkoli
jin�m jazyce.

Na rozd�l od Knuthova liter�rn�ho programov�n� tento n�stroj nepou��v�
��dn� preprocesory nebo filtry pro odd�len� informace pro �lov�ka a
pro po��ta�. Vych�z�m z toho, �e program�tor je zvykl� ps�t tyto
informace odd�len� a chce m�t v�ci pod vlastn� kontrolou. Rovn� mnoz�
program�to�i uv�taj�, �e mohou ps�t dokumentaci dodate�n�, a p�itom
skoro nezasahovat do u� napsan�ho (a mo�n� odlad�n�ho) zdrojov�ho
k�du.  Doba, kdy Knuth navrhoval liter�rn� programov�n�, pokro�ila a
tv�rce dokumentace dnes m��e m�t z�rove� ve v�ce oknech otev�eno v�ce
text�.  N�kter� jsou ur�eny pro �lov�ka a jin� pro po��ta�. Nevn�m�m
tedy tak hlasitou pot�ebu tyto informace slu�ovat do jednoho
souboru, jako tomu bylo kdysi.

V prvn� ��sti (sekce~\cite[uziv]) dokumentu seznamujeme �ten��e
s pou�it�m \docbytex{}u na u�ivatelsk� �rovni. V dal�� sekci jsou
dokumentovan� v�choz� makra \docbytex{}u, u nich� se p�edpokl�d�, �e
je bude cht�t n�ro�n� u�ivatel m�nit, aby p�izp�sobil chov�n� \docbytex{}u
obrazu sv�mu. D�le n�sleduje sekce~\cite[design] s dokumentac�
maker, kter� rovn� budou m�n�na, pokud u�ivatel bude cht�t jin�
vzhled dokumentu. V~posledn� sekci~\cite[implementace] 
je dokumentov�n kompletn� \docbytex{} na implementa�n� �rovni. 
Tak�e se tam m��ete do��st, jak makra funguj�. 

Tento dokument je zpracov�n \docbytex{}em, tak�e slou�� mimo jin� jako
uk�zka, co je mo�n� t�mto n�strojem vytvo�it.

\sec [uziv] Pro u�ivatele
%%%%%%%%%%%%%%%%%%%%%%%%%

\subsec [cleneni] �len�n� soubor�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

\docbytex{} je implicitn� navr�en pro dokumentov�n� zdrojov�ch k�d� 
v~jazyce~C. Proto i n�sleduj�c� uk�zka dokumentuje hypotetick� program
napsan� v tomto jazyce. Chcete-li dokumentovat jin� jazyk, m��ete
implicitn� chov�n� \docbytex{}u pozm�nit. Tomu je v�nov�na 
sekce~\cite[zmeny].

P�edpokl�d� se, �e zdrojov� k�dy programu jsou �len�ny na moduly. Ka�d� modul
je my�lenkov� samostatn� z�le�itost. Alespo� pro program�tora. Ka�d� modul
m� sv� jm�no (nap��klad "cosi") a je naps�n v souborech "cosi.h" a "cosi.c",
p��padn� v dal��ch. Tyto soubory se kompiluj�, aby vznikl "cosi.o" a 
v~z�v�ru kompilace se linkuj� v�echny kompilovan� moduly do v�sledn�ho
programu.

Chceme-li takov� zdrojov� k�dy dokumentovat, p�ip�eme ke ka�d�mu
modulu soubor s p��ponou ".d", nap��klad "cosi.d", kter� obsahuje
dokumentaci k dan�mu modulu.  D�le zalo��me t�eba soubor
"program.tex", ze kter�ho postupn� na��t�me dokumentace jednotliv�ch
modul� pomoc� p��kazu "\module"\du{module}. V \uv{hlavn�m souboru} "program.tex"
m��eme t� pou��t p��kazy "\title" pro vyzna�en� n�zvu programu,
"\author" se jm�nem autora programu a t�eba "\dotoc" pro vytvo�en�
obsahu a "\doindex" pro vygenerov�n� rejst��ku. Samoz�ejm� zde m��eme
napsat t�eba �vodn� pozn�mky ke zdrojov�m k�d�m programu a pou��t plno
dal��ch vymezovac�ch p��kaz� (viz d�le). Obsah souboru "program.tex"
m��e vypadat t�eba takto:

\begtt
\input docby.tex
\title   Program lup -- dokumentace ke zdrojov�m text�m

\author  Progr a M�tor

\dotoc  % tady bude obsah

\sec �len�n� zdrojov�ch text�

Zdrojov� texty programu "lup" jsou rozd�leny do t�� modul�. 
V "base.c" jsou definov�ny pomocn� funkce a v "base.h" jsou jejich
prototypy. Podobn� ve "win.c" jsou funkce pro okenn� z�le�itosti a
"win.h" obsahuje jejich prototypy. Kone�n� "main.c" obsahuje hlavn�
funkci programu.
\module base
\module win
\module main
\doindex  % v tomto m�st� bude sestaven rejst��k
\bye
\endtt

V tomto p��klad� jsme se rozhodli �ten��e dokumentace seznamovat s
programem \uv{zdola nahoru}, tedy od element�rn�ch funkc� a� k hotov�mu
programu. N�kdo mo�n� preferuje cestu \uv{shora dol�} a m��e m�t v
dokumentaci naps�no:

\begtt
\module main
\module win
\module base
\doindex
\bye
\endtt

Oba p��stupy jsou mo�n�, proto�e dokumentace je automaticky prov�z�na
hyperlinky. �ten�� se kdykoli m��e pod�vat na dokumentaci t� funkce,
jej� pou�it� zrovna �te, a obr�cen� m��e proj�t v�skyty ve�ker�ho
pou�it� funkce, kdy� �te jej� dokumentaci.

\subsec [priklad] P��klad dokumentace modulu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Soubor s dokumentac� jednotliv�ho modulu budu pro tento 
p��pad zna�it "cosi.d". Ten je na�ten p��kazem "\module"~"cosi ".
V souboru "cosi.d" je mo�no se liter�rn� vy��dit a kdykoli vlo�it ��st 
existuj�c�ho zdrojov�ho k�du programu se stejn�m jm�nem modulu.
To provedeme p��kazem "\ins"~"c keyword "\du{ins}, kter� vlo�� do dokumentace
��st zdrojov�ho k�du ze souboru "cosi.c", kter� je vymezena pomoc� slova 
"keyword". M�sto p�smene "c" je mo�no pou��t "h" nebo jakoukoli jinou
p��ponu souboru, ze kter�ho chceme vlo�it ��st do dokumentace. K
vymezen� ��st�, kter� se maj� vlo�it, je nutno m�t ve zdrojov�m
souboru text "//: keyword". V�e vysv�tl� n�sleduj�c� p��klad.

P�edpokl�dejme, �e v souboru "cosi.d" m�me naps�nu tuto dokumentaci:

\begtt
Struktura \dg dvojice se pou��v� jako n�vratov� hodnota funkce
"uzasna_funkce" a sdru�uje dv� hodnoty typu "float".
\ins c dvojice

Funkce \dg [struct dvojice] uzasna_funkce() si vezme jeden parametr "p" 
a vr�t� ve struktu�e "dvojice" dvojn�sobek a trojn�sobek tohoto parametru.
\ins c uzasna_funkce
\endtt

V tomto p��pad� je nutn�, aby v souboru "cosi.c" existoval vymezuj�c�
text "//: "{\tt dvojice} a text "//: "{\tt uzasna\_funkce}. 
Tyto texty vymezuj� �seky,
kter� se maj� do dokumentace vlo�it. Soubor "cosi.c" m��e vypadat
t�eba takto:

\begtt
#include <stdio.h>

//: dvojice

struct dvojice {
  float x, y;
};

//: uzasna_funkce

struct dvojice uzasna_funkce (float p)
{
  struct dvojice navrat;
  navrat.x = 2*p; // tady nasobim p dvema
  navrat.y = 3*p; // tady nasobim p tremi
  return navrat;
} 
\endtt

V�sledek po zpracov�n� ��sti dokumentace z "cosi.d" pak vypad� takto:

\bigskip

Struktura \dg [struct] dvojice se pou��v� jako n�vratov� hodnota funkce
"uzasna_funkce" a sdru�uje dv� hodnoty typu "float".
\def\modulename{cosi}
\ins c dvojice

Funkce \dg [struct dvojice] uzasna_funkce() si vezme jeden parametr "p" a vr�t�
ve struktu�e "dvojice" dvojn�sobek a trojn�sobek tohoto parametru.
\ins c uzasna_funkce

V uk�zkov�m zdrojov�m k�du je prvn� vlo�en� �sek vymezen na
za��tku textem "//: "{\tt dvojice} a na konci textem "//:". Druh� �sek je
vymezen textem "//: "{\tt uzasna\_funkce} a kon�� na konci souboru.

Na po�ad� �sek�, kter� zahrnujeme ze zdrojov�ho textu do dokumentace,
nez�le��. Klidn� jsme mohli dokumentaci za��t od pov�d�n� o ��asn�
funkci (v�etn� vlo�en� jej�ho k�du) a potom je�t� dopsat, co to je ta 
struktura "dvojice" a n�sledn� vlo�it deklaraci t�to struktury.

Kdybychom p�ed ��dek "#include "{\tt<stdio.h>} vlo�ili t�eba text
"//: start", bylo by mo�n� p��kazem "\ins"~"c start " vlo�it 
do dokumentace za��tek souboru "cosi.c", kter� v uk�zce vlo�en nen�.

V�imn�me si, �e \TeX{} zapsal ��sla ��dk� p�esn� podle toho, jak
jsou ve zdrojov�m k�du. Tj. po��tal i p�eskakovan� ��dek 
"#include "{\tt<stdio.h>} i p�eskakovan� pr�zdn� a vymezuj�c� ��dky.

Vymezen� "//: keyword" se m��e v ��dku nach�zet kdekoli, nen� nutn�,
aby se vyskytovalo na za��tku ��dku. ��dek s~t�mto vymezen�m nen� do
dokumentace zahrnut a pokud n�sleduje za ��dkem s~vymezen�m pr�zdn�
��dek, ani ten nen� do dokumentace zahrnut. 

Stejn� tak koncov� vymezen� "//:" se m��e v ��dku nach�zet kdekoli a
cel� ��dek s t�mto vymezen�m nen� do dokumentace zahrnut. 
Pokud p�ed t�mto koncov�m ��dkem je pr�zdn� ��dek, ani ten 
nen� do dokumentace zahrnut.

Kone�n� za pov�imnut� stoj� pou�it� p��kazu "\dg" v dokumentaci. Za
n�m n�sleduje slovo (separovan� mezerou), kter� dokumentujeme. Toto
slovo se v dokumentaci v�razn� ozna�� (v PDF verzi �ervenou barvou
nav�c v barevn�m r�me�ku) a jak�koli jin� v�skyt takov�ho slova ve
zdrojov�m textu nebo mezi uvozovkami {\tt\char`\"...\char`\"} bude
automaticky ozna�en modrou barvou a bude klikac�. Kliknut� na modr�
v�skyt slova kdekoli v dokumentaci vr�t� �ten��e na �erven� v�skyt,
kde je slovo dokumentov�no.

Dokumentovan� slovo m��e m�t p�ed sebou v hranat�ch z�vork�ch text,
kter� nap�. ozna�uje typ funkce a za sebou m��e m�t kulat� z�vorky
"()".  T�m m��eme d�t najevo, �e dokumentujeme funkci. V m�st�
dokumentace se neobjev� ani tento nepovinn� text ani z�vorky, ale v
pozn�mce pod �arou a v~rejst��ku se tyto informace vytisknou.

\uv{Palcov� uvozovky} {\tt\char`\"...\char`\"} vymezuj� kusy k�du
uvnit� odstavce. Text takto uvozen� je ps�n strojopisem a pokud se 
v n�m vyskutuj� deklarovan� slova, tato slova automaticky modraj�
a st�vaj� se klikateln�mi odkazy.
Text mezi t�mito uvozovkami je nav�c p�episov�n ve \uv{verbatim}
m�du \TeX{}u, tj. ��dn� znaky nemaj� speci�ln� vlastnosti (s v�jimkou
koncov� palcov� uvozovky). 

Na str�nce, kde je slovo dokumentov�no (pomoc� "\dg"), je v pozn�nk�ch
pod �arou slovo znovu zm�n�no a vedle t�to zm�nky je seznam v�ech
str�nek, na kter�ch se kdekoli v textu vyskytuje pou�it� tohoto slova.
D�le jsou v�echna dokumentovan� slova zahrnuta do z�v�re�n�ho
abecedn�ho rejst��ku, kter� odkazuje jednak na str�nku, kde je
slovo dokumentov�no, i na str�nky se v�emi v�skyty slova.


\subsec Jak� \TeX{} pro \docbytex{}?
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Aby fungovaly v�echny v��e uveden� vlastnosti, je pot�eba pou��t
pdf\TeX{} roz���en� o enc\TeX{}. D�le je dle "\language" detekov�n 
jazyk, kter� se pou�ije v automaticky generovan�ch slovech.
\docbytex{} se ohl�s� na termin�lu nap��klad t�mito slovy:

\def\begtthook{\catcode`\!=0}
\begtt
This is DocBy.TeX, version !dbtversion, modes: enc+PDF+ENG
\endtt

\def\begtthook{}

\docbytex{} rozli�uje t�i m�dy, ka�d� m��e nab�vat dvou stav�:
m�d "enc/NOenc", d�le m�d "PDF/DVI" a kone�n� m�d jazyka "ENG/CS".

M�d "enc"\api{enc} se zapne, je-li detekov�na p��tomnost enc\TeX{}u.
Pokud enc\TeX{} nen� dostupn�, vyp�e o~tom \docbytex{} varov�n� a
p�ejde do "NOenc"\api{NOenc} m�du. V tomto m�du nefunguje automatick� detekce
slov, kter� jsou dokumentov�na, tak�e tato slova nemodraj� a nest�vaj�
se klikac�mi odkazy. V rejst��ku pak tak� nen� seznam str�nek se v�emi
v�skyty slova, ale jen m�sto, kde je slovo dokumentov�no.
V~tomto p��pad� tedy je deaktivov�na nejd�le�it�j�� vlastnost
\docbytex{}u, tak�e je ��douc� vynalo�it jist� �sil� a enc\TeX{}
zprovoznit. V sou�asn�ch distribuc�ch \TeX{}u b�v� enc\TeX{}
v pdf\TeX{}u zahrnut a je aktivov�n nap��klad ve form�tu "pdfcsplain".

M�d "PDF"\api{PDF} je detekov�n, pokud je pou�it pdf\TeX{}, jinak \docbytex{}
p�ejde do m�du "DVI"\api{DVI} a nap�e o tom varov�n� na termin�l. V m�du "DVI"
nefunguj� barvy ani klikac� odkazy. Ov�em seznam str�nek s~pou�it�m
dokumentovan�ho slova se generuje, je-li p��tomen enc\TeX.

\docbytex{} detekuje m�d jazyka "ENG" (angli�tina), je-li 
"\language=0". To je implicitn� chov�n�.
Pokud nap��klad v "csplainu" nastav�te "\chyph" p�ed
"\input docby.tex", \docbytex{}
to vyhodnot� jako dokument v �e�tin� ("CS"). 
Jin� jazyky nejsou zat�m podporov�ny.
V m�du "ENG" jsou automaticky generovan� n�zvy 
\uv{Contents}, \uv{Index} anglick�, 
v m�du "CS" jsou tyto n�zvy \uv{Obsah}, \uv{Rejst��k} �esk�.
V~sekci~\cite[nazvy] je �e�eno, jak jsou tato slova generov�na 
a co tedy ud�lat, kdy� chcete m�t dokument v jin�m jazyce.

\subsec Vyhled�v�n� slov enc\TeX{}em
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Slova, kter� se st�vaj� klikateln�mi odkazy vyhled�v� enc\TeX{}. Ten
m� zabudov�n tzv. \uv{hladov� algoritmus}. To znamen�, �e jsou-li
dokumentov�na nap�. slova "abc" a "abcde", pak text "abcdefgh" zmodr�
a� po p�smeno "e" a odkazuje na "abcde", zat�mco "abcdx" zmodr� a� po
p�smeno "c" a odkazuje na "abc". To b�v� obvykle ��douc�. 
%
V enc\TeX{}u nen� mo�no programovat vyhled�v�n� podle regul�rn�ch
v�raz�, tak�e nen� mo�n� jednodu�e ��ci, aby enc\TeX{} hledal jen
slova, kter� jsou ohrani�ena mezerou, te�kou, z�vorkou, st�edn�kem,
atd. M�sto toho enc\TeX{} tup� vyhled� slovo t�eba uvnit� jin�ho slova.

M��e se tedy st�t, �e m�me dokumentov�no krat�� slovo, kter� se
objevuje jako ��st jin�ch nedokumentovan�ch slov. Nap��klad je
dokumentov�na struktura "turn", ale ve v�pisech programu nechceme, aby
v ka�d�m v�skytu kl��ov�ho slova "return" zmodrala jeho ��st. V
takov�m p��pad� je pot�eba explicitn� definovat "return" jako 
\uv{norm�ln�} nedokumentovan� slovo. K tomu slou�� p��kaz
"\noactive{<slovo>}"\du{noactive}, tedy nap��klad 
"\noactive{return}". Tento p��kaz glob�ln�
deklaruje "<slovo>" jako vyhled�van� slovo (pro enc\TeX), ale 
specifikuje jej jako neaktivn�.

M��e se tak� st�t, �e m�me dokumentov�no slovo, kter� se objevuje ve
zdrojov�ch textech i v jin�m (nedokumentovan�m) v�znamu. P�itom dokumentovan�
slovo pozn�me podle toho, jak vypad� text p�ed slovem a za slovem.
Pak lze pou��t deklaraci "\onlyactive{<p�ed>}{<slovo>}{<za>}"\du{onlyactive}, 
kter� sama o sob� ned�l� nic. Pokud ale vyzna��me "<slovo>" pomoc�
"\dg" (nebo podobn�ho makra na dokumentov�n� slov, viz
sekce~\cite[ddsl]), pak bude "<slovo>" automaticky modrat jen tehdy,
p�edch�z�-li mu text "<p�ed>" a n�sleduje text "<za>". Texty "<p�ed>"
nebo "<za>" mohou b�t pr�zdn� (ne oba sou�asn�) a k jednomu "<slovu>"
m��eme napsat v�ce r�zn�ch deklarac� "\onlyactive".
 
\docbytex{} aktivuje enc\TeX{} (pomoc� "\mubytein=1") jen uvnit�
skupiny, kdy� zpracov�v� text mezi palcov�mi uvozovkami
({\tt\char`\"...\char`\"}) nebo p�i na��t�n� zdrojov�ho textu
programu. P�edpokl�d� se, �e nepou��v�te enc\TeX{} k~dek�dov�n� UTF-8
k�du. Pokud pou��v�te, zkuste si zapnout "\mubytein=1" pro cel� dokument,
ale na {\it vlastn� riziko}. V takov�m p��pad� v�m budou modrat slova
nebo jejich ��sti i v~b�n�m textu a pokud je dokumentovan� slovo
podmno�inou n�jak� \TeX{}ov� sekvence, kterou pou��v�te, pak se
do�k�te nep��jemn�ch chyb.

\subsec Generov�n� rejst��ku, obsahu, pozn�mek pod �arou a z�lo�ek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Generov�n� rejst��ku i obsahu prob�h� v \docbytex{}u zcela
automaticky. Pro vytvo�en� rejst��ku nen� nutn� pou��vat extern�
program (\docbytex{} si slova abecedn� zat��d� s�m).
Sta�� tedy vlo�it na po�adovan� m�sta p��kazy "\dotoc"\du{dotoc} a
"\doindex"\du{doindex}. Upozor�uji, �e rejst��k ani obsah nejsou spr�vn�
vygenerov�ny po prvn�m pr�chodu \TeX{}u. Je pot�eba \TeX{}ovat
dvakr�t. Po druh�m pr�chodu dojde z�ejm� k p�estr�nkov�n� textu
(proto�e je nap��klad vlo�en obsah). Je tedy nutn� \TeX{}ovat je�t�
jednou. T�i pr�chody \TeX{}em jsou (snad) dosta�uj�c�.
Slovo \uv{snad} vych�z� z probl�mu s pozn�mkami pod �arou podrobn�
popsan�m v sekci~\cite[specfootnote].
Pozn�mky pod �arou se toti� pr�b�n� v pr�chodech m�n� a ovliv�uj�
zp�tn� vertik�ln� sazbu. \docbytex{} proto prov�d� na konci zpracov�n�
v p��kaze "\bye"\du{bye} kontrolu, zda nedo�lo ke zm�n�m v referenc�ch.
Je proto u�ite�n� pou��vat "\bye" m�sto "\end".
V z�v�ru zpracov�n� pak \docbytex{} vyp�e zpr�vu 
"OK, all references are consistent" nebo vyp�e
varov�n�, �e n�kter� reference jsou nekonzistentn� a 
�e je tedy pot�eba \TeX{}ovat znovu.

Dal�� test konzistence m��eme prov�st nap��klad n�sleduj�c�m skriptem:

\begtt
#!/bin/bash
cp dokument.ref dokument.r0
pdfcsplain dokument.d
diff dokument.r0 dokument.ref
\endtt

\docbytex{} se sna�� (z d�vodu z�ruky konvergence dokumentu) fixovat 
zpracov�n� pozn�mek pod �arou po druh�m pr�chodu. Pokud pot� m�n�te
rozs�hle dokument, tak�e seznamy str�nek vedle pozn�mek pod �arou jsou
v�razn� jin� d�lky, \docbytex{} to nepozn� a m��e doch�zet 
k p�epln�n� nebo nenapln�n� str�nek. V takov�m p��pad� je rozumn�
vymazat soubor {\tt.ref} a znovu spustit t�i pr�chody.

Pro vytvo�en� z�lo�ek se strukturovan�m obsahem v PDF v�stupu slou��
p��kaz "\bookmarks"\du{bookmarks}. Je zcela jedno, v kter� ��sti
dokumentu je tento p��kaz napsan�, nebo� sestav� stukturovan� seznam
z�lo�ek prolinkovan� s dokumentem na z�klad� �daj� ze souboru~{\tt.ref}.
M��e se st�t, �e n�kter� texty v z�lo�k�ch nejsou optim�ln� �iteln�. O
mo�nostech, jak toto �e�it, pojedn�v� sekce~\cite[hooky].

\subsec [vkladani] Vkl�d�n� zdrojov�ch text� podrobn�ji
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Krom� jednoduch�ho p��kazu "\ins" na vkl�d�n� zdrojov�ch text� jsou 
k dispozici p��kazy "\ifirst"\du{ifirst} a "\inext"\du{inext}, 
kter� nab�zej� u�ivateli
daleko v�ce mo�nost�.

P��kaz "\ifirst{<soubor>}{<odkud>}{<kam>}{<jak>}" vlo�� do 
dokumentu ��st souboru "<soubor>" (pln� n�zev souboru v�etn� p��pony)
od prvn�ho ��dku, na kter�m se vyskytuje text "<odkud>" po
��dek, na kter�m se vyskytuje text "<kam>", nebo (pokud text "<kam>"
nelze nal�zt) po konec souboru. Neexistuje-li ani ��dek s textem
"<odkud>", \docbytex{} vyp�e pouze varov�n� na termin�l.

P��kaz "\ifirst" si sv� parametry nejprve 
expanduje a pak teprve pou�ije. 
Aktivn� vlnka v parametru expanduje na mezeru.

Parametr "<jak>" ud�v�, zda se bude tisknout v�choz� ��dek (s~textem
"<odkud>") a koncov� ��dek (s~textem "<kam>"). Tento parametr obsahuje
pr�v� dva znaky (plus nebo m�nus) s n�sleduj�c�m v�znamem:

\begtt
jak:  --   netiskne se v�choz� ani koncov� ��dek
jak:  +-   tiskne se v�choz� ��dek a netiskne se koncov� ��dek
jak:  -+   netiskne se v�choz� ��dek, tiskne se koncov� ��dek
jak:  ++   tisknou se oba ��dky
\endtt

Je-li parametr "<odkud>" pr�zdn� (zap�eme pomoc� "{}"), tiskne se od
za��tku souboru. Je-li parametr "<kam>" pr�zdn�, tiskne se jedin� ��dek.
Je-li parametr "<kam>=\end",\du{end} tiskne se a� do konce souboru.
Koncov� ��dek v tomto p��pad� neexistuje. 

M�-li parametr "<odkud>" (nebo "<kam>") hodnotu "\empty"\du{empty} 
(zap�eme pomoc� "{\empty}"), tiskne se od (nebo do) prvn�ho pr�zdn�ho ��dku.
Parametr "<jak>" ovlivn� jeho tisk.

Parametry "<odkud>" nebo "<kam>" mohou m�t na sv�m za��tku znak "^^B"
(t�m d�v�me najevo, �e text mus� na ��dku za��nat) nebo na sv�m konci
znak "^^E" (t�m d�v�me najevo, �e text mus� na ��dku kon�it). Tak�e
t�eba "^^Btext^^E" znamen�, �e se vyhled�v� ��dek, ve kter�m je pouze
"text" a nic jin�ho.

V parametrech "<odkud>" a "<kam>" se nesm�j� vyskytovat speci�ln�
\TeX{}ov� znaky (speci�ln� kategorie). Pro pou�it� znak�
"\", "{", "}", "%" a {\tt\char`\"} v t�chto parametrech jsou 
v~\docbytex{}u p�ipraveny z�stupn� kontroln�
sekvence "\nb"\du{nb}, "\obrace"\du{obrace}, "\cbrace"\du{cbrace},
"\percent"\du{percent} a "\inchquote"\du{inchquote}. 
Sekvence pro dal�� speci�ln� 
znaky "#", "$", atd. si mus�te vytvo�it nap�. pomoc�:

\begtt
{\catcode`\#=12 \gdef\vezeni{#}}
\endtt

Jsou-li parametry "<odkud>" a "<kam>" stejn�, nebo oba texty jsou na
stejn�m ��dku, pak se p�i "<jak>=++" nebo "<jak>=+-" vytiskne 
tento jeden ��dek. P�i "<jak>=-+" nebo "<jak>=--" se tiskne a� 
do konce souboru nebo do dal��ho v�skytu textu "<kam>". 

P��kaz "\ifirst" si zapamatuje n�zev �ten�ho souboru a pozici
posledn�ho p�e�ten�ho ��dku v~dan�m souboru. Pak je mo�n� pou��t
p��kaz "\inext{<odkud>}{<kam>}{<jak>}", kter� za��n� hledat v�choz� ��dek 
s textem "<odkud>" od m�sta v souboru, kde naposledy skon�ilo �ten�
p��kazem "\ifirst" nebo "\inext". Parametry "<odkud>", "<kam>" a "<jak>"
maj� stejn� v�znam, jako u p��kazu "\ifirst".

V registru "\lineno"\du{lineno} je po ukon�en� p��kazu "\ifirst" nebo "\inext"
��slo ��dku, kter� bylo naposledy p�e�teno (t�eba�e tento ��dek nebyl
vyti�t�n). Pokud bylo dosa�eno konce souboru, obsahuje "\lineno"
po�et ��dk� souboru. Pomoc� "\ifeof\infile" je mo�n� se zeptat, zda
bylo dosa�eno konce souboru.

P��klady

\begtt
\ifirst {soubor.txt}{textik}{textik}{++}    % vytiskne prvn� v�skyt ��dku
                                            % obsahuj�c� slovo textik
\inext {textik}{textik}{++}                 % vytiskne n�sleduj�c� v�skyt
                                            % ��dku obsahuj�c� slovo text�k
\ifirst {soubor.c}{//: odkud}{//:}{--}      % analogie p��kazu \ins
\ifirst {soubor.c}{funkce(}{)}{++}          % tisk prototypu funkce
\ifirst {soubor.c}{funkce(}{^^B\cbrace}{++} % tisk cel�ho k�du funkce
\ifirst {soubor.txt}{}{\end}{++}            % tisk cel�ho souboru
\ifirst {soubor.txt}{}{\empty}{+-}          % tisk po pr�zdn� ��dek
\endtt

Je-li prvn� ��dek, kter� se m� tisknout, pr�zdn�, netiskne se. Je-li
posledn� ��dek, kter� se m� tisknout, pr�zdn�, tak� se netiskne. Toto
je implicitn� chov�n�. Pokud nap�ete "\skippingfalse",\du{skippingfalse} 
uveden� inteligence je zru�ena a p�episuj� se i pr�zdn� ��dky vp�edu a vzadu.
P��kazem "\skippingtrue"\du{skippingtrue} se vr�t�te k p�vodn�mu nastaven�.

Parametr�m "<odkud>" a "<kam>" m��e p�edch�zet text 
"\count=<��slo> ".\du{count} Hodnota "<��slo>" ozna�uje,
kolik�t� v�skyt textu "<odkud>" nebo "<kam>" se m� pou��t.
Nap��klad "{\count=3 <odkud>}" znamen�, �e se m�
p�i vyhled�v�n� "<odkud>" p�esko�it dva jeho v�skyty a za��t
p�episovat soubor a� od v�skytu t�et�ho. Podobn� "{\count=5 <kam>}"
zna��, �e se p�i p�episov�n� souboru ignoruj� �ty�i v�skyty "<kam>" a
p�episov�n� se zastav� a� u v�skytu p�t�ho.

Implicitn�, nen�-li "\count=<��slo> " uvedeno, p�edpokl�d� se
"\count=1 ". 

Pokud je text "<odkud>" pr�zdn�, pak
"\count" ozna�uje ��slo ��dku, na kter�m se m� zah�jit v�pis. Je-li
pr�zdn� parametr "<kam>", pak "\count" ozna�uje po�et p�episovan�ch
��dk�. Toto plat� pro "<jak>=++" a pro "\skippingfalse". 
P�i jin�ch hodnot�ch "<jak>" se
uveden� ��sla logicky posunou o jedni�ku. P�i pr�zdn�m "<odkud>" nebo
"<kam>" nen� mezera za "\count=<��slo>" povinn�. P��klady:

\begtt
\skippingfalse
\ifirst {soubor.txt}{\count=20}{\count=10}{++} % tisk ��dk� 20 a� 29
\ifirst {soubor.txt}{}{\count=2 \empty}{+-} % tisk po druh� pr�zdn� ��dek
\ifirst {soubor.txt}{\count=50}{\end}{++}  % tisk od 50. ��dku do konce
\ifirst {soubor.tex}{\count=5 \nb section}{\count=2 \nb section}{+-}
                                    % tisk p�t� sekce z TeXov�ho souboru 
\endtt


\subsec [lineodkazy] Odkazy na ��sla ��dk�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pomoc� "\cite[<lejbl�k>]" je mo�n� odkazovat na ��slo ��dku ve v�pisu
zdrojov�ho k�du. Tento p��kaz se prom�n� na skute�n� ��slo ��dku.
P�ed pou�it�m p��kazu "\ifirst" nebo "\inext" je nutn� "<lejbl�k>"
deklarovat p��kazem "\ilabel [<lejbl�k>]{<text>}".\du{ilabel} 
T�chto p��kaz� m��e b�t p�ed pou�it�m "\ifirst" resp. "\inext" v�ce.
Na po�ad� p��kaz� "\ilabel" p�ed jedn�m "\ifirst" nebo "\inext" nez�le��.

Existuj�-li deklarovan� "<lejbl�k>"y a "<text>"y, pak p��kaz 
"\ifirst" nebo "\inext" si v��m� v�skytu "<text>"u ve vkl�dan�ch
��dc�ch. Pokud takov� "<text>" najde, p�i�ad� ��slo ��dku
odpov�daj�c�mu "<lejbl�k>"u, tak�e p��kaz "\cite" bude fungovat, jak m�.

Parametr "<lejbl�k>" mus� b�t jednozna�n� v cel�m dokumentu. P��kaz
"\cite" funguje dop�edn� i zp�tn�.

P��kazy "\ilabel" maj� lok�ln� p�sobnost a spolupracuj� jen 
s nejbli���m n�sleduj�c�m "\ifirst" a "\inext".
Tak�e p�ed pou�it�m dal��ho "\ifirst" resp. "\inext" 
je pot�eba deklarovat dal�� vyhled�van� texty 
pomoc� "\ilabel" znovu. 

\docbytex{} nevyp�e ��dn� varov�n�, pokud n�jak� "<text>"
deklarovan� v "\ilabel" nenajde. Ov�em p�i pou�it� "\cite" se objev�
varov�n�, �e nen� zn�m� "<lejbl�k>" a toto varov�n� nezmiz� ani p�i
opakovan�m \TeX{}ov�n�. 

Pokud se "<text>" vyskytuje ve v�ce ��dc�ch uk�zky, je odkazov�n
��dek s prvn�m v�skytem.

V n�sleduj�c� uk�zce je �ten ji� zn�m� soubor "cosi.c" 
(viz kapitolu~\cite[priklad]).

\begtt
Na ��dku~\cite[ufunkce] je deklarovan� ��asn� funkce.

\ilabel [ufunkce] {funkce (float}
\ilabel [navratx] {navrat.x}
\ifirst {cosi.c}{}{}{++}

Zvl�t� upozor�uji na geni�ln� my�lenku na ��dku~\cite[navratx], 
kde je vstupn� parametr vyn�soben dv�ma. 
\endtt

\subsec Verbatim uk�zky pomoc� {\tt\nb begtt}/{\tt\nb endtt} a
        palcov�ch uvozovek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Verbatim uk�zky m��ete do dokumentace vkl�dat pomoc� "\begtt"\du{begtt} a
"\endtt"\du{endtt}. Ty jsou (na rozd�l od vkl�dan�ch soubor�) naps�ny p��mo ve
zdrojov�m textu \TeX{}u.
V�echny ��dky za "\begtt" jsou vlo�eny beze zm�n a� po
ukon�ovac� "\endtt". ��dky nejsou ��slov�ny a texty v nich nemodraj� a
nest�vaj� se klikateln�mi odkazy.

N�sleduj�c� sekce~\cite[hooky] a~\cite[begtt] obsahuj� informace,
jak je mo�n� toto implicitn� chov�n� zm�nit.

Verbatim uk�zky uvnit� odstavce lze vymezit palcov�mi uvozovkami
{\tt\char`\"...\char`\"}. V tomto prost�ed� prob�h� tisk strojopisem a
je aktivn� enc\TeX{}, tak�e dokumentovan� slova se st�vaj� 
automaticky odkazy na m�sto, kde je "\dg". Doporu�uje se toto
prost�ed� pou��vat na v�pisy ve�ker�ch ��st� k�d� dokumentovan�ho
programu, kter� jsou vlo�eny uvnit� textu v odstavci (analogie
matematick�ho prost�ed� "$...$").

\subsec [ddsl] Deklarace dokumentovan�ho slova
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Na deklaraci slova, kter� dokumentujeme, lze pou��t p��kaz "\dg",\du{dg}
"\dgn",\du{dgn} "\dgh",\du{dgh} "\dl",\du{dl} "\dln"\du{dln} 
nebo "\dlh"\du{dlh}. V�znamy jednotliv�ch
p��kaz� vysv�tl�me pozd�ji. Nejprve se v�nujme syntaxi parametr�.
V�echny p��kazy maj� stejnou syntaxi, tak�e nebude vadit, kdy� bude
vylo�ena jen v souvislosti s p��kazem "\dg". Syntaxe je pon�kud
zvl�tn�. ��elem toti� bylo minimalizovat pr�ci p�sa�e, tak�e jsem se
vyhnul ku�erav�m z�vork�m, parametr separuji podle mezery nebo n��eho
jin�ho, atd.

Existuj� tyto mo�nosti syntaxe parametr�:

\def\begtthook{\langleactive \mubytein=1}
\begtt
\dg <slovo>            % <slovo> separovan� mezerou
\dg [<text>] <slovo>    % nav�c nepovinn� "p�edn�" <text>
\dg [<text>]<slovo>     % <slovo> m��e na [<text>] navazovat bez mezery
\dg <slovo>()          % <slovo> s dvojic� "()" separovan� mezerou
\dg [<text>]<slovo>()   % kombinace p�edchoz�ho
\dg <slovo>,           % <slovo> separovan� ��rkou
\dg [<text>] <slovo>,   % kombinace p�edchoz�ho
\dg <slovo>(),         % <slovo> s dvojic� "()" separovan� ��rkou
\dg [<text>]<slovo>(),  % kombinace p�edchoz�ho
\dg <slovo>.           % slovo separovan� te�kou
atd...
\endtt
\def\begtthook{}

Obecn�: za p��kazem "\dg" m��e n�sledovat nepovinn� "[". Pokud
n�sleduje, pak se p�e�te "<text>" a� po ukon�ovac� "]". Parametr
"<text>" m��e obsahovat mezery. Za ukon�ovac� "]" m��e a nemus� b�t
mezera. Pokud tam je, pak ji makro p�esune p�ed koncovou z�vorku "]",
tak�e "\dg"~"[aha] slovo" je tot� jako "\dg"~"[aha ]slovo".
D�le n�sleduje �ten� parametru "<slovo>". 
Tento parametr nesm� obsahovat mezeru, ��rku, te�ku, st�edn�k
a dvojte�ku. �ten� parametru je ukon�eno, jakmile se objev� mezera
nebo ��rka nebo te�ka nebo st�edn�k nebo dvojte�ka. Uveden�
interpunkce nen� sou��st� parametru "<slovo>" a po zpracov�n� parametru
se vr�t� do vstupn� fronty, tak�e se b�n� vytiskne.
Nakonec se zjist�, zda p�e�ten� parametr a� po separ�tor nen� ve tvaru
"<slovo>()". Pokud je, pak symbol "()" se nepova�uje za sou��st
parametru "<slovo>", ale mluv�me o "<slovu>" n�sledovan�m dvojic�~"()".

Pozor, za separ�torem typu ��rka, te�ka, st�edn�k a dvojte�ka se mus�
vyskytnout mezera. Ne nutn� ihned, ale d��ve, ne� se objev� �sek
textu, kter� m� b�t p�e�ten s jin�mi kategoriemi 
(nap�.~{\tt\char`\"...\char`\"}). Nen� tedy mo�n� ps�t 
"\dg" {\tt text,\char`\"...\char`\"}.
Pokud za separ�torem mezera n�sleduje znak {\tt\char`\`} (obr�cen�
apostrof), mezera ani tento znak se netiskne. To je mo�n� vyu��t
nap��klad pro vlo�en� nezlomiteln� mezery nebo pro jin� ��ely: 
"\dg"~"<slovo> `~<p�ilepen� text>"
nebo "\dg"~"<slovo> `"{\tt\char`\"...\char`\"}.

P��kazy "\dgh", "\dgn", "\dln", "\dlh" separuj�c� mezeru 
netisknou nikdy, proto�e tyto p��kazy v�t�inou netisknou nic (viz n�e).

Parametr "<slovo>" je dokumentovan� slovo. Pokud se takov� "<slovo>"
vyskytne n�kde jinde v dokumentu mezi {\tt\char`\"...\char`\"} nebo ve
vlo�en�m zdrojov�m k�du, automaticky zmodr� a st�v� se klikateln�m
odkazem na m�sto, kde je pou�ito "\dg". V m�st� pou�it� "\dg" je slovo
zv�razn�no �ervenou barvou. Je vyti�t�no samotn� bez parametru
"<text>" a bez p��padn�ch z�vorek "()". V pozn�mce pod �arou se vyp�e
"<slovo>" (�erven�). Tam je i p��padn� "<text>" (p�ed slovem) a za n�m
je p��padn� dvojice "()". Vedle tohoto v�pisu je
seznam str�nek s v�skyty "<slova>". V rejst��ku se objev� n�co podobn�ho,
jako v pozn�mce pod �arou. Rejst��k je �azen abecedn� podle "<slovo>",
nikoli podle "<text>".

P��kaz "\dg" deklaruje "<slovo>" glob�ln�. Bude na n�j odkazov�no v cel�m
dokumentu. 

P��kaz "\dgh" pracuje jako "\dg", ale slovo nebude v m�st� "\dgh"
vyps�no ("\dg" hidden). Bude tam jen c�l odkaz� a "<slovo>" 
se objev� v pozn�mce a v rejst��ku. 

P��kaz "\dgn" zp�sob�, �e prvn� n�sleduj�c� v�skyt
"<slova>" ve vypisovan�m zdrojov�m k�du 
se stane c�lem v�ech ostatn�ch odkaz�, z�erven� (tedy
nezmodr�) a v m�st� tohoto v�skytu se objev� p��slu�n� pozn�mka pod
�arou. P��kaz "\dgn" �teme jako "\dg" next, nebo "\dg" n�sleduj�c�.

P��kaz "\dl" deklaruje "<slovo>" lok�ln�. Bude na n�j odkazov�no sv�m
kr�tk�m jm�nem "<slovo>" jen v m�st� stejn�ho jmenn�ho prostoru,
typicky p�i dokumentaci jednoho modulu. Ka�d� modul zah�jen� p��kazem
"\module" zav�d� jmenn� prostor tvaru "<slovo>./<n�zev>", kde
"<n�zev>" je jm�no modulu. Slovo deklarovan� pomoc� "\dl" �ije ve dvou
variant�ch. V kr�tk� variant� jako "<slovo>" jen v rozsahu jednoho
jmenn�ho prostoru a v dlouh� variant� "<slovo>./<n�zev>" �ije glob�ln�
v cel�m dokumentu. P��padn� v�skyt dlouh�ho n�zvu odk�e na m�sto
deklarace nap��� cel�m dokumentem.

Podrobn�ji o jmenn�ch prostorech a mo�nosti jejich zm�ny najdete 
v~sekci~\cite[jmenneprostory]. 

Ka�d� "<slovo>" mus� b�t v dokumentu deklarov�no nejv��e jednou, jinak
\docbytex{} ohl�s� chybu. V p��pad� "\dl" mus� existovat
jednozna�n� dlouh� n�zev.

P��kaz "\dlh" je skryt� "\dl". P��kaz "\dln" znamen� "\dl" next.
Analogicky, jako p��kazy "\dgh" a "\dgn".

Pokud n�koho irituje vysok� inteligence t�chto p��kaz� p�i �ten�
parametr�, m��e pou��t intern� verzi p��kaz� s povinn�mi t�emi
parametry obalen�mi do ku�erav�ch z�vorek: "\iidg",\du{iidg} 
"\iidgh",\du{iidgh} "\iidgn",\du{iidgn} 
"\iidl",\du{iidl} "\iidlh",\du{iidlh} "\iidln".\du{iidln} 
Parametry vypadaj�
takto: "\iidg{<p�ed>}{<slovo>}{<za>}". Pravda, tyto p��kazy umo��uj�
v�ce ne� jejich kr�tk� verze: umo��uj� do parametru "<slovo>"
propa�ovat ��rku, mezeru, st�edn�k atd. a do parametru "<za>" napsat
cokoli, nejen kulat� z�vorky.
 

\subsec [jmenneprostory] Jmenn� prostory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Jmenn� prostor je pravidlo, podle kter�ho se kr�tk� n�zev
dokumentovan�ho "<slova>" transformuje p�i pou�it� "\dl"
na n�zev dlouh�. Je mo�n� jej nastavit nebo zm�nit pomoc� p��kazu
"\namespace"\du{namespace}, kter� se pou�ije takto:
"\namespace" "{<text1>#1<text2>}...\endnamespace".\du{endnamespace} 
Pokud je uvnit� tohoto prost�ed� pou�it p��kaz 
"\dl<slovo>", je slovu p�id�len kr�tk� n�zev "<slovo>" a dlouh� n�zev 
"<text1><slovo><text2>". 
Uvnit� takto deklarovan�ho prost�ed� se v�echny v�skyty
kr�tk�ho n�zvu "<slovo>" transformuj� na dlouh� n�zev a jsou
prolinkov�ny s odpov�daj�c�m m�stem "\dl". Jmenn� prostor je lok�ln�
uvnit� sv�ho prost�ed�, tak�e vn� prost�ed� se "<slovo>"
chov�, jakoby nebyl ��dn� p��kaz "\dl" pou�it.
Nap��klad uvnit� prost�ed� "\namespace"~"{#1//uff}...\endnamespace" je ke
ka�d�mu slovu deklarovan�mu pomoc� "\dl<slovo>" p�id�len dlouh� n�zev 
"<slovo>//uff" a v�skyty "<slovo>" odkazuj� na m�sto "\dl<slovo>". 

Vn� v�ech prost�ed� "\namespace...\endnamespace" nen� jmenn� prostor definov�n, 
tak�e tam nen� mo�n� pou��t p��kaz "\dl". 
Ov�em p��kaz "\module"~"<n�zev> " nastav� jmenn�
prostor na "{#1./<n�zev>}", tak�e uvnit� dokumentace modulu
je mo�n� pou��vat p��kaz~"\dl".

V rejst��ku a v pozn�mce pod �arou se tisknou dlouh� n�zvy. Rejst��k
abecedn� �ad� podle dlouh�ch~n�zv�. V obsahu se tisknou n�zvy kr�tk�.

P��klad pr�ce se jmenn�mi prostory:

\begtt
\namespace {ju::#1}   %% nastavuji namespace ju
Tady deklaruji slovo \dl aha.
Tady slovo "aha" automaticky odkazuje na m�sto deklarace.
Slovo "ju::aha" tak� odkazuje na m�sto deklarace.
\endnamespace
\namespace {hele::#1} %% nastavuji namespace hele
Tady znovu deklaruji slovo \dl aha.
Zde slovo "aha" odkazuje na lok�ln� deklaraci uvnit� "hele"
\endnamespace         %% ru��m namespace
Zde slovo "aha" neodkazuje nikam, ale slova "ju::aha"
a "hele::aha"  st�le odkazuj� na m�sta, kde byla deklarov�na.
\endtt

Prost�ed� "\namespace...\endnamespace" je mo�n� vno�ovat, ov�em vno�en� 
prost�ed� musej� m�t jin� jmenn� prostor ne� prost�ed� vn�j��. Prost�ed� 
jmenn�ch prostor� pracuj� glob�ln� nez�visle na "\bgroup", "\egroup".
P��kaz "\endnamespace" pou�it� vn� v�ech prost�ed� 
"\namespace...\endnamespace" neud�l� nic. Prost�ed� nen� nutn� p�ed 
p��kazem "\bye" ukon�ovat.


\subsec M�sto pro dokumentaci aplika�n�ho rozhran�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

M��e se st�t, �e p�eme dokumentaci jednak pro u�ivatele, kter� zaj�m�
zp�sob pou�it� dokumentovan�ch funkc� a co zhruba d�laj� (tzv.~API),
ale nezaj�m� je, jak je funkce naprogramovan�. Druhak chceme m�t
dokumentov�n i zp�sob, jak funkce funguje uvnit�. V takov�m p��pad�
mus� dokumentovan� "<slovo>" odkazovat na dv� m�sta v dokumentu. 

M�sto, kde je podrobn� "<slovo>" pops�no, je vymezeno p��kazem "\dg"
nebo podobn�m. M�sto, kde slovo dokumentujeme pro u�ivatele (je-li
toto m�sto odli�n� od prvn�ho m�sta), lze vyzna�it p��kazem
"\api{<slovo>}"\du{api}. V m�st� pou�it� "\api{<slovo>}" se nestane
nic, jen se tam um�st� neviditeln� c�l odkaz�. V obsahu se pak
"<slovo>" objev� s odkazem na toto m�sto. V rejst��ku se v seznamu
str�nek objev� jedna str�nka podtr�en�: to je str�nka, kde byl pou�it
p��kaz~"\api{<slovo>}". Ov�em, aby se v rejst��ku "<slovo>" v�bec
objevilo, mus� se n�kde v dokumentu vyskytovat i jeho pln� deklarace
pomoc� "\dg" nebo podobn�ch p��kaz�. Na str�nce, kde je pou�ito "\dg",
je pod �arou vedle slova seznam str�nek a rovn� je tam jedna str�nka
podtr�en�. Kdy� �tete implementa�n� popis pro "<slovo>", snadno se
tedy dostanete na str�nku, kde je API k tomuto "<slovu>".  V~rejst��ku
a obsahu jsou tak� slova, kter� byla deklarovan� pomoc� "\api", zleva
vyzna�ena textem "\apitext"\du{apitext}. Ten je implicitn� nastaven na
�ipku. M��ete se pod�vat do rejst��ku a do obsahu tohoto dokumentu. V
tomto m�st� bylo pou�ito "\api{\nb api}", zat�mco skute�n� definice
p��kazu "\api" je v sekci~\cite[reference].

Je-li pou�ito "\api{<slovo>}", pak je mo�n� se na m�sto odkazovat tak�
pomoc� "\cite[+<slovo>]". Tato konstrukce se prom�n� v ��slo str�nky,
kde je dokumentov�no API dan�ho slova. Nap��klad v tomto dokumentu
se "\cite[+\nb api]" prom�n� na:~\cite[+\nb api]. 

Pokud toto slovo m� tak� sv�j API c�l (vytvo�en� pomoc�
"\api"), pak se �erven� text (ti�t�n� v m�st� "\dg") 
st�v� aktivn�m odkazem na API c�l. Tam
typicky �ten�� najde v�skyt slova, kter� je zase klikateln�m odkazem
na "\dg" c�l. Tak�e tyto dva c�le jsou prolinkov�ny k��em.

\subsec [kapsec] Sekce, sekci�ky, ��st, titul
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Sekce se uvozuj� p��kazem "\sec"~"<n�zev sekce>\par"\du{sec}. Ka�d�
sekce m��e m�t n�kolik podsekc� (sekci�ek), kter� lze vyzna�it
p��kazem "\subsec"~"<n�zev podsekce>\par"\du{subsec}. 
Symbol "\par" zde znamen�,
�e n�zev sekce �i podsekce je odd�len od dal��ho textu pr�zdn�m
��dkem (viz uk�zku v~\cite[cleneni]).

N�kolik sekc� m��e tvo�it ��st. ��st je uvozena p��kazem
"\part"~"<n�zev ��sti>\par"\du{part}. ��sti jsou automaticky ozna�eny
p�smeny A,B,C,\dots a jsou vyzna�eny v�razn�ji ne� sekce v~m�st�
za��tku ��sti i v~obsahu. ��sti ale nenaru�uj� ��slov�n�
sekc�. Tj. sekce jsou ��slov�ny od jedn� nap��� cel�m dokumentem bez
ohledu na to, zda jsou nebo nejsou rozd�leny na ��sti.

P��kaz "\module <soubor> " automaticky zalo�� sekci s n�zvem
"Modul <soubor>" a deklaruje sv�j jmenn� prostor.
Toto chov�n� lze zm�nit, viz~\cite[nazvy], \cite[module].

P��kaz "\title<n�zev>\par"\du{title} vytiskne n�zev dokumentu v�t��m p�smem a v
r�me�ku. Je-li definov�no makro "\projectversion"\du{projectversion},
bude jeho obsah vyti�t�n drobn� vpravo naho�e dopln�n� zep�edu textem 
"verze".  Pokud v� projekt nem� verzi, m��e se hodit t�eba: 

\begtt
\def\projectversion{\the\day. \the\month. \the\year}
\endtt

P��kaz "\author<text>\par"\du{author} nap�e do 
st�edu ��dku tu�n� "<text>",
co� b�v� obvykle jm�no autora (jm�na autor�).

Do z�hlav� ka�d� str�nky se za�ne p�episovat zleva n�zev aktu�ln�
sekce a zprava n�zev dokumentu. U�ivatel m��e text pro prav� z�hlav�
zm�nit zm�nou makra "\headtitle"\du{headtitle}.

P��kazy "\sec" a "\subsec" mohou m�t v hranat� z�vorce nepovinn�
parametr "<lejbl�k>". V takov�m p��pad� vypadaj� parametry takto:
"\sec"~"[<lejbl�k>] <n�zev sekce>\par". Po takov�m pou�it� je mo�n�
se na sekci (podsekci) odkazovat p��kazem "\cite[<lejbl�k>]". Tento p��kaz se
prom�n� v ��slo odkazovan� sekce (podsekce) a nav�c se stane
aktivn�m odkazem.

Pomoc� p��kazu "\savetocfalse"\du{savetocfalse} lze p�ed pou�it�m 
p��kazu "\sec" nebo "\subsec" zajistit, �e n�zev sekce se 
nedostane do obsahu a nebude m�t sv� ��slo. M�sto ��sla se 
vytiskne obsah makra "\emptynumber"\du{emptynumber}, kter� je
implicitn� pr�zdn�. P��kaz "\savetocfalse" ovlivn� jen
prvn� n�sleduj�c� "\sec" nebo "\subsec".

\subsec [krizodkaz] K��ov� odkazy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

C�l, kam sm��uje odkaz, je pot�eba vyzna�it pomoc� "<lejbl�ku>".
To je mo�n� ud�lat v p��kaze "\sec", "\subsec" (viz p�edchoz� 
sekci~\cite[kapsec]) nebo kdekoli v textu samostatn�m p��kazem
"\label[<lejbl�k>]"\du{label}. Tak� je mo�n� odkazovat na ��slo ��dku
(viz sekci~\cite[lineodkazy]).
V�echny lejbl�ky musej� b�t jednozna�n� (bez ohledu na jejich typ)
nap��� cel�m dokumentem.

P��kaz "\pgref[<lejbl�k>]"\du{pgref} expanduje na ��slo strany, na kter� se
vyskytuje c�l odkazu. P��kaz "\numref[<lejbl�k>]"\du{numref} expanduje 
v~z�vislosti na typu c�le na:

\begitems
\item * ��slo sekce, je-li c�lem sekce,
\item * dvoj��sl� "<sekce>.<podsekce>", je-li c�lem podsekce,
\item * ��slo ��dku, je-li c�lem ��dek zdrojov�ho k�du,
\item * pr�zdn� makro, je-li "<lejbl�k>" deklarovan� pomoc� "\label".
\enditems

Oba p��kazy "\pgref" a "\numref" expanduj� na uveden� texty bez dal��
inteligence. Tj. v�stupn� text se nest�v� klikateln�m odkazem. 

K aktivaci odkazu v PDF m�du slou�� 
makro "\ilink"~"[<lejbl�k>]{<text>}"\du{ilink}. Toto makro vytiskne mod�e
"<text>", kter� se st�v� klikateln�m odkazem na c�l, deklarovan�
pomoc� "<lejbl�ku>". Tak�e ji� zn�m� p��kaz "\cite[<lejbl�k>]"\du{cite}
ud�l� zhruba to sam�, jako "\ilink[<lejbl�k>]{\numref[<lejbl�k>]}".
Skute�n� p��kaz "\cite" nav�c ov���, zda nen� "\numref[<lejbl�k>]"
pr�zdn� makro. Pokud je, obarv� nam�sto v�stupu "\numref" 
v�stup makra "\pgref".

Pokud "<lejbl�k>" jako argument p��kazu "\pgref", "\numref" nem� sv�j
c�l, p��kaz "\pgref" expanduje na hodnotu $-1000$ a "\numref"
expanduje na pr�zdn� v�stup. Jsou to expanzn� makra, tak�e v nich nen�
implementov�n nap��klad tisk varov�n�. Pod�vejte se na definici
p��kazu "\cite" (na stran�~\cite[@\nb cite]), jak se d� tisk varov�n�
implementovat.

Makro "\module"~"<jm�no> " zalo�� sekci s lejbl�kem "m:<jm�no>", tak�e
lze na n� pak odkazovat. Nap��klad si m��ete vytvo�it makro

\begtt
\def\refmodul[#1]{\ilink[m:#1]{\tt#1}}
\endtt
%
kter� aktivizuje sv�j parametr, pokud tento je n�zvem n�jak�ho
modulu. T�eba "\refmodul[base]" vytiskne slovo "base" strojopisem a
mod�e a st�v� se klikateln�m odkazem na za��tek sekce
\uv{Modul base}, pokud je tato sekce zalo�ena p��kazem "\module".

Makra "\dg", "\dgn", "\dgh" intern� provedou p��kaz "\label[@<slovo>]"
a makra "\dl", "\dln", "\dlh" provedou p��kaz 
"\label[@<dlouh� slovo>]", kde "<dlouh� slovo>" je "<slovo>" 
po transformaci podle aktu�ln�ho jmenn�ho prostoru.
Na m�sta, kde jsou slova dokumentovan�, je tedy mo�n� odkazovat
nap��klad pomoc� 
"\link[@<slovo>]{<slovo> dokumentovan� na stran�~\pgref[@<slovo>]}". 

Makro "\api{<slovo>}" intern� provede "\label[+<slovo>]", tak�e je
mo�n� na toto m�sto odkazovat t�eba pomoc� 
"\ilink[+<slovo>]{API: <slovo>}".

\docbytex{} nenab�z� krom� ��sel sekc�, podsekc� a ��sel ��dk� ��dn� dal��
automatick� ��slov�n�. Pokud tedy chcete implementovat nap�. ��slov�n�
obr�zk�, ��sla publikac� atd., mus�te si napsat makra vlastn�.
K tomu m��ete vyu��t makro
"\labeltext[<lejbl�k>]{<text>}"\du{labeltext}, kter� ulo�� v
horizont�ln�m m�du do sazby neviditeln� c�l odkazu, a p�i dal��m
pr�chodu \TeX{}em expanduje makro "\numref" na "<text>".
Pou�it� makra uk�eme na p��klad�, ve kter�m definujeme makro 
"\bib[<lejbl�k>]". Toto makro zah�j� sazbu dal�� polo�ky v seznamu
literatury. Odkazovat na knihu pak lze pomoc� "\cite[b:<lejbl�k>]".

\begtt
\newcount\bibnum
\def\bib [#1]{\par\advance\bibnum by1 \indent
    \llap{[\the\bibnum] }\labeltext[b:#1]{[\the\bibnum]}\ignorespaces}
\endtt

\subsec Vkl�d�n� obr�zk�
%%%%%%%%%%%%%%%%%%%%%%%%

P��kazem "\ifig" "<���ka> <jm�no obr�zku> "\du{ifig} je mo�n� vlo�it obr�zek.
Obr�zek mus� b�t p�ipraven v souboru "fig/<jm�no obr�zku>.eps" (v p��pad�
DVI m�du) a v souboru "fig/<jm�no obr�zku>.pdf" (v~p��pad� PDF m�du). 
Adres��, kde \docbytex{} vyhled�v� obr�zky ("fig/"), lze zm�nit 
p�edefinov�n�m sekvence "\figdir"\du{figdir} . Rozm�r "<���ka>" 
je bez jednotky a ud�v� pom�r po�adovan� ���ky obr�zku ku 
���ce sazby. Obr�zek je um�st�n zarovn�n doleva na odstavcovou zar�ku.

M�te-li p�ipraven obr�zek ve form�tu "eps", pak jej do "pdf" p�evedete
p��kazem

{\def\begtthook{\langleactive}
\begtt 
ps2pdf -dEPSCrop <jm�no obr�zku>.eps
\endtt
\par}

\subsec V��ty
%%%%%%%%%%%%%

Seznam polo�ek obklop�te "\begitems"\du{begitems} a
"\enditems"\du{enditems}. V tomto prost�ed� je text odsazen zleva 
o~odstavcovou zar�ku. Prost�ed� lze vno�ovat. Jednotlivou polo�ku
zah�j�te pomoc� "\item"~"<zna�ka> <text>",\du{item} 
p�itom "<zna�ka>" se
vystr�� vlevo od "<textu>". Je-li "<zna�ka>" hv�zdi�ka, prom�n� se v
punt�k. Dal�� mo�nost: "\item"~"\the\itemno) <text>",\du{itemno} 
co� vytvo�� ��slovan� v��ty, v ka�d�m prost�ed� ��slov�ny od jedn�.

Makro plainu "\item" nen� p�edefinov�no glob�ln�, ale jen uvnit�
"\begitems...\enditems". M��ete tedy pou��t i makro plainu,
pokud se v�m koncept polo�ek nab�zen� \docbytex{}em nel�b�.


\noactive{/*}\noactive{*/}\noactive{//} 
\setlinecomment{\percent} \noactive{\nb\percent} \noactive{\percent\cbrace}


\sec [zmeny] Pro n�ro�n�
%%%%%%%%%%%%%%%%%%%%%%%%

V t�to sekci jsou uvedeny a vysv�tleny definice z�kladn�ch 
p��kaz� \docbytex{}u. U�ivatel si m��e tyto definice zm�nit, pokud chce
zm�nit chov�n� \docbytex{}u. Pokud nap��klad pracuje s jin�m
programovac�m jazykem, m��e si zm�nit makro "\docsuffix" nebo
kompletn� p�edefinovat makra "\module" a "\ins".

\subsec [nazvy] Intern� n�zvy
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P��kazem "\doindex" vytvo�� \docbytex{} automaticky novou
sekci s n�zvem \uv{Rejst��k}. Podobn� p�i tvorb� obsahu nebo nata�en�
modulu vznik� n�zev \uv{Obsah} nebo \uv{Modul}. P�ed n�zvem verze 
v~titulu p�i pou�it� "\projectversion" se objev� sl�vko \uv{verze}.
��st (vytvo�en� pomoc� "\part") m� v z�lo�k�ch uvozuj�c� text 
">> CAST".
Tyto texty jsou definov�ny v makrech
\db titindex, \db tittoc, \db titmodule, \db titversion a \db opartname.

\ifirst {docby.tex}{Intern}{\empty}{--}

Za pov�imnut� stoj�, �e jsou jinak tato makra definov�na p�i pou�it�
klasick�ho "plain"u a jinak p�i pou�it� "csplain"u. To ov�em
neznamen�, �e u�ivatel si tyto n�zvy nem��e p�edefinovat je�t� jinak,
nez�visle na pou�it�m form�tu.

\subsec [hooky] Vlo�en� skupiny p��kaz� (hooks)
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

N�kter� slo�it�j�� makra ("\begtt", palcov� uvozovky, "\ifirst",
"\inext", "\doindex", "\dotoc") dovoluj� vkl�dat u�ivateli na za��tku
zpracov�n� r�zn� p��kazy (tzv.~hooks). Implicitn�
jsou tyto vlo�ky pr�zdn�:

\ifirst {docby.tex}{begtthook}{\empty}{+-}

Makro \db begtthook je vlo�eno po zalo�en� skupiny a nastaven� v�ech
kategori� t�sn� p�ed za��tkem zpracov�n� prost�ed� "\begtt...\endtt".
Makro \db quotehook je vlo�eno po zalo�en� skupiny a nastaven� v�ech
kategori� t�sn� p�ed za��tkem zpracov�n� prost�ed� {\tt\char`\"...\char`\"}.
Makro \db indexhook je vlo�eno makrem "\doindex" po zalo�en� sekce
a p�ed p�echodem do sazby ve dvou sloupc�ch. V tomto dokumentu je v
n�m �vodn� pov�d�n� k rejst��ku. 
Makro \db tochook je vlo�eno makrem "\dotoc" po zalo�en� sekce
p�ed sazbou prvn�ho ��dku obsahu.
Makro \db bookmarkshook je vlo�eno uvnit� skupiny na za��tku
zpracov�n� z�lo�ek. Je mo�n� v n�m nastavit expanze maker
vyskytuj�c�ch se v nadpisech na rozumnou hodnotu pro z�lo�ky.
Pokud nav�c nastav�te "\let\cnvbookmark=\lowercase", budou v�echny
znaky pro z�lo�ky proch�zet filtrem "\lowercase". Uvnit�
"\bookmarkshook" je pak mo�n� nastavit "\lccode" vybran�m znak�m
(nap��klad pro odstran�n� h��k� a ��rek).
Makro \db outputhook je vlo�eno na za��tek v�stupn� rutiny. Je vhodn�
v n�m nastavit vybran� p��kazy na hodnotu "\relax", aby se
neexpandovaly do souboru {\tt.ref}.

P��klady pou�it�

\bgroup
\catcode`'13 \def'{\nb} \catcode`?=13 \def?{<} 
\def\begtthook{\langleactive\mubytein=1}
\begtt
\def\quotehook{\obeyspaces}   % ve v�pisech "..." budou norm�ln� mezery
\def\quotehook{\langleactive} % ?text> se prom�n� na <text>
\def\begtthook{\mubytein=1}   % mezi 'begtt...'endtt bude aktivn� encTeX
\def\begtthook{\setsmallprinting} % uk�zky 'begtt...'endtt budou mal�
\def\begtthook{\catcode`\!=0} % mezi 'begtt...'endtt funguj� !prikazy
\def\indexhook{To �ubrn�te, jak� tu m�m rejst��k.}
\def\outputhook{\let\mylogo=\relax} % \mylogo nebude expandovat
\endtt
\par
\egroup

\subsec [module] P��kaz {\tt\nb module} a {\tt\nb ins}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

U�ivatelsk� dokumentace k t�mto p��kaz�m je v sekci~\cite[cleneni].
P��kaz \db module "<soubor> " na�te soubor s n�zvem 
"<soubor>\docsuffix", kde makro
\db docsuffix obsahuje p��ponu souboru v�etn� te�ky.

\ilabel [linkincomment] {extension}
\insdef docsuffix  

P��kaz "\module" vlo�� n�zev �ten�ho souboru (bez p��pony) 
do pomocn�ho makra
\db modulename. Toto makro pak vyu��v� p��kaz 
\db ins "<pripona> <text> ".

\inssdef ins

\subsec Zelenaj�c� koment��e
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P��kazy "\ifirst" a "\inext" si tak� v��maj� (implicitn�) C koment���
tvaru "//..<eol>" a "/* .. */". Tyto koment��e barv� ve v�pisu
programu zelen�. Zru�it tuto vlastnost lze p��kazem "\noactive<string>".
Pomoc� \db setlinecomment "{<string>}" lze nastavit nov� typ koment���, 
kter� budou barveny zelen� od "<string>" do konce ��dku. P��kazy maj� glob�ln�
platnost. Nap��klad

{\def\begtthook{\mubytein=1}
\begtt
\noactive{/*}\noactive{*/}\noactive{//} 
\setlinecomment{\percent} \noactive{\nb\percent}}
\endtt
\par}
\noindent
nastav� koment��e podle zvyklost� v \TeX{}u a PostScriptu.

P��kazem \db setlrcomment "{<lev�>}{<prav�>}"
lze nastavit koment��e typu "/*...*/".

Pro zm�nu vlastnost� obarvov�n� koment��� sta�� uveden� makra
pou��t. Kdo chce v�d�t, jak jsou implementovan�, nech� �te d�le.

\inext {mubyte}{\empty}{+-}

Uveden� p��kazy jsou pr�zdn� v m�du bez enc\TeX{}u a p�i
detekci enc\TeX{}u zap�� informace do enc\TeX{}ov� tabulky
prost�ednictv�m primitiv� "\mubyte...\endmubyte".

P��kazy \db linecomment a \db leftcomment se d�ky enc\TeX{}u
automaticky vlo�� p�ed detekovanou sekvenci znak�. Tyto 
p��kazy nastav� barvu textu na zelenou:

\inext {linecomment}{\empty}{+-}

Na druh� stran� p��kaz \db rightcomment pot�ebuje vypnout zelenou barvu
a� po p�esko�en� detekovan� sekvence. Proto enc\TeX{} v tomto p��pad�
detekovanou sekvenci zru�� a p��kaz "\rightcomment" m� za �kol ji vr�tit
do sazby zp�t a teprve pot� pomoc� \db returntoBlack se vr�tit 
k~�ern� barv�.

\inext {returntoBlack}{\empty}{+-}

Je pot�eba vysv�tlit, pro� p�ep�na�e barev jsou tak komplikovan�
zaps�ny. P�ep�na� toti� v PDF zap�n� barvu nez�visle na skupin� a
barva textu se dr�� tak dlouho, dokud nen� pou�it jin� p�ep�na� barvy.
Ka�d� tisk ��dku k�du je uveden p�ep�na�em "\Black", tak�e p�i
pozn�mce \uv{do konce ��dku} sta�� jen p�epnout na "\Green". Ov�em
uvnit� koment��e se m��e objevit link obalen�
p��kazy "\Blue...\Black" (viz nap�. ��dek~\cite[linkincomment] v
p�edchoz� sekci). Pak ale chceme, aby "\Black" vr�til barvu
"\Green". Proto je provedeno p�edefinov�n� pomoc� "\let". Toto
p�edefinov�n� je lok�ln�. Proto�e ��dek je ti�t�n uvnit� skupiny, je
dal�� ��dek u� �ern�.

P�i tisku koment��e, kter� m� �vodn� a koncov� znak a m��e p�es�hnout
jeden ��dek, mus�me glob�ln� p�edefinovat "\Black" na "\Green", aby i
dal�� ��dky (uvozen� p��kazem "\Black") byly zelen�. Koncov� znak 
koment��e pak mus� uv�st barvy do p�vodn�ho stavu. 

\docbytex{} inicializuje pozn�mky podle pravidel jazyka C:

\inext {setlinecomment}{\empty}{+-}

\sec [design] Pro design�ry
%%%%%%%%%%%%%%%%%%%%%%%%%%%

N�sleduje dokumentace definic maker ovliv�uj�c� vzhled dokumentu.
Jejich p�edefinov�n� m��e zp�sobit zm�nu vzhledu podle po�adavku
u�ivatele. M�sto komplikovan�ch maker s mno�stv�m parametr� pro ��zen�
vzhledu jsou zde jednoduch� dob�e dokumentovan� makra pro jedno
pou�it�.  P�edpokl�d� se, �e p�i pot�eb� jin�ho vzhledu dokumentu je
u�ivatel p�edefinuje.

Makra zab�vaj�c� se vzhledem dokumentu jsou
pokud mo�no odd�lena od slo�itosti ostatn�ch maker, ve kter�ch prob�h�
hlavn� zpracov�n� \docbytex{}u. To umo��uje design�rovi zam��it se
jen na programov�n� vzhledu a neutopit se v r�zn�ch cyklech a
rekurz�ch intern�ch maker \docbytex{}u.

Typicky jsou makra pro vzhled ve dvou verz�ch: pro pdf\TeX{} a bez
pdf\TeX{}u. To je d�vod, pro� ve v�pisech se �asto vyskytuje test
"\ifx\pdfoutput\undefined".

\subsec Parametry a pomocn� makra pro nastaven� vzhledu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Velikost \db hsize ani \db vsize nem�n�me. Bu� si ji nastav� u�ivatel,
nebo se p�evezme velikost z~plainu (vhodn� pro pap�r letter) �i
csplainu (vhodn� pro pap�r A4). Nastavujeme ale v�t�� \db parindent,
nebo� chceme do prou�ku vymezen�ho "\parindent" d�t podbarven�
�tvere�ky u n�zv� sekc�. 

\ifirst {docby.tex}{parindent=}{\empty}{+-}

P�iprav�me si \uv{z��enou ���ku} \db nwidth vyu�itou nap�. jako ���ka z�hlav�:

\inext {nwidth}{\empty}{+-}

P��kazem plainu "\raggedbottom"
nastav�me pru�nost str�nky dole, a ne mezi jednotliv�mi ��dky.
Nastaven�m "\exhyphenpenalty=10000" zak�eme zlom za poml�kou
(v~tisku rozsahu str�nek, nap�. 11--13, takov� zlom p�sob� ru�iv�).

\inext {raggedbottom}{\empty}{+-}

Zavedeme pot�ebn� fonty 
\db bbf, \db bbbf, \db btt,
\db ttsmall, \db rmsmall, \db itsmall a \db partfont.

\inext {bbf=}{\empty}{+-}

Makro \db setsmallprinting p�epne do mal�ho strojopisu, p�iprav�
\db ttstrut vhodn� velikosti a pomoc� "\offinterlineskip" p�iprav� tisk
��dk� v re�imu, kdy se o sebe op�raj�. Hodnota "\parskip" je nastavena
na "-1pt", aby doch�zelo k m�rn�mu p�ekr�v�n� a nevznikaly v tisku
nebo na obrazovce pruhy. Analogicky pracuje makro \db setnormalprinting.

\inext {setsmallprinting}{\empty}{+-}

V n�vrhu vzhledu pracuji jen s barvami
\db Blue, \db Red, \db Brown, \db Green, \db Yellow a \db Black.
Pokud budete cht�t dal�� barvy, definujte si je.\par\penalty1234

\inext {pdfoutput}{\empty}{+-}

Barvy jsou definov�ny pomoc� makra \db setcmykcolor, kter� je v
p��pad� DVI v�stupu nastaveno na pr�zdn� makro a v p��pad� PDF v�stupu
je pou�it PDF~"\special". Tak�e p��kazy "\Brown" atd. je mo�n� pou��t i
ve verzi maker pro DVI, ov�em v t�to verzi neud�laj� nic.
Barva \db oriBlack je konstantn� �ern� barva. N�kter� makra toti�
norm�ln� "\Black" p�edefinov�vaj� a pak se pot�ebuj� vr�tit pomoc�
"\oriBlack" ke skute�n� �ern� barv�.

Makro \db rectangle "{<v��ka>}{<hloubka>}{<���ka>}{<obsah>}"
vytvo�� r�me�ek o stanoven�ch rozm�rech se stanoven�m obsahem.
V PDF verzi je r�me�ek ve tvaru pln�ho �lut�ho obd�ln�ku na kter�m
se nach�z� "<obsah>" zat�mco v~DVI verzi se vytvo�� obrysov� r�me�ek.
Pozor: parametr "<obsah>" mus� obsahovat p�ep�na� barvy, jinak nebude v
PDF verzi viditeln�. Na druh� stran� makro "\rectangle" se postar� 
o n�vrat do \uv{norm�ln�} �ern� barvy.

\inext {pdfoutput}{\empty}{+-}

Nakonec p�iprav�me makro \db docbytex jako zkratku pro logo \docbytex{}u.

\inext {def\nb docbytex}{\empty}{+-}

\subsec Vzhled sekc� a podsekc�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Makra \db printsec "{<nadpis>}" a \db printsecbelow,
jsou vol�na z makra pro vytvo�en� sekce "\sec" a maj� za �kol
vytisknout nadpis. Ostatn� problematika, kterou mus� �e�it makro
"\sec" (reference do obsahu, c�lov� reference, ��sla sekc�, plovouc�
z�hlav� atd.) je zde odst�n�na a nemus�me se j� v tuto chv�li zab�vat.

Mus�me ale dodr�et n�sleduj�c� �mluvu: Na za��tku makra "\printsec"
p�ejdeme pro jistotu do vertik�ln�ho m�du, pak vlo��me pot�ebn�
mezery, pak vlo��me text nadpisu. V okam�iku, kdy p�ejdeme do
horizont�ln�ho m�du, vlo��me makro "\makelinks", kter� zajist�
um�st�n� c�l� odkaz�. Nakonec p�ejdeme do vertik�ln�ho m�du p��kazem
"\par" a {\it nevkl�d�me ��dn� dal�� vertik�ln� mezery}. Makro "\sec" vlo�� pod
vyti�t�n� nadpis do horizont�ln�ho seznamu dal�� prvky a posl�ze 
zavol� "\printsecbelow". Tam teprve vlo��me mezery obvykle blokovan�
proti zlomu pomoc� "\nobreak". Z�kladn� �azen� vertik�ln�ho seznamu 
v \TeX{}u toti� vypad� takto: box, (whatsit, mark, atd.), penalty, glue. 
O objekty uveden� v~z�vorce se postar� "\sec", my zde �e��me jen box
(v makru "\printsec"), a d�le penaltu a glue (v makru "\printsecbelow").

K dispozici m�me hodnotu "\secnum" a "\subsecnum" a d�le m��eme pou��t
test "\ifsavetoc", kter�m se pt�me, zda dan� nadpis bude v
obsahu. Nebude-li, m�li bychom m�sto "\the\secnum" tisknout
"\emptynumber". V makru "\seclabel" je obsah lejbl�ku sekce, nebo
je makro pr�zdn�. To m��eme vyu��t p�i tisku v re�imu \uv{nahrubo},
nap��klad tisknout tyto lejbl�ky do okraj�. \docbytex{} tuto
vlastnost implicitn� neimplementuje.

\ifirst {docby.tex}{def\nb printsec }{\empty}{+-}

Makra \db printsubsec a \db printsubsecbelow funguj� analogicky jako pr�v�
zm�n�n�, ale spolupracuj� s makrem "\subsec".

\inext {def\nb printsubsec }{\empty}{+-}

Makro \db printpart vytiskne nadpis ��sti a dop�edu d� velik� 
p�smeno. Makro \db printpartbelow tiskne mezeru pod nadpisem ��sti.

\inext {def\nb printpart }{\empty}{+-}

Makro \db emptynumber, kter� se pou�ije p�i "\savetocfalse", je
implicitn� nastaveno na pr�zdnou hodnotu.

\inext {emptynumber}{\empty}{+-}

\subsec Titul, autor
%%%%%%%%%%%%%%%%%%%%

Makro \db title "<titul>\par" �te parametr "<titul>"
pomoc� makra "\secparam", kter� se postar� o~p��padn� 
ignorov�n� mezery na konci parametru (viz~sekci~\cite[secsec]). 
Makro "\secparam" ulo�� parametr
"<titul>" do tokenlistu "\sectitle" a spust� intern�
\db iititle. Toto makro pracuje ve dvou m�dech
(DVI a PDF). V~obou m�dech "\iititle" ulo�� "<titul>" do makra 
"\headtitle" (pokud je toto makro pr�zdn�, tedy neinicializovan�
u�ivatelem) a pomoc� p��kazu "\noheadline" potla�� na aktu�ln� str�nce
tisk z�hlav�.

\inext {def\nb title}{\empty}{+-}

Makro "\title" v DVI verzi je prost� "\centerline", zat�mco v PDF
verzi tiskne podkladov� obd�ln�k ���ky "\nwidth".

Pokud nen� makro \db projectversion definov�no, nastav�me mu v�choz�
hodnotu jako pr�zdn� makro:

\inext {ifx\nb project}{\empty}{+-}

Makro \db author "<autor>\par" je spole�n� v obou m�dech. 
Um�st� jm�no autora tu�n� a na st�ed.

\inssdef author

\subsec Hlavi�ky a pati�ky
%%%%%%%%%%%%%%%%%%%%%%%%%%

\docbytex{} nem�n� v�stupn� rutinu plainu. Vyu��v� tedy klasick�
n�stroje na modifikaci vzhledu, tj. text "\footline" a "\headline".

N�vrh vzhledu str�nky nepo��t� s pravou a levou
stranou, proto�e dokumentaci v�t�inou �teme na monitoru a kdy� ji
tiskneme, tak kdo v�, na �em...

Text \db footline je nastaven tak, aby byla str�nkov� ��slice uprost�ed
podbarvena p��padn� or�mov�na pomoc� "\rectangle".

\inext {footline}{\empty}{+-}

Text \db headline se m�n�. Implicitn� obsahuje jen makro \db normalhead,
ale p�i pou�it� p��kazu "\noheadline" na chv�li zm�n� sv�j obsah.

\ilabel[headlinebox] {headlinebox}
\inext {headline}{\empty}{+-}

Makro "\normalhead" ulo�� str�nkov� link pomoc� "\savepglink"
a "\vbox/\hbox" gymnastikou vytvo�� pot�ebn� z�hlav�. Zleva je ti�t�n
n�zev sekce ("\firstmark") a zprava konstantn� text "\headtitle".

Makro \db noheadline nastav� "\headline" p�echodn� na text, podle
kter�ho se vlo�� jen str�nkov� odkaz a provede zm�na obsahu
"\headline" na standardn� hodnotu. Operace mus�me prov�d�t glob�ln�,
proto�e jsme uvnit� v�stupn� rutiny.

\inssdef noheadline

Makro \db headtitle obsahuje text shodn� v cel�m dokumentu ti�t�n�
vpravo v z�hlav�. Implicitn� je makro pr�zdn�, po pou�it� p��kazu
"\title" obsahuje n�zev dokumentu, pokud si u�ivatel makro nedefinoval s�m.

\inext {headtitle}{\empty}{+-}

Pomocn� makro \db headlinebox ud�l� v DVI m�du pr�zdn� �tvere�ek a
v PDF m�du pln� (�lut�) �tvere�ek. Je pou�ito na ��dku~\cite[headlinebox]
pro vytvo�en� �tvere�kovan� ��ry v z�hlav�,

\inext {ifx\nb pdfoutput}{\empty}{+-}

\subsec Tisk c�le odkazu a odkaz� pod �arou
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

C�l odkazu vytvo�en� makry "\dg" nebo "\dl" je pot�eba vytisknout
v�razn�, aby jej �ten�� pokud mo�no rychle na�el. Tisk
prob�h� v makru \db printdg "{<p�ed>}{<slovo>}{<za>}", kde "<p�ed>" je
text p�ed slovem a "<za>" je pr�zdn� parametr nebo obsahuje "()",
pokud tyto z�vorky u�ivatel v p��kaze "\dg", "\dl" pou�il.

Sou�asn� n�vrh \docbytex{}u tiskne z t�chto t�� parametr� jen jeden,
sice "<slovo>". V DVI m�du tiskne "<slovo>" v r�me�ku a v PDF m�du
tiskne "<slovo>" �erven� a na pozad� je �lut� obd�ln�k.

\inext {ifx\nb pdfoutput}{\empty}{+-}

�erven� text se tiskne pomocn�m makrem \db printdginside, kter� tiskne
jednodu�e �erven�, pokud ke slovu neexistuje "\api" c�l a tiskne
�erven� pomoc� "\ilink", jestli�e existuje "\api" c�l.

\inext {def\nb printdginside}{\empty}{+-}

�daj pod ��ru tiskneme makrem 
\db printfnote "{<p�ed>}{<d-slovo>}{<za>}{<k-slovo>}", 
kde parametry "<p�ed>" a "<za>" maj� stejn� v�znam, jako u makra "\printdg".
Parametr "<k-slovo>" (kr�tk� verze slova) tiskneme �erven�, 
ostatn� parametry �ern�. Parametr "<d-slovo>" (dlouh� verze slova) nen�
pou�it.

K naprogramov�n� tohoto makra vyu�iji makro
"\specfootnote"~"{<text>}", kter� po�le text do speci�ln� pozn�mky pod
�arou. D�le je pot�eba v�d�t, �e "\pgref[+<slovo>]" vr�t� ��slo
strany, kde je "\api" deklarace "<slova>" nebo vr�t� $-1000$. 
Toto ��slo vlo��me do "\apinum" a je-li nez�porn�, tak jej uvedeme
jako prvn� v seznamu str�nek a podtr�en�. 
Seznam str�nek vytiskneme pomoc�
"\listofpages{<slovo>}". V seznamu bude chyb�t str�nka "\apinum", proto�e
makro "\listofpages" ji vynech�v�. Pr�zdn� seznam str�nek (p�i kter�m
netiskneme dvojte�ku ani ��rku) pozn�me podle toho, �e "\box0" m�
nulovou ���ku.

\inext {def\nb printfnote}{\empty}{+-}

\subsec Tisk �daje v obsahu a v rejst��ku
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

P��kaz \db ptocline "{<��slo>}{<text>}{<strana>}" se postar� o tisk
�daje o sekci nebo ��sti do obsahu. D�le p��kaz \db ptocsubline
"{<��slo>}{<text>}{<strana>}" vytiskne �daj o subsekci. Jak je patrn�,
tyto dva p��kazy se li�� jen o jeden "\indent":

\inext {def\nb ptocline}{\empty}{+-}

P��kaz \db mydotfill vytiskne te�ky do obsahu tak, aby byly pod sebou
zarovn�ny.

P��kaz \db ptocentry "<typ>{<slovo>}{<k-slovo>}" vytiskne jednu polo�ku
o dokumentovan�m slov� do obsahu. Parametr "<typ>=+", pokud je v dan�m
m�st� "\api" dokumentace, a "<typ>=@", je-li v dan�m m�st� "\dg"
dokumentace. "<k-slovo>" je pr�zdn�, ale p�i pou�it� "\dl" je v n�m
kr�tk� verze slova, zat�mco ve "<slovo>" je dlouh� verze slova.
Dlouhou verz� odkazujeme, kr�tkou verzi tiskneme. 

\inext {def\nb ptocentry}{\empty}{+-}

Kdyby bylo pot�eba tisknout text p�ed slovem nebo z�vorky za slovem,
je mo�n� vyu��t kontroln� sekvenci "\csname-<slovo>\endcsname" jako
v n�sleduj�c�m makru "\printindexentry".

Makro \db myldots vytvo�� t�i te�ky, kter� jsou zarovn�ny s ostatn�mi
te�kami v obsahu.

Makro \db printindexentry "{<slovo>}" tiskne �daj o slov� do
rejst��ku. Za��n� ve vertik�ln�m m�du uvnit� sloupce, vytiskne �daj a
pomoc� "\par" se mus� vr�tit do vertik�ln�ho m�du.

\inext {def\nb printindexentry}{\empty}{+-}

Pomoc� \db separeright ulo��m do "\tmpa" text vlevo od slova a do
"\tmpb" text vpravo od slova. Makro "\refdg" tyto �daje ulo�ilo do
makra "\csname-<slovo>\endcsname" odd�len� od sebe zna�kou "\right".
Pomoc� makra "\pgref[@<slovo>]" z�sk�m str�nku s "\dg" deklarac�
slova. Pomoc� "\pgref[+<slovo>]" z�sk�m str�nku s "\api" deklarac�
slova. Tuto str�nku (pokud existuje) tisknu podtr�en�.

\subsec Tisk zdrojov�ho textu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Makra "\ifirst" a "\inext" p�etisknou po�adovanou ��st zdrojov�ho
textu. P�i �e�en� n�vrhu vzhledu tisku n�s nyn� pouze zaj�m�, �e tato
makra zalo�� skupinu, pak zavolaj� p��kaz \db printiabove, pak pro tisk
ka�d�ho ��dku zavolaj� \db printiline "{<��slo>}{<text ��dku>}" a nakonec p�ed
ukon�en�m skupiny se spust� \db printibelow. Pr�v� tato t�i makra si
nyn� naprogramujeme. Budeme rozli�ovat mezi DVI a PDF
m�dem.

\ilabel [isnameprinted]  {raise8}
\ilabel [isnameprinted2] {pt \nb inputfilename}
\inext {ifx\nb pdfoutput}{\empty}{+-}

V DVI m�du tiskneme naho�e ��ru se jm�nem souboru pomoc� "\leaders"
a makra \db specrule. Dole pak tiskneme jen jednoduchou ��ru.
V~PDF m�du naho�e pouze nastav�me "\setsmallprinting" 
a vlo��me malou mezeru. Dole vlo��me st�edn� mezeru.

Makro "\printiline" p�ejde nejprve do horizont�ln�ho m�du, tam vlo�� v
DVI m�du podp�ru a d�le box s ��slem a box s ��dkem. Mezi ��dky
vkl�d�m penaltu~11. V PDF m�du se m�sto podp�ry tiskne cel� �lut�
prou�ek v~"\rlap". Proto�e p�es prvn� ��dek je pot�eba vpravo nahoru
vytisknout jm�no souboru (pozd�ji ne� �lut� prou�ek), je pot�eba
zjistit, zda tisknu prvn� ��dek nebo dal�� ��dky. K tomu slou��
kontroln� sekvence \db isnameprinted, kter� je typicky "\undefined".
Po vyti�t�n� jm�na souboru (��dky~\cite[isnameprinted] a~\cite[isnameprinted2]) 
nastav�m "\isnameprinted" na "\relax" a t�m pozn�m, �e u� je pr�ce
provedena. A� makro "\ifirst" nebo "\inext" ukon�� skupinu, bude zase
m�t "\isnameprinted" hodnotu "\undefined".

\subsec [begtt] Tisk z prost�ed� {\tt\nb begtt}/{\tt\nb endtt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Makro "\begtt" zalo�� skupinu a zavol� \db printvabove.
D�le pro ka�d� ti�t�n� ��dek vol� makro \db printvline "{<��slo>}{<text ��dku>}"
a nakonec zavol� \db printvbelow. ��slo ��dku jsme se rozhodli
nevyu��t. V DVI verzi kresl�me jen ��ry naho�e a dole. V~PDF verzi 
kresl�me �lut� ��ry naho�e a dole a v~ka�d�m ��dku pomoc� "\rlap" kresl�me 
�lut� obd�ln�ky vpravo a vlevo.

\inext {ifx\nb pdfoutput}{\empty}{+-} 

\subsec Vkl�d�n� obr�zk�
%%%%%%%%%%%%%%%%%%%%%%%%

Obr�zky jsou vkl�d�ny nalevo podle odstavcov� zar�ky. Tato
zar�ka je dostate�n� velk�, tak�e to p�sob� docela dob�e.
Celkovou ���ku prostoru pro obr�zek \db figwidth spo��t�m jako
"\hsize" m�nus "\parindent"

\inext {newdimen\nb figwidth}{\empty}{+-}

Makro \db ifig "<pom�r ���ky> <n�zev> " v DVI m�du vlo�� "<n�zev>.eps" a
vyu�ije k tomu makrobal�k {\tt epsf.tex}. V PDF m�du vlo��
"<n�zev>.pdf" a vyu�ije k tomu pdf\TeX{}ov� primitivy "\pdfximage",
"\pdfrefximage", "\pdflastximage".

\inext {ifx\nb pdfoutput}{\empty}{+-}

Makro \db figdir obsahuje adres��, ze kter�ho se obr�zky lov�.

\subsec V��ty
%%%%%%%%%%%%%

Makra pro v��ty jsou natolik jednoduch�, �e asi nepot�ebuj� dal��ho
koniment��e. \db begitems zah�j� prost�ed� s v��ty, \db enditems ukon��
toto prost�ed�, \db itemno ��sluje a \db dbtitem "<zna�ka> " zahajuje polo�ku,
p�i�em� se uvnit� prost�ed� p�evt�l� na \db item.

\inext {newcount\nb itemno}{def\nb enditems}{++}


\sec [implementace] Pro otrl�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Zde je dokumentov�na implementace \docbytex{}u. Je zde v�pis 
v�ech jeho intern�ch maker v�etn� podrobn�ho
koment��e, jak funguj�. Asi nen� rozumn� tato makra m�nit, leda�e by
si cht�l �ten�� naprogramovat \docbytex{} vlastn�.

\subsec Pomocn� makra
%%%%%%%%%%%%%%%%%%%%%

Makro \db dbtwarning zprost�edkuje tisk varovn�ch hl�ek:

\inext {def\nb dbtwarning}{\empty}{+-}

Makra \db defsec "{<text>}", \db edefsec "{<text>}" a \db undef "{<text>}"
jsou zkratky za �ast� operace s~"\csname<text>\endcsname".

\inext {def\nb defsec}{\empty}{+-}

Makro "\undef" je pot�eba pou��t takto:

{\def\begtthook{\langleactive\mubytein=1}
\begtt
\undef{<text>}\iftrue <sekvence nedefinovan�> \else <sekvence definovan�> \fi
\endtt
\par}

Nutnost pou�it� "\iftrue" se bohat� vyplat�, a� budeme "\undef" p�eskakovat
vn�j��mi podm�nkami typu~"\if".

Definuji makro \db nb (norm�ln� backslash). Toto makro je pak mo�n�
pou��vat p�i vyhled�v�n� textu s t�mto znakem. Rovn� definuji aktivn�
tabel�tor a z�stupn� sekvence \db obrace, \db cbrace, \db percent
a \db inchquote.

{\catcode`\%=12 \noactive{\nb %} \noactive{[%} }

\inext {catcode}{\empty}{+-}

Makro \db softinput je vysv�tleno v \TeX{}booku naruby na stran� 288,
tak�e bez koment��e.

\inext {def\nb softinput}{\empty}{+-}

Makro \db setverb nastav� kategorie v�ech speci�ln�ch znak� na
norm�ln�. Viz \TeX{}book naruby, stranu~28. 

\inext {def\nb setverb}{\empty}{+-}

\subsec Inicializace
%%%%%%%%%%%%%%%%%%%%

Ohl�s�me se na termin�l:

\inext {This is DocBy}{\empty}{+-}

Makro \db dbtversion obsahuje verzi \docbytex{}u a je definov�no 
na za��tku souboru {\tt docby.tex}. Tam je autor \docbytex{}u pozm�n�, 
pokud p�ejde na novou verzi.

\inssdef dbtversion

Je-li pou�it "csplain", je aktivov�n UTF-8 vstup pomoc� enc\TeX{}u. To 
ale bohu�el nen� kompatibiln� s pou�it�m enc\TeX{}u \docbytex{}em.
Je tedy pot�eba deaktivovat UTF-8 vstup a �esk� texty napsat nap��klad
v ISO-8859-2.

\inext {utf8off}{\empty}{+-}

%Inicializujeme csplain m�d:
%
%\inext {ifx\nb chyph\nb undefined \nb else}{\empty}{+-}

Inicializujeme enc\TeX{}ov� m�d:

\inext {encTeX ??}{\empty}{+-}

Makro \db enctextable "{<slovo>}{<t�lo makra>}" vlo�� do enc\TeX{}ov�
tabulky vzor "<slovo>". Jakmile takov� vzor enc\TeX{}
objev�, zru�� jej ze vstupn�ho proudu a prom�n� jej v kontroln�
sekvenci "\.<slovo>", kter� expanduje na "<t�lo makra>". 
Nap��klad makro "\dg"~"<slovo>" aktivuje pro enc\TeX{} "<slovo>", tak�e
provede (mimo jin�) 
"\enctextable{<slovo>}{\sword{<slovo>}}", co� zp�sob�,
�e se "<slovo>" v na��tan�m zdrojov�m k�du prom�n� na "\sword{<slovo>}".

Makro "\enctextable" odm�t� ulo�it do enc\TeX{}ov� tabulky slova,
kter� jsou v seznamu \uv{zak�zan�ch} slov \db owordbuffer. Tam jsou
slova (odd�len� z obou stran ��rkou), kter� se nesm�j� aktivovat kv�li 
"\onlyactive". Pro takov� slova provede "\enctextable" jen definici
sekvence "\.<slovo>".

Makro \db noactive "{<text>}" vlo�� do enc\TeX{}ov� tabulky vyhled�van� 
text, kter� ve vstupu z�stane a p�ed n�j bude vlo�ena sekvence \db emptysec.
Proto�e enc\TeX{} neum� ze sv� tabulky zru�it �daj (um� jen p�epsat
informaci, na co se m� vyhled�van� text prom�nit), je pot�eba texty,
kter� u� v encTeXov� tabulce nepot�ebujeme, deaktivovat alespo� pomoc� 
"\noactive".

Na \db sword "{<text>}" se d�ky enc\TeX{}u prom��uj� texty, kter� se maj�
automaticky st�t klikateln�mi linky. 

\inext {def\nb sword}{\empty}{+-}

Makro \db onlyactive "{<p�ed>}{<slovo>}{<za>}" zak�e vkl�dat
"<slovo>" do enc\TeX{}ov� tabulky (vlo�� je do "\owordbuffer", 
ov�em jen za p�edpokladu, �e u� tam nen�),
a nech� cel� text "<p�ed><slovo><za>" prom�nit v~"\oword{#1}{#2}{#3}".
D�le pomoc� "\noactive" dekativuje "<slovo>" (p�i �ten� "\reffile" 
toti� pravd�podobn� bylo aktivov�no).
Makro \db oword "{<p�ed>}{<slovo>}{<za>}"
tiskne norm�ln� "<p�ed>", d�le, pokud je definov�no "\.<slovo>", tak
je spust�, jinak tiskne norm�ln� "<slovo>". Kone�n� tiskne v�dy
norm�ln� text "<za>".

\inext {def\nb onlyactive}{\empty}{+-}

Nakonec inicializujeme DVI/PDF m�d:

\inext {ifx\nb pdfoutput}{\empty}{+-}

\subsec Makra {\tt\nb ifirst}, {\tt\nb inext}, {\tt\nb ilabel}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Deklarujeme \db lineno jako ��slo ��dku, \db ttlineno jako ��slo ��dku
pro "\begtt...\endtt" v�pisy, \db ifcontinue pro ��zen� cyklu a 
\db infile je deskriptor souboru otev�en�ho ke �ten�.
\db ifskipping implementuje u�ivatelsk� \db skippingfalse a 
\db skippingtrue.

\inext {newcount\nb lineno}{\empty}{+-}

%Makra "\ifirst", "\inext" jsou pro u�ivatele pops�na
%v~sekci~\cite[vkladani] a makro "\ilabel" m� sv� pov�d�n� 
%v~sekci~\cite[lineodkazy].

P��kaz \db ifirst "{<soubor>}{<odkud>}{<kam>}{<jak>}" nejprve
pomoc� "\readiparamwhy" analyzuje parametr "<jak>", pak otev�e soubor
ke �ten� primitivem "\openin". Je-li otev�en� ne�sp�n�, vyp�e
varov�n�, jinak si ulo�� n�zev souboru do makra \db inputfilename 
a analyzuje parametry pomoc� "\scaniparam": "<odkud>" je ulo�eno do
"\tmpa" a "<kam>" do "\tmpb". Do "\tmpA" a "\tmbB" se ulo�� po�et
opakov�n� (z konstruktoru "\count=<num>"). Nakonec se spust� makro 
"\insinternal" s expandovan�mi parametry "<odkud>", "<kam>".
K tomu je pou�it zn�m� trik s makrem "\act".

\insdef ifirst 

P��kaz \db inext "{<odkud>}{<kam>}{<jak>}" pracuje analogicky, jako
"\ifirst", pouze neotev�r� soubor, ale pomoc� testu na definovanost
makra "\inputfilename" kontroluje, zda n�hodou nebyl  spu�t�n p��kaz
"\inext" bez p�edchoz�ho "\ifirst".

\insdef inext

V r�mci expanze parametr� chceme, aby zmizely v�echny kontroln� sekvence, kter�
n�m do textu vlo�il automaticky enc\TeX{}. To provede makro
\db noswords.

\inssdef noswords

Makro \db readiparamwhy na�te znaky "+" nebo "-" z parametru "<jak>" a
ulo�� je do sekvenc� \db startline a \db stopline.

\inssdef readiparamwhy

Makro \db scaniparam "<param>^^X<out><outnum>" �te "<param>" 
ve tvaru "\count=<num> <text>". Do sekvence "<out>" ulo�� "<text>"
a do sekvence "<outnum>" ulo�� "<num>". Proto�e konstruktor
"\count=<num>" je nepovinn�, d� trochu v�ce pr�ce parametr analyzovat.
K tomu slou�� i pomocn� makra \db scaniparamA, \db scaniparamB, \db scaniparamC.
V p��pad� nep��tomnosti "\count=<num>" je v~"<outnum>" jedni�ka.

\inssdef scaniparam

Hlavn� pr�ci p�i vkl�d�n� zdrojov�ho textu do dokumentace d�l� makro
\db insinternal s parametry "{<odkud>}{<kam>}".

\ilabel [prvniloop]       {preskakovani}
\ilabel [konec:prvniloop] {ifcontinue \nb repeat}
\ilabel [druhyloop]       {pretisk}
\ilabel [konec:druhyloop] {readnewline \nb repeat}
\ilabel [insinternal:end] {printibelow}
\insdef insinternal

Makro "\insinternal" se skl�d� ze dvou hlavn�ch cykl�. Prvn� (na
��dc�ch~\cite[prvniloop] a�~\cite[konec:prvniloop]) �te postupn� 
��dky ze vstupn�ho souboru (makrem
"\readnewline") a ulo�� je do makra "\etext". V tomto cyklu hled�
v�skyt textu "<odkud>" a nic netiskne.

Druh� cyklus na ��dku~\cite[druhyloop] a�~\cite[konec:druhyloop] 
�te postupn� ��dky ze vstupn�ho
souboru a hled� v�skyt textu "<kam>". V t�to chv�li tiskne pomoc�
makra "\printilineA".

P�ed prvn�m cyklem jsou provedeny p��pravn� pr�ce: nastaven�
kategori�, font�, "\mubytein".
D�le je v p��pravn� f�zi definov�no makro \db testline se separ�torem
"<odkud>", pomoc� n�ho� budeme testovat p��tomnost textu "<odkud>".
Variantn� definice makra "\testline" n�sleduj� pro speci�ln� p��pad
parametru "<odkud>" (viz u�ivatelsk� dokumentace v~sekci~\cite[vkladani]).
Ukon�en� cyklu je ��zeno podm�nkou "\ifcontinue". P��kaz \db nocontinue
provede "\continuefalse", ov�em ne v�dy. Pokud je zad�no "\count>1", tj. 
"\tempnum>1", pak p��kaz pouze zaznamen� v�skyt hledan�ho textu a sn�� 
"\tempnum" o jedni�ku.

\inssdef nocontinue

P�ed druh�m cyklem v makru "\insinternal" jsou provedeny podobn� p��pravn� 
pr�ce jako p�ed
prvn�m, znovu je definov�no makro "\testline", tentokr�t se separ�torem 
"<kam>". Vyhled�v�n� prob�h� podobn�, jako kdy� jsme hledali "<odkud>".

Pomoc� "\ifx+\startline" testujeme, zda tisknout v�choz� ��dek.
Pomoc� "\ifx+\stopline" testujeme, zda tisknout ukon�ovac� ��dek.

Makro "\ilabellist" obsahuje testov�n� p��tomnosti lejbl�k�
deklarovan�ch p��kazem "\ilabel".

Trikoidn� je makro \db returninsinternal "{<text>}{<mo�n� fi>}{<ignoruj>}",
kter� se spust� p�i dosa�en� konce �ten�ho souboru. Marko opust� sv�j
cyklus pomoc� parametru "<ignoruj>", kter� je separov�n textem
"\printibelow", tak�e to p�esko�� v�t�� ��st obsahu makra "\insinternal" a�
po ��dek~\cite[insinternal:end]. Abychom spr�vn� opustili vno�en�
podm�nky, jsou p�e�tena v druh�m parametru p��padn� "\fi" a v makru pou�ita.
Prvn� parametr obsahuje varovac� hl�ku, chceme-li vypsat varov�n�.
Chceme-li b�t zticha, je parametr pr�zdn�.

\insdef returninsinternal

Makro \db readnewline je naproti tomu jednoduch�:

\inssdef readnewline

Pracujeme s ��dkem �ten�ho souboru ve dvou verz�ch: neexpandovan�m
\db text a expandovan�m \db etext p�i "\noswords". T�m m�me zaru�eno,
�e v "\etext" nejsou kontroln� sekvence vytvo�en� enc\TeX{}em (pro
test p��tomnosti "<odkud>" nebo "<kam>" by tam ty sekvence p�ek�ely). 
Verze s enc\TeX{}ov�mi sekvencemi "\text" se pou�ije p�i tisku.

Makro \db printilineA mus� m�t svou inteligenci: nesm� bezhlav� tisknout
pr�zdn� ��dky, ale ty tiskne a� se zpo�d�n�m, n�sleduje-li tisk
nepr�zdn�ho ��dku. T�m je zaru�eno, �e se p�i "\skippingtrue" nevytiskne posledn�
pr�zdn� ��dek. Makro \db lastline m� t�i stavy: "\empty" (na za��tku), 
"\relax" (po vyti�t�n� ��dku), "<��slo ��dku>" (je-li p�edchoz� ��dek 
pr�zdn�).

\insdef printilineA

Pro ulo�en� deklarac� pomoc� \db ilabel "[<lejbl�k>]{<text>}"
slou�� makro \db ilabellist, kter� mus�me nastavit nejprve na pr�zdnou
hodnotu. 

\insdef ilabellist

Makro "\ilabel" nejprve expanduje sv� parametry (pomoc�
"\act") a zavol� intern� \db ilabelee. Toto makro p�id� do
"\ilabellist" toto: 

\def\begtthook{\langleactive\mubytein=1}
\begtt
\expandafter\testilabel\etext\end{<lejbl�k>}{<text>}
\endtt

Makro \db testilabel "<��dek>\end{<lejbl�k>}{<text>}"
si definuje pomocn� makro "\tmp" se separ�torem "<text>", aby
zjistilo, zda je "<text>" uvnit� "<��dek>". Pokud se to povede, 
registruje c�l odkazu pomoc� "\labeltext".

\inext {testilabel}{\empty}{+-}
 
\def\begtthook{}

\subsec P��kazy {\tt\nb begtt}, {\tt\nb endtt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Makro \db begtt a "\endtt" 
je podrobn� pops�no v \TeX{}booku naruby
na stran�ch~27 a�~30.  Makru \db startverb dod�me kompletn�
verbatim text separovan� "\endtt". 
Tento text je d�len� znakem "^^M" (kategorie 12) na ��dky a koncov� ��dek
obsahuje token "\end". Makro spust� ve spolupr�ci s makrem \db runttloop
cyklus a ��dky rozebere, ka�d� ��dek zvlṻ p�ed� makru "\printvline".
Na konci cyklu se provede makro \db endttloop. To ud�l� z�v�re�n�
�innosti (zavol� "\printvbelow", ukon�� skupinu) a pomoc� makra
\db scannexttoken otestuje prvn� n�sleduj�c�
token. Pokud to nen� "\par", nen� pod "\endtt" pr�zdn� ��dek, 
tak�e se provede "\noindent".

\ifirst {docby.tex}{def\nb begtt }{\empty}{+-}

V numerick�m registru "\ttlineno" je ��slo ��dku pr�b�n� zv�t�ovan�
v cel�m dokumentu. Pokud by n�kdo cht�l toto ��slo vyu��t, m��e jej
nulovat nap��klad na za��tku ka�d� sekce.

\subsec [ns] Jmenn� prostory
%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ka�d� jmenn� prostor si udr�uje sv� \db namespacemacro, co� je makro 
s jedn�m parametrem, kter� p��kazem "\namespace{<t�lo makra>}" mimod�k
definuje u�ivatel. Na po��tku je "\namespacemacro" pr�zdn�:

\ifirst {docby.tex}{def\nb namespacemacro}{\empty}{+-}

Ke ka�d�mu jmenn�mu prostoru budeme cht�t p�i�adit lejbl�k. Rozhodl
jsem se za lejbl�k pova�ovat v�sledek expanze "\namespacemacro{@!}".
Budu jej nad�le zna�it "<nslejbl�k>".
Existuje sice ur�it� riziko nejednozna�nosti "<nslejbl�ku>", ale 
p�edpokl�d�m, �e v praxi nenastane.

Ka�d� jmenn� prostor u� na po��tku mus� v�d�t, jak� v�echna lok�ln�
slova obsahuje, aby jejich v�skyt mohl sm��ovat na m�sto, kde je
deklarace "\dl", kter� m��e b�t t�eba pozd�ji ne� v�skyt.  Jmenn�
prostor na sv�m startu mus� tedy do enc\TeX{}ov�ch tabulek ulo�it
v�echna lok�ln� slova a na sv�m konci vr�tit v�e pokud mo�no do
p�vodn�ho stavu.  Je tedy z�ejm�, �e nen� vhodn� �ekat a� na p��kaz
"\dl", ale �e je t�eba vyu��t soubor "\reffile". V prvn�m pr�chodu
tedy jmenn� prostory nemohou b�t aktivn�.

Po p�e�ten� "\reffile" m� ka�d� jmenn� prostor k dispozici makro
"\ns:<nslejbl�k>", kter� obsahuje seznam v�ech sv�ch 
lok�ln� deklarovan�ch slov ve form�tu 

{\def\begtthook{\mubytein=1\langleactive}
\begtt
\locword{<slovo1>}\locword{<slovo2>}\locword{<slovo3>}...
\endtt
\par}

Proto�e ukl�d�n� do enc\TeX{}ov� tabulky je glob�ln�, definujeme 
v r�mci du�evn� hygieny v�echna makra s t�m spojen� glob�ln�. Proto je
prost�ed� "\namespace...\endnamespace" nez�visl� na skupin�ch \TeX{}u.

P�i startu \db namespace je t�eba definovat "\namespacemacro". 
P�vodn� hodnotu "\namespacemacro" ulo��me do "\no:<nslejbl�k>",
abychom se k n�mu mohli na konci prost�ed�
"\namespace...\endnamespace" vr�tit. D�le definujeme makro \db locword
tak, aby ulo�ilo pot�ebn� �daje do enc\TeX{}ov� tabulky a p�ed t�m
je�t� si ulo�ilo st�vaj�c� v�znamy p�edefinov�van�ch kontroln�ch
sekvenc�. Pak se prost� spust� "\ns:<nslejbl�k>". 

\inext {def\nb namespace }{^^B\cbrace}{++}

Na konci \db endnamespace znovu definujeme makro "\locword" tentokr�t tak, aby
vr�tilo pozm�n�n�m sekvenc�m p�vodn� v�znam. Pokud p�vodn� v�znam byl
\uv{nedefinovan� sekvence}, je pot�eba do enc\TeX{}ov� tabulky vlo�it
aspo� "\nword", proto�e zcela odstranit �daj z tabulky nelze. 
D�le se vr�t�me k~p�vodn� hodnot� "\namespacemacro", kterou m�me
ulo�enu v "\no:<nslejbl�k>".

\inext {def\nb endnamespace}{^^B\cbrace}{++}

Uveden� makra pracuj� s u�ite�nou zkratkou \db ewrite, kter� zap�e
text do "\reffile" se zpo�d�n�m (primitivem "\write"), ale expanzi 
ud�l� hned. P�itom neexpanduje "\nb".

\inext {def\nb ewrite}{\empty}{+-}

Enc\TeX{} od startu jmenn�ho prostoru vkl�d� tedy m�sto ka�d�ho
lok�ln�ho "<slova>" kontroln� sekvenci "\.<slovo>", kter� expanduje
na "\lword{<slovo>}". Jakmile se tedy objev� v�skyt lok�ln�ho slova,
pracuje \db lword takto:

\inext {def\nb lword}{\empty}{+-}

Makro \db genlongword "<tmp>{<slovo>}" 
vytvo�� z kr�tk� verze slova dlouhou verzi slova a ulo�� ji do "<tmp>".
V�skyt "<slova>" d�v� o sob� v�d�t v parametru "\ilink" i p�i z�pisu
do souboru sv�m dlouh�m (jednozna�n�m) jm�nem, zat�mco kr�tk� jm�no 
se tiskne.

Zb�v� za��dit �ten� ze souboru "\reffile". Makro 
\db refns "{<nslejbl�k>}" se objev� v souboru v m�st� za��tku jmenn�ho
prostoru a \db refnsend "{<nslejbl�k>}" na konci jmenn�ho prostoru. Mezi
nimi se vyskytuj� "\refdg{<p�ed>}{<slovo>}{<za>}{<k-slovo>}", p�i�em�
si nyn� v��m�me jen takov�ch v�skyt�, kter� maj� nepr�zdn�
"<k-slovo>". Pr�v� tyto v�skyty zanesl do "\reffile" p��kaz "\dl".

\inext {def\nb refns}{\empty}{+-}

Makro "\refns" si zapamatuje p�edchoz� "<nslejbl�k>", kter� je ulo�en 
v makru \db currns, do sekvence "\o:<nov� nslejbl�k>" a definuje pak "\currns"
jako "<nov� nslejbl�k>". P�iprav� tak� v�choz� stav makra "\ns:<nslejbl�k>"
na pr�zdnou hodnotu. Makro "\refdg" pak postupn� pln� buffer
"\ns:<nslejbl�k>" (viz ��dky~\cite[ns1] a�~\cite[ns2] v~definici makra
"\refdg" v~sekci~\cite[reference]). Kone�n� makro "\refnsend" vr�t�
"\currns" do stavu, v jak�m bylo p�ed vstupem do st�vaj�c�ho jmenn�ho 
prostoru. 


\subsec {\tt\nb dg} a p��tel�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Makra \db dg, \db dl, \db dgn, \db dgh, \db dln, \db dlh 
ulo�� do "\tmpA" sv�j n�zev, spust� sken parametr� pomoc� \db dgpar
a nakonec se prom�n� ve svou intern� verzi pomoc�
"\csname ii\tmpA\endcsname".

\inext {def\nb dg}{\count=2 \empty}{+-}

P�edchoz� makra p�iprav� �ten� nepovinn�ho parametru. Hlavn� pr�ci
provede makro \db dparam.

\ilabel [managebrackets] {managebrackets}
\ilabel [ii] {csname ii}
\inext {def\nb dparam}{\empty}{+-}

Je-li za ukon�ovac� z�vorkou "]" mezera, pak je parametr "#2" pr�zdn� (je
separovan� mezerou). V~t�to situaci se makro "\dparam" proto�� je�t�
jednou prost�ednictv�m makra \db nextdparam, kter� se�ere obsah zbytku
makra "\dparam", vlo�� mezeru dovnit� z�vorky a spust� "\dparam" je�t�
jednou. Nyn� u� je mo�n� za��t parametr "#2", tj. "<slovo>" rozd�lit
na ��st p�ed prvn� ��rkou, te�kou, st�edn�kem nebo dvojte�kou a za za
t�mto znakem. ��st p�ed bude v "\tmpa" a ��st za (v�etn� separ�toru)
bude v "\tmpb". Tuto pr�ci vykon� postupn� vol�n� makra \db varparam:

\inext {def\nb varparam}{\empty}{+-}

Makro "\varparam<separ>" definuje pomocn� makro "\tmp#1<separ>#2 ", kter�mu
je p�edlo�eno "<slovo><separ> ". Je-li "#2" pr�zdn�, pak zabral a�
"<separ>" na konci, tak�e uvnit� "<slova>" nen� "<separ>". Pak v
"\tmpa" z�st�v� "<slovo>". Je-li uvnit� "<slova>" separ�tor, pak je
pot�eba doplnit k "\tmpb" zbytek za separ�torem v�etn� tohoto
separ�toru. V "#2" m�me "<zbytek><separ>" a my pot�ebujeme do "\tmpb"
ulo�it st�vaj�c� obsah "\tmpb" p�ed kter�m p�edch�z� "<separ><zbytek>".
Tuto pr�ci ud�l� \db gobblelast, kter�mu je p�edlo�en
"<obsah tmpb>\end<separ><zbytek><separ>". Makro definuje 
"\tmp#1<separ>" a p�edlo�� mu "<zbytek><separ>". Je tedy v "#1" hol�
"<zbytek>" a do "\tmpb" se dost�v� "<separ><zbytek><star� obsah tmpb>". 

Po rozd�len� vyhled�n� separ�toru m�me n "\tmpa" <slovo>, ov�em m��e
obsahovat na konci "()". Proto spust�me na ��dku~\cite[managebrackets]
makro \db managebrackets, kter� se postar� o p��padn� odd�len� t�chto
z�vorek.  Pokud se z�vorky skute�n� odd�lily od "\tmpa", z�st�vaj�
v~\db printbrackets.

\inext {def\nb managebrackets}{\empty}{+-}

Makro \db maybespace v z�v�ru �innosti makra "\dparam" vytiskne za
obsahem "\tmpb" mezeru, ale jen tehdy, kdy� je jm�no makra
dvoup�smenkov� ("\dg", "\dl") a nen�sleduje znak "`".

\inext {def\nb maybespace}{\empty}{+-}

Na ��dku~\cite[ii] vytvo�� makro "\dparam" z p�vodn�ho p��kazu
"\dg*" resp. "\dl*" jeho intern� verzi "\iidg*" resp. "\iidl*".
Parametry p�ed� expandov�ny, aby s nimi bylo m�n� pr�ce.
Sta�� tedy naprogramovat uveden� intern� makra.

Makro \db iidg vlo�� do enc\TeX{}ov� tabulky "\sword" (je to m�rn�
nadbyte�n�, tot� se provede na za��tku zpracov�n� p�i �ten�
"\reffile" p��kazem "\refdg"). D�le makro vytvo�� c�l
odkazu tvaru "@<slovo>", ulo�� informaci do "\reffile"
ve form�tu "\refdg{<p�ed>}{<slovo>}{<za>}{}",
vytiskne "<slovo>" zv�razn�n� pomoc� "\printdg" a vlo�� pozn�mku pod
��ru pomoc� "\printfnote".

\inext {def\nb iidg }{^^B\cbrace}{++}

Makro \db iidl nevkl�d� nic do enc\TeX{}ov� tabulky, 
vytvo�� c�l pomoc� "\label [@<dlouh� slovo>]", zap�e info do
"\reffile" ve form�tu "\refdg{<p�ed>}{<d-slovo>}{<za>}{<k-slovo>}",
vytiskne "<k-slovo>" zv�razn�n� pomoc� "\printdg" a vlo�� pozn�mku
pomoc� "\printfnote{<p�ed>}{<d-slovo>}{<za>}".

\inext {def\nb iidl }{^^B\cbrace}{++}

Makra \db iidgh a \db iidlh d�laj� to sam� jako jejich non-"h"
prot�j�ky, jen netisknou slovo v m�st� v�skytu. Lok�ln� tedy
p�edefinujeme, aby "\printdg" ned�lalo nic.

\inext {def\nb iidgh}{\empty}{+-}

Makro \db iidgn p�edefinuje makro "\.<slovo>", kter� vyr�b� enc\TeX,
tak, �e v�sledkem expanze je "\fword{<p�ed>}{<slovo>}{<za>}" 
(nam�sto obvykl�ho "\sword{<slovo>}").

\inext {def\nb iidgn}{\empty}{+-}

A� se \db fword spust� (p�i prvn�m n�sleduj�c�m v�skytu "<slova>"), m�
za �kol prov�st "\iidgh", vytisknout "<slovo>" �erven� a vr�tit 
"\.<slovo>" do p�vodn�ho stavu. 

\inext {def\nb fword}{\empty}{+-}

Makro \db iidln si ulo�� st�vaj�c� v�znam "\.<slovo>" do 
sekvence "\;<slovo>" a p�edefinuje makro "\.<slovo>", 
kter� vyr�b� enc\TeX, tak, �e v�sledkem je 
"\flword{<p�ed>}{<slovo>}{<za>}".

\inext {def\nb iidln}{\empty}{+-}

Makro \db flword m� za �kol prov�st "\iidlh", vytisknout "<slovo>"
�erven� a vr�tit v�znam makra "\.<slovo>" do p�vodn�ho stavu (kter� je ulo�en
v sekvenci "\;<slovo>". Byl-li tento p�vodn� v�znam nedefinov�n, je
pot�eba potla�it dal�� �innost makra "\.<slovo>" registrov�n�m jako
"\nword{<slovo>}", proto�e z enc\TeX{}ov� tabulky u� z�znam nelze
odebrat.  

\inext {def\nb flword}{\empty}{+-}

\subsec [specfootnote] Speci�ln� pozn�mky pod �arou
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Pozn�mky pod �arou jsou �azeny vedle sebe a obsahuj� jen slova, kter�
maj� na str�nce sv� "\dg". Proto�e toto �e�en� je vizu�ln�
nekompatibiln� s u�ivatelsk�mi pozn�mkami pod �arou, jednodu�e je
zak�eme:

\inext {let\nb footnote=}{\empty}{+-}

Pro speci�ln� pozn�mky pod �arou vyu�iji u� deklarovan� insert
"\footins". Probl�m je, jak odhadnout, kolik zabere vertik�ln�ho m�sta
v pozn�mk�ch jedno slovo, kdy� jich m��e b�t vedle sebe
v�ce. Dirty trick z \TeX{}booku (vkl�dat inserty ve v��ce rovn� jist�mu
procentu sv� ���ky) se neujal, nebo� zlom �asto nekonvergoval, ale osciloval.
V druh�m pr�chodu pozn�mky teprve dost�vaj� sv� seznamy str�nek a tyto
seznamy se pak mohou d�le up�es�ovat, co� zp�tn� ovlivn� vertik�ln�
sazbu. Po jej� zm�n� se m�n� seznamy str�nek a tak po��d dokola.

Rozhodl jsem se tedy pracovat pouze s pr�m�rn�m koeficientem
pozn�mek, kter� budou m�t v�echny pozn�mky spole�n�. Tento koeficient 
z�sk�m jako celkov� po�et ��dk� pozn�mek v cel�m dokumentu d�len�
po�tem pozn�mek. Ka�d� pozn�mka pak \uv{p�ek��} v hlavn�m vertik�ln�m
seznamu v��kou ��dku pozn�mek (10pt) n�sobenou t�mto koeficientem.
Sta�� tedy nastavit "\count\footins".

Aby probl�m ur�it� konvergoval, bylo nutn� fixovat v��e uveden�
koeficient po druh�m pr�chodu. Kdybych jej ka�d� n�sleduj�c� pr�chod
m�nil, zase se nedo�k�me konvergence. Z�skat uveden� koeficient hned
po prvn�m pr�chodu nen� rozumn�, proto�e v t� dob� pozn�mky je�t�
nemaj� vedle sebe seznamy str�nek. V�choz� koeficient pro prvn� a
druh� pr�chod je tedy nastaven na "\count\footins=200" (p�edpokl�d�m
zhruba p�t pozn�mek na ��dku).

Pracovat s pr�m�rem m�sto s ka�dou jednotlivou pozn�mkou m��e
samoz�ejm� zp�sobit, �e n�kter� str�nky jsou pln�j�� a n�kter�
pr�zdn�j��. Proto je pot�eba m�t rezervu ve "\skip\footins" a
vertik�ln� pru�it kolem pozn�mkov� ��ry.

\inext {skip\nb footins}{\empty}{+-}

V registru \db totalfoocount se bude postupn� p�i��tat jedni�ka za ka�dou
pozn�mku a na konci zpracov�n� tam tedy je celkov� po�et pozn�mek.
V registru \db totalfoodim bude na konci zpracov�n� celkov� v��ka 
v�ech ��dk� s pozn�mkami. 

\inext {newcount\nb totalfoocount}{\empty}{+-}

Makro \db specfootnote "{<text>}" 
vlo�� do insertu "\footins" jedin� "\hbox{<text>}" a p�ipo�te
jedni�ku do "\totalfoocount".

\inext {def\nb specfootnote}{\empty}{+-} 

Proto�e jsem se rozhodl nem�nit v�stupn� rutinu plainu, musel jsem se
\uv{nabourat} aspo� do jej� ��sti na tisk pozn�mek pod �arou. Je to
provedeno p�edefinov�n�m makra "\footnoterule" v�stupn� rutiny plainu.
Separ�tor "\unvbox\footins" zp�sob� odstran�n� stejn�ho textu 
z output rutiny plainu.

\inext {def\nb footnoterule}{\empty}{+-}

Makro rozebere vertik�ln� seznam insert� "\footins" a poskl�d� je
vedle sebe do boxu~4. Pak nastav� parametry sazby na praporek a
vypust� box~4 do horizont�ln�ho seznamu ("\noindent") ukon�en�m
"\endgraf". T�m jsou ve v�stupn� rutin� pozn�mky pod �arou vys�zeny.
Nakonec p�ipo�teme "\totalfoodim".

V z�v�ru zpracov�n� v makru "\bye" (viz ��dek~\cite[write]) zap�eme
do souboru "\reffile" informaci o~po�tu pozn�mek "<po�et>", o celkov�
v��ce ��dk� pozn�mek v dokumentu "<v��ka>" a p�id�me aktu�ln�
koeficient p��sp�vku pozn�mek do vertik�ln�ho seznamu "<koeficient>".
Informaci zapisujeme jen tehdy, kdy� je "\indexbuffer" nepr�zdn�,
tj. kdy� prob�h� aspo� druh� pr�chod. Kdybychom zapisovali i prvn�
pr�chod, dostali bychom velmi zkreslen� informace (pozn�mky v~tu
chv�li nemaj� vedle sebe seznamy str�nek).
%
Uvedenou informaci zapsanou v p�edchoz�m pr�chodu 
p�e�teme na za��tku zpracov�n� makrem
\db refcoef "{<koeficient>}{<po�et>}{<v��ka>}" a 
nastav�me podle toho spole�n� koeficient v�ech pozn�mek
"\count\footins". Makro zm�n� koeficient z v�choz� 
hodnoty 200 na vypo�tenou jen jednou. P�i dal��ch pr�chodech u�
z�st�v� u vypo�ten� hodnoty.
Pomocn� makro \db gobblerest odstran� cifry za desetinou
te�kou v�etn� n�pisu~"pt".

\inext {def\nb refcoef}{\empty}{+-}

V�stupn� rutina "\plainoutput" nen� zm�n�na. Pot�ebuji ale uvnit�
"\output" potla�it expanzi n�kter�ch maker, kter� se objev� v argumentu
"\write". Tato makra jsou tedy uvnit� "\output" nastavena na "\relax".
Aby toto nastaven� nezm�nilo sazbu z�hlav�, je pot�eba "\makeheadline" 
prov�st p�ed zm�nou maker a ulo�it si v�sledek do boxu.

\inext {\nb output=}{\empty}{+-}

\subsec [secsec] Sekce, podsekce
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Nejprve zap�eme deklarace \db secnum, \db subsecnum, 
\db sectitle, \db ifsavetoc. Posledn� deklarace p�iprav�
u�ivatelsk� \db savetocfalse.

\ifirst {docby.tex}{newcount\nb secnum}{\empty}{+-}

Makra \db sec a \db subsec maj� mo�nost nepovinn�ho parametru
"[<lejbl�k>]", za n�m m��e a nemus� b�t mezera, kterou mus�me ignorovat. 
Na konci parametru "<titul>" p�ed "\par" rovn� m��e a nemus� b�t
mezera, kterou mus�me ignorovat. D� tedy pr�ci parametry spr�vn�
na��st. Makra si ulo�� sv�j n�zev do "\tmpA" a spust� proces na��t�n�
parametr� pomoc� "\secparam".

\inext {def\nb sec}{\empty}{+-}

Makro \db secparam se vypo��d� s p��padn�m nepovinn�m parametrem
"[<lejbl�k>]". Pokud je p��tomen, ulo�� "<lejbl�k>" do pomocn�ho makra
\db seclabel, jinak tam je pr�zdno. Makro \db secparamA se vypo��d�v�
s p��padnou mezerou za hranatou z�vorkou "]" a odstran� ji.
Makro \db secparamB "<titul>\par" na�te "<titul>", ale ten m��e m�t
ne��douc� mezeru zcela na konci. S t�m se vypo��d� makro 
\db nolastspace ve spolupr�ci s makrem \db setparamC. Posledn� jmenovan�
makro ulo�� u� od ne��douc� mezery o�et�en� "<titul>" do "\sectitle" a
spust� "\iisec" resp. "\iisubsec".

\inext {def\nb secparam}{\empty}{+-}

Makro \db iisec nejprve nastav� hodnoty "\secnum" a "\subsecnum",
d�le definuje \db makelinks, kde je p�ipravena tvorba odkaz� (to
pou�ije makro "\printsec").
D�le zavol� "\printsec" na vyti�t�n� n�zvu sekce.
Pot� ulo�� informace do "\reffile" ve tvaru
"\reftocline"~"{<secnum>}{<titul>}{<strana>}" 
Nakonec se provede "\mark{<secnum> <titul>}" a 
vlo�� se z�v�re�n� mezera pomoc� "\printsecbelow".

\inext {def\nb iisec}{^^B\cbrace}{++}

Makro \db iisubsec, kter� vytv��� podsekci, pracuje analogicky, jako
makro "\iisec".

\inext {def\nb iisubsec}{^^B\cbrace}{++}

Makro "\part" bylo zapracov�no dodate�n� ve verzi Jan. 2009. 
Registr \db partnum uchov�v� ��slo ��sti a makro \db thepart
toto ��slo konvertuje na p�smeno.

\inext {newcount\nb partnum}{\empty}{+-}

Makro \db part m� svou implementaci v makru \db iipart
podobn� jako nap��klad makro "\sec".

\inext {def\nb part}{\empty}{+-}

\subsec [reference] Odkazy, reference
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Klikac� odkazy �e�� makra \db savelink "[<lejbl�k>]" a a \db ilink
"[<lejbl�k>]{<text>}". Makro "\savelink" ulo�� do sazby c�l
odkazu. C�l odkazu vystr�� do
v��ky \db linkskip nad ��a��. Makro "\ilink" (�ti intern� link) je
dokumentov�no v~sekci~\cite[krizodkaz]. Kone�n� makro "\savepglink"
ulo�� c�l numerick�ho typu (��slo str�nky), kter� bude vyu�it makrem
"\pglink" p�i odkazech na str�nky.

\ifirst {docby.tex}{Odkazy, ref}{\empty}{--}

Uveden� makra jsem definoval zvlṻ pro DVI v�stup (jako pr�zdn�
makra) a zvlṻ pro PDF v�stup. A� zase tv�rci pdf\TeX{}u zm�n�
syntaxi nebo n�zvy primitiv�, bude sta�it pozm�nit uveden� makra.
V makru "\ilink" je p��mo �e�eno, �e se m� pou��t modr� barva pro
vytvo�en� odkaz� a �e odkaz m� b�t bez r�me�ku. Pokud to n�komu
nevyhovuje, m��e si makro p�edefinovat.

Trik s p�edefinov�n�m "\nb" (norm�ln� backslash) p�i tvorb� PDF link�
vych�z� ze zku�enosti, �e pokud se v n�zvu linku objev� backslash,
n�kter� PDF prohl�e�e si s t�m neporad� a chovaj� se podivn�. Je tedy
nutn�, aby argument p��kaz� "\savelink" a "\ilink" byl neexpandovan�.

Makro \db savepglink (definice je v p�edchoz�m v�pisu) je pou�ito v
"\headline" ka�d� str�nky, tak�e vytvo�� c�l \uv{naho�e} na ka�d�
str�nce. Makro \db pglink "<number>" p�e�te "<number>" (m��e b�t ve
tvaru numerick�ho registru i p��mo jako ��slo) a vytvo�� link na
str�nku s t�mto ��slem. ��slo samotn� je vyti�t�no mod�e a d� se na n�
kliknout. Ke �ten� numerick�ho registru je pou�it primitiv "\afterassignment"
a pomocn� makro \db dopglink.

V souboru "\jobname.ref" se prost�ednictv�m makra
"\labeltext[<lejbl�k>]{<text>}" ulo�� ��dek, kter� obsahuje
"\reflabel"~"{<lejbl�k>}{<text>}{<strana>}".  Makrem \db reflabel tyto
�daje p�e�tu a zap�u do kontroln�ch sekvenc� "^^X<lejbl�k>" a
"^^Y<lejbl�k>". Tyto kontroln� sekvence jsou n�sledn� vyu�ity
v~makrech \db numref a \db pgref.  
Za pov�imnut� stoj�, �e pokud je "<text>" pr�zdn�
(to jsou nap��klad v�echny p��pady dokumentovan�ch slov), pak
kontroln� sekvenci "^^X<lejbl�k>" v�bec nedefinuji, abych �et�il
pam�t�, kterou m� \TeX{} rezervov�nu na kontroln� sekvence.

\inext {reflabel}{\empty}{+-}

Makro \db labeltext "[<lejbl�k>]{<text>}", jak bylo p�ed chv�l�
�e�eno, ulo�� do souboru pot�ebn� �daje. Jednak zap�e PDF link pomoc�
makra "\savelink" a d�le ulo�� do souboru "\reffile" pot�ebn� �daje.
K tomu je makro \db writelabel "[<lejbl�k>]{<text>}", kter� 
pracuje se zpo�d�n�m "\write" (aby ��slo strany bylo spr�vn�). 
V okam�iku na�ten� parametru
"<text>" jej pot�ebuji expandovat, proto�e tam obvykle b�v� n�co jako
"\the\secnum". Pro vy�e�en� tohoto probl�mu jsem
na chv�li prohodil parametry ("<lejbl�k>" toti� nechci
expandovat) a zavedl pomocn� makro 
\db writelabelinternal "{<text>}{<lejbl�k>}".
Prvn� ��st, tj. "\writelabel{<text>}" expanduji pomoc� "\edef".

\inext {labeltext}{\empty}{+-}

Makro \db label je u� definov�no jednodu�e jako \uv{pr�zdn�}
"\labeltext".

\inext {label}{\empty}{+-}

Makro \db cite "[<lejbl�k>]" vytiskne klikateln� text. P�i chybn�m
"<lejbl�ku>" vytiskne varov�n� na termin�l. Makro je dokumentov�no 
v~sekci~\cite[krizodkaz].

\inext {cite}{\empty}{+-}

S odkazy souvis� makro \db api "{<slovo>}", kter� vlo��
"\label[+<slovo>]" d� o sob� v�d�t je�t� jednou do "\reffile".

\inext {def\nb api}{\empty}{+-}

Makro \db apitext obsahuje text ti�t�n� vedle "<slova>" do obsahu a
rejst��ku. 

P�i �innosti makra \db bye zap�eme do souboru "\reffile" �daje 
pro "\refcoef" (��dek~\cite[write]) a d�le se zab�v�me testem
konzistence referenc�.

\ilabel [texttoc] {text\nb tocbuffer}
\ilabel [vypust] {indexbuffer}
\ilabel [write] {write\nb reffile}
\inext {def\nb bye}{^^B\cbrace}{++}

Test konzistence vypad� n�sledovn�: nejprve
uzav�eme z�pis do souboru "\reffile", pak
pomoc� "\setrefchecking" p�edefinujeme
kontroln� sekvence vyskytuj�c� se v "\reffile" a soubor znovu
na�teme. Nyn� makra v n�m napsan� d�laj� test a pokud naraz� na
probl�m, provedou "\continuefalse". M��eme tedy pomoc� "\ifcontinue"
zjistit, jak test dopadl. Po p�e�ten� souboru je pot�eba ud�lat je�t�
d�kladnou kontrolu v�ech automatick�ch odkaz�. Pro� je tato kontrola 
vy�e�ena vypu�t�n�m "\indexbuffer" do vstupn� fronty bude jasn� po prostudov�n�
makra \db setrefchecking.

\ilabel[jerelax] {=\nb relax}
\inext {def\nb setrefchecking}{\empty}{+-}

Zde p�edefinujeme makro "\refcoef", aby ned�lalo nic. 
D�le nov� verze "\reflabel" kontroluje, zda odkaz je na stejn� str�nce, jako byl
a m� stejn� text. 
Nov� makro "\refuseword" pracuje jako jeho origin�ln� prot�j�ek, jen m�sto
sekvenc� "w:<slovo>" pln� sekvence "-<slovo>". Tyto sekvence u� zn�me,
nyn� je vyu�ijeme jinak. �et��me pam�t� \TeX{}u, proto nezakl�d�me
sekvence nov�. Nejprve je nutn� t�mto sekvenc�m nastavit v�choz�
hodnotu "\relax", co� je provedeno na ��dku~\cite[jerelax].
Pak znovu p�edefinuji sekvenci "\,", aby provedla test shodnosti sekvence
"w:<slovo>" se sekvenc� "-<slovo>" a v makru "\bye" na
��dku~\cite[vypust] spust�m tento test expandov�n�m makra 
"\indexbuffer\relax". Kdy� makro najde nekonzistenci, ohl�s� chybu a
ute�e pomoc� \db ignoretorelax.
D�le je p�edefinov�no makro "\refdg", aby pouze
zapisovalo do "\tocbuffer". Ostatn� makra z "\reffile" tak� zapisuj�
do "\tocbuffer". St�vaj�c� verzi "\tocbuffer" ulo��me do "\text" a
"\tocbuffer" se p�i na�ten� "\reffile" vytvo�� znovu. Na
��dku~\cite[texttoc], zda se nezm�nil obsah.

\subsec Tvorba obsahu, rejst��ku a z�lo�ek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Obsah i rejst��k se mohou pomoc� "\dotoc" a "\doindex" objevit kdekoli
v dokumentu (t�eba na za��tku, na konci, uprost�ed...). Mus�me b�t
p�ipraveni je kdykoli vytisknout. Soubor "\reffile" z minul�ho b�hu 
m��eme otev��t ke �ten� jen na za��tku, pak jej ma�eme a za��n�me
znova zapisovat. P�i �ten� ze souboru "\reffile" tedy mus�me ulo�it
v�echny pot�ebn� informace k sazb� obsahu i rejst��ku. Pou��v�me na to
makro "\tocbuffer" a "\indexbuffer". Na za��tku tyto \uv{buffery}
vypr�zdn�me. Makro \db addtext "<text>\to<buffer>" budeme pou��vat na
vkl�d�n� "<textu>" do "<bufferu>", ��m� buffery postupn� napln�me.

\inext {def\nb tocbuffer}{\empty}{+-}

V souboru \db reffile se vyskytuj� tyto p��kazy:

{\def\begtthook{\langleactive\catcode`\!=0\mubytein=1}
\begtt
\reftocline{<��slo>}{<n�zev>}{<strana>}  % �daje o sekci a subsekci pro obsah
\refdg{<p�ed>}{<slovo>}{<za>}{<k-slovo>}  % �daj o pou�it� \dg, \dl
\refapiword{<slovo>}                   % �daj o v�skytu \api{<slovo>}
\refuseword{<slovo>}{<strana>}          % �daj o p��m�m v�skytu <slova>
\reflabel{<lejbl�k>}{<text>}{<strana>}     % viz sekci !cite[reference], odkazy, reference
\refcoef{<koeficient>}{<po�et>}{<v��ka>}  % viz sekci !cite[specfootnote], spec. pozn�mky
\refns{<nslejbl�k>}                     % viz sekci !cite[ns], jmenn� prostory
\refnsend{<nslejbl�k>}                  % viz sekci !cite[ns], jmenn� prostory
\endtt
\par}

P�i �ten� souboru "\reffile" ukl�d�me pot�ebn� �daje do
buffer�. Nejprve se zam���me na {\bf obsah} a definujeme 
\db reftocline "{<��slo>}{<n�zev>}{<strana>}".

\inext {def\nb reftocline}{\empty}{+-}

V \db tocbuffer tedy m�me postupn� �daje o v�ech sekc�ch a podsekc�ch v
za sebou jdouc�ch sekvenc�ch \db dotocline "{<��slo>}{<n�zev>}{<strana>}".
Mezi sekc� a subsekc� rozli��me jen podle toho, zda
parametr "<��slo>" obsahuje te�ku. K tomu slou�� pomocn� makro 
\db istocsec.

\inext {def\nb dotocline}{\empty}{+-}

Kdybychom spustili makro "\tocbuffer", dostaneme obsah. Ale ten se
neskl�d� jen z �daj� o~sekc�ch a podsekc�ch. Je�t� je pot�eba p�e��st
\db refdg a \db refapiword, abychom mohli vkl�dat do obsahu i �daje 
o~dokumentovan�ch slovech.

\ilabel [right] {right}
\ilabel [ns1] {\nb dl}
\ilabel [ns2] {locword}
\inext {def\nb refdg}{\empty}{+-}

Makro "\refdg" pracuje s parametry "{<p�ed>}{<slovo>}{<za>}{<k-slovo>}",
kde "<p�ed>" je text p�ed slovem, "<slovo>" je dlouh� slovo, "<za>" obsahuje
p��padn� z�vorky "()". Je-li dlouh� slovo rozd�ln� od kr�tk�ho slova
(p�i pou�it� "\dl"), obsahuje "<k-slovo>" kr�tk� slovo, jinak je tento
parametr pr�zdn�.
Makro "\refdg" ukl�d� informace nejen do "\tocbuffer",
ale tak� do "\indexbuffer". Rovn� p�i pr�zdn�m "<k-slovo>" makro
ukl�d� "\sword" do enc\TeX{}ov� tabulky a p�i
nepr�zdn�m "<k-slovo>" makro cosi kut� se jmenn�mi prostory. 
Nyn� je ale na�e pozornost v�nov�na tvorb�
obsahu.  Ten vytvo�� makro \db dotoc.

\inext {def\nb dotoc}{\empty}{+-}

{\bf Rejst��k} je vybudov�n z bufferu \db indexbuffer, ve kter�m je seznam
deklarovan�ch slov v dokumentu. Ka�d� slovo je v bufferu zaps�no jako
kontroln� sekvence (to zabere v pam�ti \TeX{}u nejm�� m�sta) a je
odd�leno od dal�� sekvence odd�lova�em. P�ed zat��d�n�m podle abecedy
jsou polo�ky v~"\indexbuffer" odd�leny ��rkami za polo�kami, po
zat��d�n� jsou polo�ky odd�leny "\," p�ed polo�kami. Tak�e obsah
"\indexbuffer" vypad� zhruba takto:

{\def\begtthook{\langleactive}
\begtt
p�ed zat��d�n�m:  \-<slovo1> , \-<slovo2> , \-<slovo3> , \-<slovo4> , ...
po zat��d�n�:     \, \-<slovoA> \, \-<slovoB> \, \-<slovoC> \, \-<slovoD> ...
\endtt
\par}

\noindent Zde z�pis "\-<slovo>" znamen� jednu kontroln� sekvenci.
Ka�d� takov� kontroln� sekvence je makrem tvaru "<p�ed>\right<za>".
To za��d� ��dek~\cite[right]. Rejst��k vytiskneme makrem \db doindex.

\ilabel [calculatedimone] {calculatedimone}
\inext {def\nb doindex }{^^B\cbrace}{++}

P��kaz "\calculatedimone" s n�sleduj�c�m testem "\dimen1" souvis� se
sazbou do dvou sloupc�, co� nech�me na sekci~\cite[dvasloupce].  Makro
tedy zalo�� p��kazem "\sec" sekci nazvanou "\titindex" a pokud je
"\indexbuffer" nepr�zdn�, spust� sazbu rejst��ku. Nejprve se p��kazem
"\sortindex" set��d� "\indexbuffer" podle abecedy (viz sekci~\cite[abeceda]). 
Pak makro "\doindex" zalo��
dvousloupcovou sazbu ("\begmulti 2") a odd�lova�i "\," p�id�l� v�znam
"\doindexentry". Nakonec vypust� "\indexbuffer" do vstupn� fronty,
tak�e dal�� pr�ci opakovan� provede makro \db doindexentry
"\-<slovo>", kter� se postar� o tisk slova v~rejst��ku.

\inext {def\nb doindexentry}{\empty}{+-}

Makro "\doindexentry" pomoc� \db ignoretwo odstran� z kontroln�
sekvence "\-<slovo>" �vodn� dva znaky "\-", tak�e v "\tmp" z�stane "<slovo>".
Pokud "<slovo>" za��n� backslashem, ud�l�me z n�j makrem 
\db remakebackslash sekvenci "\nb", nebo� p��m� backslash nen� ulo�en
v PDF odkazech (zlob� n�kter� PDF prohl�e�e, viz sekci~\cite[reference].
Nakonec se vytiskne polo�ka v rejst��ku u� zn�m�m makrem "\printindexentry".

P�i tvorb� {\bf strukturovan�ch z�lo�ek} je pot�eba v�d�t, kolik m�
ka�d� uzel potomk�. Tento �daj je po��tan� p�i �ten� "\reffile"
vol�n�m makra \db addbookmark "<uzel>" (viz makra "\reftocline" a "\refdg").
Parametr "<uzel>" m��e b�t ��slo sekce, nebo dvoj��sl� "<sekce>.<podsekce>".
V makru \db currb je "<uzel>", ke kter�mu je pot�eba p�i��tat potomka
a \db currsecb je p��padn� nad�azen� "<uzel>" sekce.
Makro "\addbookmark" p�ipo�te jedni�ku k hodnot� makra "\bk:<uzel>".

\inext {def\nb addbookmark}{\empty}{+-}

Makro \db bookmarks zalo�� skupinu, p�edefinuje "\dotocline" a
"\ptocentry" (tj.~makra obsa�en� v~"\tocbuffer") vlo�� prvn� z�lo�ku 
s n�zvem dokumentu a spust� "\tocbuffer".

\inext {def\nb bookmarks}{^^B\cbrace}{++}

Makro \db setoutline "[<lejbl�k>]{<text>}{<prefix>}" vytvo�� z�lo�ku 
"<prefix><text>" a prolinkuje ji s c�lem ozna�en�m "<lejbl�k>". 
V "\tempnum" mus� b�t ulo�en po�et potomk� z�lo�ky.

\inext {def\nb setoutline}{\empty}{+-}

V tomto makru je pou�ito konverzn� makro \db cnvbookmark, kter� je
implicitn� neaktivn�. U�ivatel m��e nap��klad nastavit 
"\let\cnvbookmark=\lowercase"
a nechat konvertovat pomoc� "\lccode" znak "�" na "c", znak "�" na
"z", atd. Nastaven� "\lccode" mus� m�t v "\bookmarkshook".

D�le je text p�ed vlo�en�m do z�lo�ky podroben konverzi \db nobraces, 
kter� ve spolupr�ci s makrem \db nobrA sund� p��padn� z�vorky "{}". 
Tak�e, pokud m�me t�eba "{\tt text} v \TeX{}u",
po konverzi dost�v�me "text v TeXu".

\subsec [abeceda] Abecedn� �azen� rejst��ku
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Tuto pr�ci provede makro "\sortindex". P�vodn� bylo v \docbytex{}u
implementov�no algoritmem bubblesort, co� vy�lo na �est ��dk� makrok�du
(prezentov�no na tutori�lu \TeX{}perience~2008), ale pro v�t��
rejst��ky to bylo pomal�. Nap�. pro rejst��k tohoto dokumentu to
vygenerovalo 52 tis�c dotaz� na porovn�n� a trvalo to asi dv�
vte�iny. M�j syn Mirek byl pozorn�
poslucha� tutori�lu, tak�e nabyt� znalosti okam�it� vyu�il a p�epsal
t��dic� makro na mergesort. Ten na stejn� velk�m rejst��ku generuje 
1600 dotaz� na porovn�n�, tedy t�icetkr�t m�n�. Cena za to je
skute�nost, �e makro u� nem� jen �est ��dk�, ale je m�rn�
komplikovan�j��. Od mo�nosti pou��t quicksort jsme upustili, proto�e
implementace by vy�adovala vy��� pam�ov� n�roky na inputstack
\TeX{}u.

Nejprve deklarujeme podm�nku pro v�sledek srovn�n� dvou polo�ek
\db ifAleB a vytvo��me pomocn� makra \db nullbuf, \db return a 
\db fif. Pomocn� makro "\return" ve spolupr�ci se zakryt�m "\fi"
uvnit� "\fif" budeme pou��vat pro �nik z ko�at�ch hluboce vno�en�ch
podm�nek typu "\if..\else..\fi". Jak uvid�te, makro pracuje na �rovni
expandprocesoru a nebude pot�eba ps�t ��dn� "\expandafter".

\inext {newif\nb ifAleB}{\empty}{+-}

Makro \db sortindex vypust� do vstupn� fronty cel� "\indexbuffer",
p�imaluje k n�mu "\end,\end", pronuluje "\indexbuffer" a spust� 
"\mergesort".

\inext {def\nb sortindex}{^^B\cbrace}{++}

Makro \db mergesort pracuje tak, �e bere ze vstupn� fronty v�dy dvojici skupin
polo�ek, ka�d� skupina je zat��d�n�. Skupiny jsou od sebe odd�leny
��rkami. Tyto dv� skupiny spoj� do jedn� a zat��d�. Pak p�ejde na
n�sleduj�c� dvojici skupin polo�ek. Jedno zat��d�n� tedy vypad�
nap��klad takto: dv� skupiny: "eimn,bdkz," prom�n� v~jedinou 
skupinu "bdeikmnz,". V tomto p��klad� jsou polo�ky jednotliv� p�smena,
ve skute�nosti jsou to kontroln� sekvence, kter� obsahuj� cel� slova.

Na po��tku jsou skupiny jednoprvkov� ("\indexbuffer" odd�luje ka�dou
polo�ku ��rkou). Makro "\mergesort" v tomto p��pad� projde seznam a vytvo��
seznam zat��d�n�ch dvoupolo�kov�ch skupin, ulo�en� zp�tn� v
"\indexbuffer". V dal��m pr�chodu znovu vyvrhne "\indexbuffer" do vstupn� fronty,
vypr�zdn� ho a startuje znovu. Nyn� vznikaj� �ty�polo�kov� zat��d�n�
skupiny. Pak osmipolo�kov�~atd. V~z�v�ru (na ��dku~\cite[konecsortu]) 
je prvn� skupina cel� set��d�n� a druh� obsahuje "\end", tj. 
v�echny polo�ky jsou u� set��d�n� v prvn� skupin�, tak�e sta�� 
ji ulo�it do "\indexbuffer" a ukon�it �innost. Pomoc� "\gobblerest"
odstran�me druh� "\end" ze vstupn�ho proudu.

\noactive{dvojice}
\ilabel [merge:porovnani] {isAleB}
\ilabel [merge:trojka] {mergesort p1+}
\ilabel [merge:p1] {ifx,}
\ilabel [merge:p2] {fif\nb mergesort\cbrace}
\ilabel [konecsortu] {empty\nb indexbuffer}
\ilabel [napercarky] {napercarky}
\inext {def\nb mergesort }{^^B\cbrace}{++}

{\def\quotehook{\catcode`\<12}
J�dro "\mergesort" vid�me na ��dc�ch~\cite[merge:porovnani]
a�~\cite[merge:trojka]. Makro "\mergesort" sejme ze vstupn�ho proudu
do "#1" prvn� polo�ku prvn� skupiny, do "#2" zbytek prvn� skupiny a do 
"#3" prvn� polo�ku druh� skupiny. Je-li "#1<#3", je do v�stupn�ho
zat��d�n�ho seznamu "\indexbuffer" vlo�en "#1", ze vstupn�ho proudu je
"#1" odebr�n a "\mergesort" je zavol�n znovu. V p��pad� "#3<#1"
je do "\indexbuffer" vlo�en "#3", ze vstupn�ho proudu je "#3" odebr�n a 
"\mergesort" je zavol�n znovu. ��dky~\cite[merge:p1]
a�~\cite[merge:p2] �e�� p��pady, kdy je jedna ze skupin pr�zdn�: 
je pot�eba vlo�it do "\indexbuffer" zbytek nepr�zdn� skupiny a p�ej�t 
na dal�� dvojici skupin. Ostatn� ��dky makra se vyrovn�vaj� se
skute�nost�, �e zpracov�n� narazilo na zar�ku "\end,\end" a je tedy
pot�eba vystartovat dal�� pr�chod.
\par}

Vlastn� srovn�n� dvou polo�ek d�l� makro 
\db isAleB "<polA><polB>". Polo�ky jsou tvaru kontroln�
sekvence "\-<slovoA>" a "\-<slovoB>". 
Makro konvertuje sv� parametry pomoc� "\string" na �adu znak� a
expanduje na "\testAleB"~"<slovoA>\relax<slovoB>\relax".
Nav�c je na tento test aplikov�no "\lowercase", 
nebo� nerozli�ujeme p�i �azen� mezi velk�mi a mal�mi p�smeny.

\ilabel [teckanula] {0\nb relax}
%\ilabel [teckajedna] {2.1}
\inext {def\nb isAleB }{^^B\cbrace}{++}

Makro \db testAleB "<slovoA>\relax<slovoB>\relax" zjist�, zda je 
"<slovoA>" men�� ne� "<slovoB>". Makro vol� 
samo sebe, pokud jsou prvn� porovn�van� znaky stejn�. Rekurze ur�it�
skon��, nebo� na ��dku~\cite[teckanula]
jsou k porovn�van�m slov�m p�ipojeny r�zn� ocasy.

\inext {def\nb testAleB}{^^B\cbrace}{++}

Makro \db napercarky vlo�� mezi polo�ky do "\indexbuffer" separ�tory "\,".
To se provede uvnit� "\edef\indexbuffer" na ��dku~\cite[napercarky].

\inext {def\nb napercarky}{\empty}{+-}


\subsec Transformace seznamu str�nek
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Ka�d� v�skyt "<slova>"
ulo�� do "\reffile" �daj \db refuseword "{<slovo>}{<strana>}", kter�
p�e�teme na za��tku zpracov�n� v dal��m pr�chodu:

\inext {def\nb refuseword}{^^B\cbrace}{++}

V sekvenci "\w:<slovo>" tedy m�me seznam str�nek s v�skyty "<slova>",
str�nky jsou odd�leny ��rkami. Seznam m��e vypadat t�eba takto:

\begtt
2,5,5,10,11,12,12,13,13,13,27
\endtt

C�lem je takov�to seznam str�nek vytisknout ve form�tu 
"2, 5, 10--13, 27", tj. odstranit duplicity a nahradit souvisle jdouc�
�adu str�nek z�pisem ve tvaru "<od>--<do>". Tuto pr�ci d�l� makro
\db listofpages "{<slovo>}", kter� p�edhod� makru "\transf" expandovan� seznam
str�nek ukon�en� ",0,".

\inext {def\nb listofpages}{^^B\cbrace}{++}

Makro "\transf" vylou�� ze seznamu str�nek ty, kter� jsou rovny
\db dgnum a \db apinum. Nechceme toti�, aby se v seznamu opakovala hlavn�
str�nka "<slova>" a podtr�en� str�nka. Tyto str�nky jsou vyti�t�ny u�
d��ve. Deklarujeme uveden� registry:

\inext {newcount\nb apinum}{\empty}{+-}

Krom� toho jsme deklarovali pomocn� \db tempnum (aktu�ln� zpracov�van�
str�nka), \db ifdash (zda zpracov�v�me souvislou skupinu str�nek 
a vytiskli jsme "--") a 
\db iffirst  (zda vkl�d�me prvn� ��slo, tj. nen� nutn� vlo�it ��rku).

Makro \db transf "<seznam str�nek>,0," spust� cyklus pomoc� \db cykltransf.

\inext {def\nb transf}{def\nb carka}{++}

Makro "\cykltransf" je takov� mal� stavov� automat. V���m, �e mu �ten��
porozum� bez dal��ho koment��e. 

\subsec [dvasloupce] V�ce sloupc�
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Sazba do v�ce sloupc� je kompletn� p�evzata z \TeX{}booku naruby,
strany 244--246. 

\ilabel [dimen1] {dimen1<2}
\inext {newdimen\nb colsep}{TBN}{++}

Zde nav�c �e��me probl�m, �e na za��tku p�epnut� do
dvou sloupc� pomoc� \db begmulti "2" si makro na ��dku~\cite[dimen1]
zkontroluje, zda nen� bl�zko dna str�nky a v takov�m p��pad� zah�j�
dva sloupce a� na nov� str�nce. Ov�em vypad� hloup�, pokud se kv�li
tomu ulom� nadpis \uv{Rejst��k} od jeho obsahu. Je tedy pot�eba
prov�st podobn� m��en� str�nky u� p�ed tiskem nadpisu \uv{Rejst��k}.
K tomu slou�� makro \db calculatedimone spu�t�n� na 
��dku~\cite[calculatedimone] v makru "\doindex".

\inext {def\nb calculatedimone}{\empty}{+-}

\subsec Z�v�re�n� nastaven�, kategorie
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

Kategorie je rozumn� nastavit a� na konci souboru {\tt docby.tex}.
Na rozd�l od plainu p�id�v�me aktivn� kategorii pro znak palce a
nastavujeme podtr��tko na oby�ejnou kategorii, proto�e se ve
zdrojov�ch k�dech program� �asto pou��v� a v�bec ne ve v�znamu
matematick�ho indexu. Kdyby mu tento v�znam z�stal, byly by jen
pot�e.

Podtr��tko je dal�� probl�m. Skoro v�dy chceme, aby se ve 
vnit�n�ch makrech chovalo jako norm�ln� podtr��tko, ale kdy� tiskneme text s
podtr��tkem fontem, kter� na dan� pozici podtr��tko nem� (to je Knuth�v
odkaz), pak by se to m�lo ud�lat plainovsk�m makrem "\_", Toto makro tedy
schov�me do \db subori a pak ho probud�me k~�ivotu jen v~okam�iku tisku
v~makrech "\printsec", "\printsubsec", "\title" a "\normalhead".
U�ivatel tedy m��e napsat "\sec moje\_funkce" a v~makrech se bude "\_" jako
oby�ejn� podtr��tko, zat�mco p�i tisku v nadpise se pou�ije "\subori".

\inext {catcode`\nb_}{\empty}{+-}

Nastaven�m "\everymath" a "\everydisplay" zaru��me matematik�m st�le
mo�nost pou��vat podtr��tko ve v�znamu indexu.

Aktivn� palec spust� lok�ln� verbatim prost�ed� uvnit� odstavce:

\inext {catcode`\nb}{\empty}{+-}

Makro \db langleactive nastav� aktivn� kategorii pro znak je men��
({\tt<}), tak�e bude mo�n� zapisovat {\tt<text>} a vytiskne se
"<text>". 

\inext {def\nb langleactive}{\empty}{+-}

V tomto dokumentu jsem "\langleactive" pou�il v makru
"\quotehook", proto�e nechat znak {\tt<} aktivn� v�ude ned�lalo dobrotu.

\doindex

\bye


