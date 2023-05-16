#set page(
  paper: "a4"
)

#set heading(numbering: "1.")
#show heading: it => {
  v(0.8cm)
  block[
    #set align(center)
    #counter(heading).display()
    #it.body
  ]
  v(0.3cm)
}


#let sectionTitle(term) = {
  v(1cm)
  heading(
    level: 2,
    term
  )
  v(1cm)
}


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
  Aprobat Decan \`
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
  let intro = query(<intro>, loc)
  
  intro.last().location().page()
})

#v(0.2cm)

#locate(loc => {
  let elems = query(
    heading,
    loc,
  )

  let heading_counter = counter(heading)

  for elem in elems {
    let level = heading_counter.at(elem.location()).len()
    let boxWidth = 1cm * level

    linebreak()
    box(
      width: boxWidth,
      align(
        right,
        heading_counter.at(elem.location()).map(x => text(12pt)[#x]).join(".")
      )
    )
    h(0.2cm)
    elem.body
    box(width: 1fr, repeat[.])
    text(12pt)[#elem.location().page()]
  }
})

#v(0.2cm)

*Bibliografie*
#box(width: 1fr, repeat[.])
#locate( loc => {
  let intro = query(<bio>, loc)
  
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

== O nouă metodă de extindere a mecanicii de joc

Având în vedere toate variantele prin care a evoluat genul Tower Defense, încă există arii care nu au fost explorate. Unul dintre acestea este crearea unui sistem colaborativ între turnurile de apărare.

În mare majoritate a jocurilor create, turnurile de apărare funcționează independent, fiecare având propriile sale abilități și caracteristici. Unele jocuri au introdus mici schimbări, prin care turnurile de apărare pot fi îmbunătățite, iar unele din îmbunătățiri fiind în a oferi turnurilor vecine mici bonusuri.

Pentru a dezvolta această arie, explorăm următoarea idee de mecanică de joc: Fiecare turn de apărare poate crea și consuma un *jeton de acțiune* de pe inamicul din raza de apărare a turnului. Un jeton de acțiune reprezintă o acțiune care poate fi efectuată de unele turnuri de apărare și acesta este purtat de către inamicii. Un turn de apărare poate crea un jeton de acțiune care poate fi consumat de un alt turn de apărare prin intermediul inamicilor.

În mod practic, noi construim un mod de comunicare între turnuri, acestea având un comportament diferit asupra unui inamic în funcție de tipurile și numărul de jetoane de acțiune pe care le au. Un turn poate crea un jeton de acțiune prin interceptarea unui inamic în raza sa, iar apoi acel jeton poate fi consumat de un alt turn pentru a efectua o acțiune specifică. De exemplu, un turn poate crea un jeton de acțiune care să activeze un atac special. Cu cât un turn are mai multe jetoane de acțiune, cu atât importanța sa este mai mare.

Harta joc are un rol crucial în design, ea este cea care de cele mai multe ori oferă unicitate unui sesiuni de joc. În multe jocuri clasice, dimensiunea mărită a hărții de joc nu oferă prea multe oportunități deoarece de multe ori jucătorul aplică aceiași combinație turnuri, fapt care crează redundanță. Trecănd către acest sistem colaborativ, putem sesiza un nou beneficiu, și anume: hărțile de dimensiune mai mare ne oferă mai mult spațiu pentru a crea mai multe turnuri defensive, fapt care ne permite să creăm mai multe interacțiuni între acestea. 

== Compunerea jetoanelor de acțiune

Flexibilitea jetoanelor de acțiune vine din faptul că acestea pot fi compuse din mai multe tipuri de jetoane. 
Presupunem că avem următoarele tipuri de jetoane de bază:

- Jeton de bonus atac: inamciii primesc daune bonus de la proiectilele turnurilor.
- Jeton de încetinire: inamicii au viteză de mișcare redusă.
- Jeton de explozie: proiectilele turnurilor au un efect de explozie asupra inamicului și vecinilor săi.

Rangul unui jeton reprezintă numărul de jetoane de același tip pe care un inamic le deține, fiecare jeton are prestabilit un rang maxim. Un jeton de rang mai mare are un efect mai pronunțat decât unul de rang mai mic. Jetoanele pot fi combinate pentru a obține noi tipuri. De exemplu, putem avea următoarele tipuri de jetoane compuse:

- Jeton de înghețare: inamicii vor fi inghețați (viteză de mișcare 0) atăta timp căt jetonul este activ. Format dintr-un jeton de încetinire de rang 2.
- Jeton de daune de-a lungul timpului: inamicii care dețin acest jeton vor primi daune atâta timp cât jetonul este activ. Format dintr-un jeton de bonus atac de rang 3.
- Jeton de explozie la eliminare: inamicii care dețin acest jeton vor crea o explozie când sunt eliminați. Format dintr-un jeton de explozie de rang 2.
- Jeton de explozie la încetinire: inamicii care dețin acest jeton vor crea o explozie când sunt încetiniți. Format dintr-un jeton de explozie de rang 2 și un jeton de încetinire de rang 2.
- Jeton de explozie pulsantă: inamicii care dețin acest jeton vor crea o explozie în jurul lor la fiecare 3 secunde. Format dintr-un jeton de explozie de rang 2 și un jeton de bonus atack de rang 3.

Putem observa marele avantaj al acestui sistem de jetoane de acțiune, și anume: flexibilitatea. Acest sistem ne permite să creăm o varietate de jetoane de acțiune, iar acestea pot fi combinate pentru a crea noi tipuri de jetoane.

Așadar, un joc care urmează acest design poate fi extins foarte ușor fără schimbări majore în mecanica de joc. Această flexibilitate poate fi observată în jocurile de tip cărți de joc precum: _Hearthstone_ sau _Magic: The Gathering_. Aceste jocuri au o mecanică de bază simplă, însă prin intermediul extensiilor, acestea pot fi extinse cu noi tipuri de cărți care aduc varietate.


== Tipurile de turnuri

Pentru sistemul de jetoane de acțiune trebuie să avem o gamă largă de turnuri care să fie capabile să creeze și să consume jetoanele de acțiune. Vom împărți turnurile în două categorii: _active_ și _pasive_.

Proiectilele pot fi create doar de către turnurile active și acestea reprezintă principalul mod a elimina inamicii. Dar turnurile active nu pot crea jetoane de acțiune, ele pot doar consuma jetoanele de acțiune pentru a-și îmbunătăți atacul. Turnurile pasive nu pot crea proiectile, însă acestea pot crea jetoane de acțiune care pot fi consumate de către turnurile active sau de alte tunuri pasive.

Această relație de interdependență între turnuri este un aspect important în design-ul jocului, el fiind forma de coloborare care este create de acest sistem de jetoane.

În acest sens, putem avea următoarele tipuri de turnuri pasive:

- Turn pasiv de atac bonus: crează un jeton de bonus atac pentru fiecare inamic din raza sa de acțiune.
- Turn pasiv de încetinire: crează un jeton de încetinire pentru fiecare inamic din raza sa de acțiune.
- Turn pasiv de înghețare: crează un jeton de înghețare pentru fiecare inamic din raza sa de acțiune care are un jeton de încetinire de rang 2.
- Turn pasiv de explozie pulsantă: crează un jeton de explozie pulsantă pentru fiecare inamic din raza sa de acțiune care are un jeton de explozie de rang 2.

Turnurile active se aseamână cu turnurile clasice de apărare, acestea având rolul de a elimina inamicii. Dacă turnurile pasive variază prin tipul de jeton pe care îl produc, turnurile active se vor diferenția prin modelul de proiectil create și rata de atac. Iată câteva exemple de turnuri active:

- Turn activ cu proiectil simplu: acesta crează un proiectil simplu care aplică pagube primului inamic cu care intră în contact. Acesta atacă la o rată medie și aplică pagube medii.
- Turn activ de tip mortar: acesta crează un proiectil care explodează la impact și aplică pagube tuturor inamicilor din raza de acțiune a exploziei. Proiectilul explodează cănd ajunge la destiniție, acesta ignorănd inamicii din cale.
- Turn activ cu atac rapid: acesta crează un proiectil simplu care aplică pagube primului inamic cu care intră în contact. Acesta are o rată de atac ridicată, dar care provoaacă pagube mici.
- Turn activ cu proiectil inteligent: acesta crează un proiectil simplu care urmărește inamicul cel mai apropiat din raza sa de acțiune.

Având în vedere exemple de mai sus, putem observa diferite cum fiecare turn îl completează pe celălalt:
- Pentru ca turnul activ să fie eficient, ar avea nevoie de niște turnuri pasive care să încetinească inamicii.
- Turnul de tip mortar ar fi mai bun dacă inamicii ar fi mult mai încetiniți astfel încât aceștia să fie mai grupați astfel încât explozia să fie mai eficientă.
- Turnul cu proiectil inteligent nu ar avea probleme cu țintirea inamicilor așă că ar beneficia mai mult dacă inamicii ar avea un jeton de explozie pulsantă care să le reducă viața cât mai repede.

== Valul de inamici

Scopul unui inamic este să ajungă la obiectivul pe care jucătorul încearcă să-l protejeze. Pentru a ajunge la destinație, acesta trebuie să supraviețuiască atacurilor turnurilor de apărare. Inamicii au o viață și o viteză de mișcare. Viața reprezintă numărul de pagube pe care un inamic le poate suporta înainte de a fi eliminat. Viteza de mișcare reprezintă cât de repede se deplasează inamicul pe traseu.

Ca un inamic să ajungă la obiectiv, viața lui trebuie să fie mai mare decât pagubele pe care le pot produce turnurile de apărare de-a lungul traseului. Sau, poate fi mai mică, însă viteza de mișcare trebuie să fie mai mare decât viteza proiectilelor. Sunt multe moduri în care putem varia caracteristicile sale.

Proiectarea corectă a inamicilor este un aspect important în design-ul jocului. Inamicii trebuie să fie echilibrați astfel încât să ofere o provocare jucătorului și să fie în armonie cu sistemul de jetoane. Pentru inamicii nu avem un anumit tip ci un set de recomandări de design de care trebuie ținut cont:

- Un inamic nu poate fi eliminat doar prin intermediul turnurilor active -- ne dorim să existe o coloborare între turnuri, așadar turnurile pasive trebuie să aibă și ele o contribuție.
- Caracteristicile inamicului (precum: viață, viteză de mișcare) trebuie să fie în concordanță cu evoluția jocului. Inamicii devin mai puternici pe măsură ce jocul avansează.
- Generarea valului de inamici trebuie să fie consistent. În loc să generăm aleatoriu pozițiile de start al inamiciilor, putem folosi un algoritm de generare care să producă un traseu de la punctul de start la punctul final. Acest lucru ne permite să controlăm mai bine dificultatea jocului.

Unele jocuri, introduc noi mecanici de joc pentru inamicii, precum:
- Armură: atacurile de un anumit tip au un efect redus  asupra inamicilor care au armură (exemplu: -50% pagube primite de la proiectil). Aceasta, poate să introducă la rândul său noțiune de _tipuri de atac_ (exemplu: atac de foc, atac magic) unde fiecare tip de armură acționează diferit.
- Regenerare: inamicii își pot regenera viața în timpul jocului.
- Abilități speciale: inamicii care oferă un bonus altor inamici din jurul lor (exemplu: +50% viață pentru inamicii din jurul său) sau care produc o acțiune care le oferă avantaj (exemplu: crearea de noi inamicii de-a lungul traseului).

Sistemul de jetoane nu prezintă niciun impediment în implementarea acestor mecanici de joc. Chiar putem crea jetoane de acțiune care să contracareze inamicii care prezintă aceste mecanici de joc. De exemplu, putem avea un jeton de acțiune care să reducă armura inamicilor sau un jeton de acțiune care să reducă regenerarea inamicilor.

== Economia de joc

Într-un joc de tip _Tower Defense_, turnurile de apărare sunt construite și îmbunătățite prin intermediul resurselor. Aceste resurse pot fi colectate de către jucător prin intermediul unor structuri speciale sau pot fi obținute prin eliminarea inamicilor. Acest sistem reprezintă economia de joc.

Acest sistem joacă un rol important în partea strategică a jocului. Jucătorul trebuie să ia decizii strategice în ceea ce privește gestionarea resurselor. De exemplu, jucătorul poate alege să construiască mai multe turnuri de apărare de la începutul jocului, sau poate alege să construiască mai puține turnuri de apărare și să-și îmbunătățească structurile existente.

De regulă, pentru a stabili costul resurselor pentru turnurile de apărare, se pot folosii următoarele întrări:

- Câți inamicii trebuie să eliminam pentru a obține resursele necesare pentru a construi un turn de apărare?
- Câți inamicii trebuie să eliminam pentru a obține resursele necesare pentru a îmbunătăți un turn de apărare?
- Câte resurse se pot obține în total la eliminarea unui val de inamici?
- Ce turnuri putem construi cu resursele obținute după ce eliminăm X valuri de inamici?
- Care este performanța unui turn în raport cu costul său?

Un alt mod în care poate fi folosit acest sistem este cel în generarea de valuri inamice. În loc ca tipurile de inamici să fie prestabilite, acestea pot fi alese în funcție de valoarea valului de inamici. Fiecare inamic având o valoarea, inamicii pot fi aleși aleatoriu până ajungem la valoarea totală de resurse pe care dorim s-o avem pentru valul respectiv.

#pagebreak()

#v(2cm)

#align(left, text(24pt)[
  *Bibliografie*
]) <bio>

#v(1cm)

#bibliography("bibliografie.bib", title: none)