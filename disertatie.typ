#set page(
  paper: "a4"
)

#set heading(numbering: "1.")
#set par(first-line-indent: 1em, justify: true)
#show par: set block(spacing: 0.65em)

// +------------------- Coperta -------------------+

#v(1cm)

#upper[
  #align(center, text(16pt)[
    Universitatea Politehnica din București \
    Facultatea de Automatică și Calculatoare
  ])
]


#v(0.5cm)

#align(center, text(12pt)[
  Grafică, Multimedia și Realitate Virtuală
])

#v(6cm)

#upper[
  #align(center, text(24pt)[
    *Proiect de diploma*
  ])
]

#v(5cm)

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #align(left)[
      #upper[
        Întrumător Ștințific
      ] \
      Prof. Dr. Ing. Moldoveanu Alin
    ]
  ],
  align(center)[
     #align(right)[
      #upper[
        Absolvent
      ] \
      Soare Robert Daniel
    ]
  ]
)

#v(6cm)
#align(center, text(12pt)[
  *Bucuresti, 2023*
])

#pagebreak()

// +------------------- Pagina de garda -------------------+

#upper[
  #align(center, text(16pt)[
    Universitatea Politehnica din București \
    Facultatea de Automatică și Calculatoare
  ])
]


#v(0.5cm)

#align(center, text(12pt)[
  Grafică, Multimedia și Realitate Virtuală
])

#v(1.5cm)

#align(right, text(12pt)[
  Aprobat Decan \
  Prof. Dr. Ing. Mihnea Alexandru Moisescu
])

#v(4cm)

#upper[
  #align(center, text(24pt)[
    *Proiect de diploma*
  ])
]

#v(1cm)

#align(center, text(17pt)[
  *Design extensibil pentru Tower Defense*
])

#v(5cm)

#grid(
  columns: (1fr, 1fr),
  align(center)[
    #align(left)[
      #upper[
        Întrumător Ștințific
      ] \
      Prof. Dr. Ing. Moldoveanu Alin
    ]
  ],
  align(center)[
     #align(right)[
      #upper[
        Absolvent
      ] \
      Soare Robert Daniel
    ]
  ]
)

#v(6cm)
#align(center, text(12pt)[
  *Bucuresti, 2023*
])

#pagebreak()

// +------------------- Cuprins -------------------+

#v(2cm)

#align(left, text(24pt)[
  *Cuprins*
])

#v(1cm)

*Introducere*
#box(width: 1fr, repeat[.])
#locate( loc => {
  let intro = query(<intro>, after: loc)
  
  intro.last().location().page()
})

#v(0.2cm)

#locate(loc => {
  let elems = query(
    heading,
    after: loc,
  )

  let heading_counter = counter(heading)

  for elem in elems {
    heading_counter.at(elem.location()).map(x => text(12pt)[#x]).join(".")
    h(0.2cm)
    elem.body
    box(width: 1fr, repeat[.])
    text(12pt)[#elem.location().page()]
    linebreak()
  }
})

*Bibliografie*
#box(width: 1fr, repeat[.])
#locate( loc => {
  let intro = query(<bio>, after: loc)
  
  intro.last().location().page()
})

#pagebreak()

// +------------------- Introducere -------------------+

#v(2cm)

#align(left, text(22pt)[
  *Introducere*
]) <intro>

#v(1cm)

Genul "tower defense" (sau "apărare prin turnuri") este un gen de joc video în care jucătorul are rolul de a construi și de a upgrada turnuri defensive pentru a împiedica invazia inamicilor și a proteja o anumită zonă sau resurse. Jucătorul trebuie să plaseze strategic turnuri cu diferite abilități și funcții, cum ar fi turnuri de tragere, turnuri de aruncare a proiectilelor sau turnuri magice, pentru a opri inamicii să ajungă la punctele cheie ale hărții sau să distrugă baza jucătorului. Pe măsură ce jocul avansează, inamicii devin tot mai puternici, iar jucătorul trebuie să-și îmbunătățească strategiile de apărare și să facă alegeri strategice pentru a reuși să reziste valurilor de inamici. 

De-a lungul anilor, genul de joc Tower Defense a evoluat și a rămas unul dintre cele mai populare genuri de jocuri în rândul jucătorilor din întreaga lume. Cu toate acestea, odată cu creșterea continuă a pieței jocurilor video, există nevoia de a inova și de a oferi jucătorilor o experiență de joc nouă și interesantă. Iar această experiență poate varia de la o valoarea educativă #cite("hernandez2015mathematics") la una pur distractivă.

Acest gen de joc este tot mai întâlnit pe platformele de jocuri mobile, precum Google Play și App Store. Punctele forte care îl fac să fie atât de popular sunt:
- Sesiuni de joc scurte care pot fi jucate oricând și oriunde.
- Nu necesită atenție continuă, jucătorul poate să se concentreze pe alte activități în timp ce jocul rulează în fundal.
- O rundă de joc poate fi câștigată prin mai multe moduri, astfel oferă o experiență de joc variată.
- Mecanică joc de simplu de învățat.
- Joc de strategie care îi oferă jucătorului satisfacția de a reuși să reziste valurilor de inamici prin prisma deciziilor strategice pe care le ia.

Un punct slab al acestui gen de joc este găsirea unui echilibru în relația dintre turnurile de apărare. In marea majoritate a jocurilor de aceste gen care au avut succes, turnurile de apărare sunt independente și nu au nevoie de ajutorul unui alt turn pentru a funcționa. Acest lucru simplifică mecanica jocului, însă poate duce la o experiență de joc monotonă. Implementarea unui sistem interdependent aduce un grad de complexitate ridicat atăt pentru jucător cât și pentru dezvoltator. Cea mai mare problemă fiind design hărții de joc care trebuie să fie concepută astfel încât să pună în evidență interdependența turnurilor de apărare.

În această lucrare, ne propunem să cercetăm un model semi-interdependent de colaborare pentru turnurile de apărare. Modelul propus va fi implementat într-un joc de tip Tower Defense, care va fi dezvoltat în programul de dezvoltare pentru jocuri video Unity. Acest model va folosii un sistem de comunicare bazat pe mesaje pentru a comunica între turnuri. Iar aceste mesaje vor fi purtate de către inamici cu denumirea de *jetoane de acțiune*.

#pagebreak()

// +------------------- Lucrare -------------------+

// #align(left, text(22pt)[
//   Capitolul 1 \
//   Tower Defense
// ])

#v(1cm)
= Genul de joc Tower Defense

#v(0.5cm)
Tower Defense este un gen de joc de strategie în care jucătorii trebuie să-și construiască și să-și îmbunătățească turnuri defensive pentru a împiedica inamicii să ajungă la obiectiv.

Jocurile de Tower Defense se desfășoară de obicei pe o hartă cu un traseu prestabilit pe care inamicii încearcă să avanseze, în timp ce jucătorii plasează și își upgradează turnurile defensive pentru a-i opri. Fiecare turn are caracteristici unice, cum ar fi raza de acțiune și puterea de foc, și trebuie plasat strategic pentru a maximiza efectivitatea sa. Jucătorii trebuie să ia decizii strategice importante în timpul jocului, cum ar fi ce tipuri de turnuri să construiască, când să le construiască și cum să le upgradeze, pentru a se asigura că pot gestiona cu succes amenințările inamice.

Genul de joc Tower Defense își are rădăcinile într-un mod popular de joc numit "Maze Games" care a început să fie jucat în anii 1980. În aceste jocuri, jucătorii trebuiau să-și construiască un traseu labirintic pentru a împiedica inamicii să ajungă la destinație. Aceste jocuri au fost inspirația pentru dezvoltarea jocurilor de Tower Defense, care au început să apară în anii 1990, în special în Japonia. Prin intermediul modurilor create pentru jocul _Warcraft 3: The Frozon Throne_, popularitatea acestui gen a fost sporită și acestea au deservit ca sursă de inspirație pentru viitoarle titluri care urmau să apară #cite("avery2011computational").

Punctele puternice ale acestui gen de joc sunt:

- Gameplay-ul relativ simplu și ușor de înțeles, ceea ce le face accesibile pentru toți jucătorii, indiferent de nivelul lor de experiență.

- Sesiuni scurte de joc împărțite în niveluri relativ scurte, ceea ce le face perfecte pentru a fi jucate în timpul pauzelor de la muncă, în transportul public sau în orice moment liber.

- Implică planificarea, gestionarea resurselor și luarea deciziilor strategice pentru a proteja o anumită zonă de atacurile inamicilor.

În următoarea listă avem exemple de jocuri populare și emblematice ale acestui gen de joc care au aparut de-a lung timpului:

- Plants vs. Zombies - În acest joc, jucătorii trebuie să își planteze flori și alte plante pentru a împiedica zombii să ajungă la casa lor. Plantele au rol de turn de apărare, iar fiecare are abilități unice. Jucătorii trebuie să le plaseze strategic pentru a opri zombii înainte ca aceștia să ajungă la locuințele lor. Jocul oferă o varietate de niveluri și moduri de joc. Acest a fost dezvoltat de către PopCap Games și a fost lansat în anul 2009.

- Kingdom Rush - Acest joc are loc într-o lume de basm, unde jucătorii trebuie să își construiască turnuri defensive și să își organizeze trupele pentru a învinge hoardele de creaturi mitice. Jocul oferă o gamă largă de turnuri și trupe, fiecare cu abilități și caracteristici unice. De asemenea, aceste este unul dintre cele mai emblematice jocuri ale genului de joc Tower Defense. Jocul a fost lansat în anul 2011 și a fost dezvoltat de către Ironhide Game Studio. Au mai fost lansate și alte versiuni ale jocului, cum ar fi Kingdom Rush: Frontiers, Kingdom Rush: Origins și Kingdom Rush: Vengeance care s-au bucurat de un succes imens.

- Bloons TD 6 - Jocul este centrat pe o tematica simple in care trebuie sa apare baza de baloane, jucătorii trebuie să își plaseze turnurile defensive (care au forma unor maimute) și să își upgradeze abilitățile pentru a împiedica baloanele să ajungă la final. Jocul oferă o mulțime de turnuri și abilități, precum și niveluri diferite cu diverse provocări. Jocul a avut parte de mai multe versiuni de-a lungul anilor. Versiunea 6 este ultima lansată și care este îmbunătățită în continuare. Acest a fost dezvoltat de către Ninja Kiwi și a fost lansat în anul 2018.

- Orcs Must Die! - O combinație interesantă între jocuri de strategie și jocuri de acțiune. Jucatorul are posibilitatea să participe în mod activ la oprirea valului de inamici prin intermediul unui personaj. Jocul oferă o gamă largă de arme și abilități pentru personaje, iar jucătorii trebuie să le folosească strategic pentru a supraviețui nivelelor și a învinge inamicii. Harta de joc se aseamană unui tunel, iar partea creativă constă în faptul cu turnurile de aparare (care apar sub forma unor capcane) pot fi poziționate pe podea, pereți și tavan. Jocul a fost lansat în anul 2011 și a fost dezvoltat de către Robot Entertainment.

- Dungeon Defenders - Acest joc combină elemente de joc de rol și Tower Defense, jucătorii trebuie să-și construiască turnurile defensive și să-și antreneze eroii pentru a învinge inamicii. Jocul oferă o gamă largă de personaje cu abilități unice, iar jucătorii trebuie să le upgradeze și să le echipeze înainte de a se aventura în nivelele următoare. Acesta prezintă o combinație interesantă între strategie și joc de rol. Jocul a fost lansat în anul 2011 și a fost dezvoltat de către Trendy Entertainment.

#pagebreak()

= Design-ul unui joc de Tower Defense

#v(0.5cm)
Design unui joc de Tower Defense este relativ simplu. În general, jocurile de Tower Defense au următoarele elemente:

- O bază care trebuie apărată de atacurile inamicilor.

- O hartă cu un traseu pe care inamicii încearcă să avanseze.

- Inamici care atacă baza jucătorului.

- Turnuri defensive care trebuie plasate strategic pentru a opri inamicii înainte ca aceștia să ajungă la baza jucătorului.

- Resurse care trebuie colectate pentru a construi turnurile defensive.

Design-ul jocurilor de Tower Defense a evoluat semnificativ în ultimii ani. Iată câteva exemple de evoluție a design-ului pentru jocurile de Tower Defense:

- Varietate în tipurile de structuri defensive. Creativitatea dezvoltatorilor a fost foarte inovatoare pentru acest aspect. Multe jocuri asemănand turnurile de apărare cu alte structuri, cum ar fi: capcane, arme, aparate sau chiar personaje. Acest lucru a oferit o flexibilitate în dezvoltarea jocurile hibride care se îmbină cu alte genuri de jocuri.

- Inamici pot fi rezistenți la anumite tipuri de atacuri sau pot avea abilități de evitare a atacurilor din partea structurilor defensive. 

- Map design si-a păstrat structura de bază, schimbările au fost mai pronunțate în ceea ce privește tematica și complexitatea treseului pentru inamici.

- Economia de joc a fost extinsă, introducerea mai multor tipuri de resurse și a unor mecanisme de colectare mai complexe au avut un impact pozitiv în cea privește partea strategică de gestionare a resurselor. Mulți dezvoltatori folosindu-se de acesta pentru a integra elementele din jocurile de tip "resource management". 


== Modele hibride de jocuri

Jocurile de Tower Defense au evoluat și au început să se îmbine cu alte genuri de jocuri, ceea ce a dus la apariția unor noi genuri de jocuri. Iată câteva exemple de modele hibride:

- Cu elemente de joc de rol și acțiune. Acestea aduc in prim-plan partea de poveste și acțiune continuă pentru a crea o experiență de joc mai interesantă. Ele se concentrează pe crearea unui univers care să-l captiveze pe jucător. Jocurile de acest tip oferă o varietate de eroi cu abilități și caracteristici unice care se îmbină cu tematica elementara a genului Tower Defense.

- Cu elemente de joc de puzzle. Acest gen se pliază foarte ușor pe genul Tower Defense, iar introducerea de mici schimbări în mecanica de joc poate duce la crearea unui joc de acest tip. Jocurile de acest tip se concentrează pe crearea unui puzzle care să fie rezolvat de către jucător. Acest puzzle poate consta în găsirea unei anumite combinații de structuri defensive care să oprească valul inamic în anumite condiții. Unele jocuri, introduc acest concept sub form de "challenge mode" care poate fi jucat de către jucători după ce au terminat jocul. Acesta consta în adaugarea de noi constrăngeri pentru jucător, cum ar fi: limitarea numărului de turnuri defensive, limitarea numărului de resurse, creșterea numărului de inamici, etc.

== O noua metoda de extindere a mecanicii de joc

Avand in vederea toate variantele prin care a evoluat genul Tower Defense, inca exista arii care nu au fost explorate. Unul dintre acestea este crearea unui sistem colaborativ intre turnurile de aparare.

In marea majoritate a jocurilor create, turnurile de aparare functioneaza independent, fiecare avand propriile sale abilitati si caracteristici. Unele jocuri au introdus mici schimbari, prin care turnurile de aparare pot fi imbunatatite, iar unele din imbunatari fiind in a oferi turnurilor vecine mici bonusuri.

Pentru a dezvolta această arie, exploram urmatoarea idee de mecanica de joc: Fiecare turn de aparare poate creea si consuma un *jeton de actiune* de pe inamicul din raza de aparară a turnului. Un jeton de actiune reprezinta o actiune care poate fi efectuata de unele turnuri de aparare si acesta este purtat de catre inamicii. Un turn de aparare poate crea un jeton de actiune care poate fi consumat de un alt turn de aparare prin intermediul inamicilor.

În mod practic, noi construim un mod de comunicare între turnuri, acestea având un comportament diferit asupra unui inamic în funcție de tipurile și numărul de jetoane de acțiune pe care le au. Un turn poate crea un jeton de acțiune prin interceptarea unui inamic în raza sa, iar apoi acel jeton poate fi consumat de un alt turn pentru a efectua o acțiune specifică. De exemplu, un turn poate crea un jeton de acțiune care să activeze un atac special. Cu cât un turn are mai multe jetoane de acțiune, cu atât importanța sa este mai mare.

Harta joc are un rol crucial în design, ea este cea care de cele mai multe ori oferă unicitate unui sesiuni de joc. În multe jocuri clasice, dimensiunea mărită a hărții de joc nu oferă prea multe oportunități deoarece de multe ori jucătorul aplică aceiași combinație turnuri, fapt care crează redundanță. Trecănd către acest sistem colaborativ, putem sesiza un nou beneficiu, și anume: hărțile de dimensiune mai mare ne oferă mai mult spațiu pentru a crea mai multe turnuri defensive, fapt care ne permite să creăm mai multe interacțiuni între acestea. 

== Compunerea jetoanelor de acțiune

Flexibilitea jetoanelor de acțiune vine din faptul că acestea pot fi compuse din mai multe tipuri de jetoane. 
Presupunem că avem următoarele tipuri de jetoane de bază:

- Jeton de bonus atac: turnurile care folosesc acest jeton vor avea un bonus de atac adăugat la valoarea lor de bază.
- Jeton de încetinire: turnurile care folosesc acest jeton vor încetini inamicii din raza lor de acțiune.
- Jeton de dublare efect: turnurile care folosesc acest jeton vor dubla efectul unui alt jeton.

Și următoarele jetoane care rezultă din compunerea celor de mai sus:

- Jeton de dublu bonus atac: turnurile care consumă acest jeton vor avea un bonus de atac dublat. Format dintr-un jeton de bonus atac și un jeton de dublare efect.
- Jeton de dublu încetinire: turnurile care consumă acest jeton vor încetini inamicii din raza lor de acțiune dublat. Format dintr-un jeton de încetinire și un jeton de dublare efect.

Pentru compunere, putem avea mai multe metode de compunere în funcție de anumite criterii:

- După vechime, jetoanele vechi sau noi create pot avea prioritate.
- După tip, jetoanele de acțiune pot avea prioritate în funcție de tipul lor.
- După număr, o anumite cantitate de jetoane pot fi necesare pentru a crea un jeton nou.

Criteriile de compunere pot fi diferite pentru fiecare turn, astfel jucătorul este pus în situația de a alege care dintre turnuri să îi dea prioritate în compunerea jetoanelor de acțiune. Astfel, adaugăm un nou element de strategie în joc.

== Tipurile de turnuri

Pentru a crea un sistem colaborativ între turnuri, trebuie să avem o gamă largă de turnuri care să fie capabile să creeze și să consume jetoane de acțiune. În acest sens, putem avea următoarele tipuri de turnuri:

- Turn de atac normal: turn care atacă inamicii din raza sa de acțiune și folosește jetoane de atac pentru a adauga un bonus de pagube la atacul său.
- Turn de încetinire: turn care încetinește inamicii din raza sa de acțiune și folosește jetoane de încetinire pentru a încetini inamicii din raza sa de acțiune.
- Turn de atac 

#pagebreak()

#v(2cm)

#align(left, text(24pt)[
  *Bibliografie*
]) <bio>

#v(1cm)

#bibliography("bibliografie.bib", title: none)