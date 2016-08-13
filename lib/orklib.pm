package orklib;
#
# This library provides an amusing filter routine that will convert
# english text into "ork speak". The main routine is called
# &ork_speak( $LINE ), and is passed a single line of english text
# as its sole argument. The routine returns a line of filtered text
# as the result.
#
# In order to accomplish the conversion, each line is searched for
# common expressions that have "ork speak" equivalents. These are
# converted into the equivalent form. The input line is then
# converted to lower case and split into separate words. Each
# of these words is then passed through a series of search/replace
# expressions.
#
# For efficiency the word filter routine branches to separate
# subroutines based on the first character of the word. The words are
# also filtered for frequently used suffixes and for specific
# combinations of letters . The modified line is then reassembled by
# restoring the proper case to each word and merging into a single
# string.
#
# Revision History (latest first):
# ----------------------------------------------------------------------
# 2009-08-02  RJHall  A number of revisions were made based upon
#                     suggestions and some web sources.
# 2005-08-22  RJHall  4 additions (pathetic=>weedy, blue=>bloo, &c.)
# 2002-03-03  RJHall  Initial version

# Replace letter combinations

sub replace_component
{
  $_ = shift;

  # Suffixes
  s/\'s$/'z/;
  s/able$/abul/;
  s/age$/aj/;
  s/\B(\w)al$/$1ul/;
  s/\B(\w)ally$/$1alee/;
  s/ance$/anz/;
  s/cian$/shun/;
  s/cracy$/cra\'se/;
  s/\B(\w)ed$/$1eded/ if ( length( $_ ) > 6 );
  s/\B(\w)ee$/$1ey/;
  s/\B(\w)en$/$1un/;
  s/ence$/enns/;
  s/\B(\w)er$/$1a/;
  s/ers$/az/;
  s/\B(\w)ery$/$1ury/;
  s/ese$/eyz/;
  s/([^aeiou])es$/$1z/;
  s/([^aeiou])ess$/$1ez/;
  s/([gtw])ood\b/$1ud/;
  s/graph$/recorda/;
  s/hood$/hud/;
  s/ian$/un/;
  s/ible$/ibul/;
  s/ical$/icul/;
  s/icks$/ikx/;
  s/\B([a-ln-z])ies$/$1iss/; # Don't change "'umies".
  s/ick$/ikk/;
  s/\B(\w)ing$/$1in\'/;
  s/\B(\w)ings$/$1in\'s/;
  s/(\w\w\w)ing$/$1in\'/;
  s/(\w\w\w)ings$/$1in\s/;
  s/ise$/iz/;
  s/ium$/yum/;
  s/ive$/iv/;
  s/ject$/jekt/;
  s/jects$/jeks/;
  s/like$/loik/;
  s/logy$/lergy/;
  s/ly$/lee/;
  s/ment$/munt/;
  s/ology$/oligee/;
  s/ory$/oary/;
  s/phobia$/fear/;
  s/phobic$/fearin'/;
  s/\B(\w)so$/$1sa/;
  s/thing$/fink/;
  s/tion$/shun/;
  s/tions$/shunz/;
  s/uct$/ukt/;
  s/ucts$/uks/;
  s/ues$/oos/;
  s/ule$/uul/;
  s/ure$/ur/;
  s/\B(\w)ware$/$1stuf/;
  s/wer$/wwa/;
  s/wise$/wiiz/;

  # Letter combinations
  s/gyp/jip/;
  s/ph/f/;
  s/qu/qw/;
  s/([aeiou])th([aeiou])/$1vv$2/;
  s/\Bth/d/;
  s/tt/dd/;

  return $_;
}


# Replace specific words beginning with a
sub replace_a_words
{
  $_ = shift;

  # Convert individual words
  s/^about$/ubbout/;
  s/^accurate$/akkrit/;
  s/^acknowledge$/admits/;
  s/^admiral$/sea boss/;
  s/^aeronautical$/flyin' stuf/;
  s/^aeronautics$/flyin' stuf/;
  s/^aforementioned$/same as befur/;
  s/^agriculture$/farmin/;
  s/^alchemist$/'eadbanger/;
  s/^alcohol$/booz/;
  s/^ale$/grog/;
  s/^alehouse$/grog 'owse/;
  s/^aliens$/bugeyez/g;
  s/^all$/awl/;
  s/^alright/awright/;
  s/^am$/be/;
  s/^ammunition$/ammo/;
  s/^and$/an/;
  s/^any$/ony/;
  s/^animal$/critter/;
  s/^another$/anodder/;
  s/^anything$/eenytin/;
  s/^annihilate$/grees/;
  s/^annihilated$/greesd/;
  s/^annihilation$/greesin/;
  s/^another$/anufver/;
  s/^antiseptic$/medcin'/;
  s/^appeared$/appeeahed/;
  s/^appropriate$/roight/;
  s/^archeologist$/olda uumie wizz/;
  s/^archeology$/olda uumie fingeez/;
  s/^archeological$/olda uumie stuf/;
  s/^aristocrat$/posh berk/;
  s/^aristocrats$/posh berks/;
  s/^artillery$/kannon/;
  s/^artist$/artis/;
  s/^army$/horde/;
  s/^armies$/hordes/;
  s/^armor$/armoor/;
  s/^arrow$/arrer/;
  s/^arsenist$/burna/;
  s/^artificially$/un-nach-rulee/;
  s/^artificial$/un-nach-rul/;
  s/^artillery$/bigg gun/;
  s/^artist$/feebee artse typ/;
  s/^artistic$/puffee artse/;
  s/^ascension$/risin'/;
  s/^assassinate$/snik/;
  s/^assassinated$/snik'd/;
  s/^astonished$/gob-smacked/;
  s/^astronomer$/space wizz/;
  s/^astronomy$/space fingeez/;
  s/^astronomical$/space stuf/;
  s/^attack$/dakka/;
  s/^automatic$/autow-matek/;
  s/^automatically$/autow-mat-klee/;
  s/^automobile$/car/;
  s/^aviation$/flyin/;
  s/^aviator$/flya/;
  s/^axe$/choppa/;

  return $_;
}


# Replace specific words beginning with b
sub replace_b_words
{
  $_ = shift;

  # Convert individual words
  s/^ballista$/spear chukka/;
  s/^baby$/babee/;
  s/^banner$/banna/;
  s/^battleaxe$/choppa/;
  s/^bastard$/scumbag/;
  s/^beast$/biisty/;
  s/^beat$/beet/;
  s/^beaten$/krumped/;
  s/^beating$/beetin'/;
  s/^because$/koz/;
  s/^been$/bin/;
  s/^begger$/snivla/;
  s/^beginning$/startin'/;
  s/^being$/bein'/;
  s/^better$/bedda/;
  s/^best$/bestest/;
  s/^bigger$/biggur/;
  s/^bikers$/beekaz/;
  s/^billions$/gobz an gobz/;
  s/^biologist$/lif wizz/;
  s/^biological$/lif stuf/;
  s/^biology$/lif fingeez/;
  s/^bitch$/slag/;
  s/^bitchy$/slagee/;
  s/^bitching$/toe-ragin/;
  s/^black$/blak/;
  s/^bloody$/bludy/;
  s/^bludgeoned$/kop'd/;
  s/^blue$/bloo/;
  s/^boar$/tusker/;
  s/^bolts$/boltz/;
  s/^bomber$/bomba/;
  s/^bombers$/bombaz/;
  s/^botanist$/plantz wizz/;
  s/^botanical$/plant stuf/;
  s/^botany$/plant fingeez/;
  s/^bother$/botha/;
  s/^boxing$/crumpin/;
  s/^boys$/boyz/;
  s/^brained$/kop'd/;
  s/^brawling$/crumpin/;
  s/^breckfast$/grubbup/;
  s/^brilliant$/ded brainy/;
  s/^broadcast$/browd-cass/;
  s/^broadcasting$/browd-cassin/;
  s/^brother$/brudur/;
  s/^brothers$/brudurz/;
  s/^build$/makes/;
  s/^bunch$/gaggle/;
  s/^byte$/byt whatsit/;
  s/^bytes$/byt whatsits/;

  return $_;
}


# Replace specific words beginning with c
sub replace_c_words
{
  $_ = shift;

  # Convert individual words
  s/^call$/calls/;
  s/^can$/kan/;
  s/^cannon$/kannon/;
  s/^capability$/caper-billity/;
  s/^captain$/warboss/;
  s/^cargo$/goodies/;
  s/^carnivorous$/drippin' meat eeta/;
  s/^cartigrapher$/mappboy/;
  s/^casualty$/stiffy/;
  s/^casualties$/stiffies/;
  s/^catapult$/rock chukka/;
  s/^cavities$/'oles/;
  s/^cavity$/'ole/;
  s/^chaos$/kaos/;
  s/^characteristic$/trayt/;
  s/^chastise$/duff/;
  s/^cheat$/chiid/;
  s/^cheating$/chiidin'/;
  s/^cheetah$/fasta snarla/;
  s/^cheetahs$/fasta snarlaz/;
  s/^chemical$/alcemikul/;
  s/^chemist$/'eadbanger/;
  s/^chemistry$/alcemikul fingeez/;
  s/^child$/sprog/;
  s/^chimney$/smoke belcher/;
  s/^clear$/cliir/;
  s/^club$/klub/;
  s/^cognition$/tink bits/;
  s/^cognitive$/tinkin' bits/;
  s/^coins$/shinez/;
  s/^combat$/fightin/;
  s/^combination$/mix/;
  s/^combustible$/cumbas... cobust... stuf dat burnzes,/;
  s/^come$/cumz/;
  s/^commencement$/boot out da door/;
  s/^commander$/boz/;
  s/^communication$/tellin'/;
  s/^communicated$/told/;
  s/^compensation$/pay bak/;
  s/^complicated$/'ard/;
  s/^conflict$/scrap/;
  s/^connect$/join/;
  s/^connected$/joind/;
  s/^conscious$/tinkin up/;
  s/^consciousness^/consus... conshas... when da brane woiks,/;
  s/^constitution$/consy-tushun/;
  s/^consumption$/gorgin'/;
  s/^conundrum$/'ed scracha/;
  s/^converse$/yakz/;
  s/^conversation$/yak yakk/;
  s/^conversations$/bla bla/;
  s/^conversationalist$/talka/;
  s/^convert$/convurt/;
  s/^cook$/kook/;
  s/^copter$/kopta/;
  s/^correct$/roight/;
  s/^could$/cud/;
  s/^course$/corse/;
  s/^coward$/pansy/;
  s/^cowards$/pansies/;
  s/^cowardly$/gurly/;
  s/^crankshaft$/whirly bit/;
  s/^crap$/ploppaz/;
  s/^created$/made/;
  s/^create$/makde/;
  s/^creation$/makin'/;
  s/^cremation$/burn ta ashez/;
  s/^cremated$/burnd ta ashez/;
  s/^crenellated$/bumpy topped/;
  s/^criminal$/crook/;
  s/^crossbow$/crossy bow/;
  s/^cruise$/krooz/;
  s/^cruiser/kroozer/;
  s/^crush$/crump/;
  s/^crushed$/crumped/;
  s/^cult$/kult/;
  s/^cultist^/kultee/;
  s/^cut$/snik/;

  # Prefixes
  s/^cre/kre/;

  return $_;
}


# Replace specific words beginning with d
sub replace_d_words
{
  $_ = shift;

  # Convert individual words
  s/^damage$/whumpin/;
  s/^damn$/curse/;
  s/^danger$/danjur/;
  s/^dangerous$/danjerus/;
  s/^dawn$/duwn/;
  s/^deception$/loiy/;
  s/^deceptions$/loiz/;
  s/^deceptive$/sneeky lik/;
  s/^deceptiveness$/snekeenez/;
  s/^decide$/deside/;
  s/^decision$/pik/;
  s/^decisions$/piks/;
  s/^default$/wot it usly iz/;
  s/^delay$/stop fer a bit/;
  s/^delays$/stopz fer a bit/;
  s/^delaying$/stopin fer a bit/;
  s/^delayed$/stopd fer a bit/;
  s/^dentist$/fang pulla/;
  s/^dentistry$/fang pullin/;
  s/^derive$/get/;
  s/^derived$/got/;
  s/^deriving$/gettin'/;
  s/^descension$/lowerin'/;
  s/^destroy$/dee-stroy/;
  s/^destroyed$/dee-stroyd/;
  s/^details$/bits/;
  s/^development$/new fingeez/;
  s/^device$/dealees/;
  s/^dictionary$/diksho... dishcon... er, wha' da wurdz meen,/;
  s/^difficult$/'hard/;
  s/^difficultly$/'hardnus/;
  s/^dinner$/troff time/;
  s/^direction$/drekshun/;
  s/^directions$/orderz/;
  s/^disappear$/diss-peer/;
  s/^discontinue$/stop/;
  s/^discontinuing$/stoppin/;
  s/^dishonest$/shifty/;
  s/^dishonorable$/wormee/;
  s/^disruptor$/dissrut... destrup... one 'o dem cannan,/;
  s/^do$/du/;
  s/^dogs$/doggies/;
  s/^doctor$/dok/;
  s/^doctors$/dokz/;
  s/^don\'t$/donz/;
  s/^dm$/dunjun boss/;
  s/^dms$/dunjun boz's/;
  s/^dungeon$/dunjun/;
  s/^dwarf$/drawf/;
  s/^dwarfs$/stunties/;
  s/^dwarves$/stunties/;

  return $_;
}


# Replace specific words beginning with e
sub replace_e_words
{
  $_ = shift;

  # Convert individual words
  s/^eat$/eet/;
  s/^either$/eiver/;
  s/^elastic$/strechy/;
  s/^elasticity$/strechynes/;
  s/^eldar$/panzee/;
  s/^electrical$/zappa/;
  s/^electrician$/zappa wizz/;
  s/^electricity$/zappa fingeez/;
  s/^electro/zappa/;
  s/^elementary$/les 'ard/;
  s/^elven$/elve/;
  s/^elves$/skinnies/;
  s/^embarkation$/settin off/;
  s/^emergency$/eemer-jincee/;
  s/^emperor$/bigg, bigg boss/;
  s/^enablement$/tingey dat maykz it wurk/;
  s/^engineer$/endjineer/;
  s/^engineering$/tekkee fingeez/;
  s/^english$/inglish/;
  s/^england$/ingland/;
  s/^entombed$/buriid/;
  s/^entombment$/buriid/;
  s/^entomologist$/bug wizz/;
  s/^entomological$/bug stuf/;
  s/^entomology$/bug fingeez/;
  s/^entrance$/entrey/;
  s/^equals$/eqwuls/;
  s/^equipment$/stuf/;
  s/^escalation$/increse/;
  s/^estimate$/gues/;
  s/^evaporate$/vap-rate/;
  s/^evaporates$/vap-rates/;
  s/^evaporated$/vap-ratd/;
  s/^even$/eben/;
  s/^ever$/ebur/;
  s/^every$/ebry/;
  s/^everything$/evreefin'/;
  s/^eviscerate$/rip out da gutz/;
  s/^eviscerated$/riped out da gutz/;
  s/^excellent$/primo/;
  s/^except$/'cept/;
  s/^execute$/snik/;
  s/^exercise$/wurk/;
  s/^exhausted$/zogged/;
  s/^existence$/bein/;
  s/^experience$/suffa \@t\@hru/;
  s/^experienced$/sufferd \@t\@hru/;
  s/^extended$/long/;
  s/^extensively$/offen/;

  # Prefixes
  s/^ear([lnt])/ur$1/;

  return $_;
}


# Replace specific words beginning with f
sub replace_f_words
{
  $_ = shift;

  # Convert individual words
  s/^face$/mug/;
  s/^fairy$/dandi lion eeta/;
  s/^fairies$/dandi lion eetaz/;
  s/^fart$/poot/;
  s/^farts$/pootz/;
  s/^female$/femm/;
  s/^females$/femmz/;
  s/^ferment$/brew/;
  s/^fermented$/brewd/;
  s/^ferments$/brewz/;                                      
  s/^fermentation$/brewen/;
  s/^field$/feeld/;
  s/^figured$/figgered/;
  s/^fight$/scrap/;
  s/^fighter$/dakka/;
  s/^fighters$/dakka dakka/;
  s/^fighting$/scrappin/;
  s/^final$/finol/;
  s/^first$/furst/;
  s/^five$/fiv/;
  s/^flamethrower$/burna/;
  s/^flatulence$/pootz/;
  s/^flatulent$/pootee/;
  s/^flee$/leggit/;
  s/^fleeing$/leg'n ut/;
  s/^flotsam$/floataz/;
  s/^follower$/minyun/;
  s/^food$/grub/;
  s/^fool$/blogg 'ead/;
  s/^foolish$/bloggy/;
  s/^for$/fer/;
  s/^forever$/furreva/;
  s/^formulation$/mix/;
  s/^fortress$/dur/;
  s/^foundation$/base/;
  s/^four$/fyr/;
  s/^fragrance$/smell/;
  s/^fragrant$/smelly/;
  s/^fraud$/snekeenez/;
  s/^fraudulent$/sneeky badz/;
  s/^fuck$/zogg/;
  s/^fucking$/zoggin/;
  s/^fuckin$/zoggin/;
  s/^fuckwit$/zogg 'ead/;
  s/^fuckwitted$/zogg 'edid/;
  s/^fundamental$/baysc/;
  s/^fundamentalism$/fundeezm/;
  s/^fundamentalist$/fundee/;
  s/^fundamentalists$/fundeez/;
  s/^fundamentals$/bayscs/;
  s/^fundamentally$/bayscly/;
  s/^funny$/funy/;
  s/^furrow$/gash/;

  return $_;
}


# Replace specific words beginning with g
sub replace_g_words
{
  $_ = shift;

  # Convert individual words
  s/^gangsters$/gangstahz/;
  s/^gastronomy$/grub stuf/;
  s/^general$/genrul/;
  s/^generator$/maka/;
  s/^genious$/ded brainy/;
  s/^geniouses$/brain boyz/;
  s/^geologist$/olda stuf wizz/;
  s/^geological$/olda stuf/;
  s/^geology$/durt an rok fingeez/;
  s/^get$/git/;
  s/^getting$/gerrin/;
  s/^giant$/bigun/;
  s/^giants$/biguns/;
  s/^girl$/gurl/;
  s/^goblin/gobbo/;
  s/^gods$/godz/;
  s/^gold$/shinaz/;
  s/^governed$/ruled/;
  s/^government$/guv'ment/;
  s/^governments$/guv'mentz/;
  s/^governor$/guv'na/;
  s/^grenade$/stikkbom/;
  s/^grenades$/stikkbomz/;
  s/^grenadiers$/stikkbommerz/;
  s/^groundless$/suckin pus/;
  s/^group$/mob/;
  s/^groups$/mobz/;
  s/^gr[r]+$/snarlz/;
  s/^guile$/gile/;
  s/^gun$/shoota/;
  s/^guns$/shootaz/;

  return $_;
}


# Replace specific words beginning with h
sub replace_h_words
{
  $_ = shift;

  # Convert individual words
  s/^ha!$/snort!/;
  s/^habitation$/den/;
  s/^had/ad/;
  s/^hard$/'ard/;
  s/^has$/az/;
  s/^have$/ab/;
  s/^he$/ee/;
  s/^head$/hed/;
  s/^headphone$/eer 'orn fingee/;
  s/^heater$/fire fingee/;
  s/^h([e]+)e$/\@h$1\@e/;
  s/^heightened$/more/;
  s/^helicopter/kopta/;
  s/^henchman$/thug/;
  s/^herbalist$/pansee 'erb wizz/;
  s/^herbalism$/pansee 'erb fingeez/;
  s/^herd$/urd/;
  s/^hero$/deathdefier/;
  s/^himself$/hisself/;
  s/^hill$/kop/;
  s/^hit/clomp/;
  s/^hmm$/err/;
  s/^ho$/hur/;
  s/^ho,$/hur,/;
  s/^homosexual$/poof/;
  s/^homosexuality$/poofee/;
  s/^honor$/onner/;
  s/^honors$/onnerz/;
  s/^hood$/'ud/;
  s/^horsemanship$/'orse ridin/;
  s/^house$/howse/;
  s/^hovel$/dump/;
  s/^how$/ow/;
  s/^however$/owevver/;
  s/^hp$/\@hp/;
  s/^human/uumie/;
  s/^hundreds$/lotz/;
  s/^hydroelectric$/wavver inta zappa/;
  s/^hydrological$/wavver stuff/;
  s/^hydrologist$/wavver wizz/;
  s/^hydrology$/wavver fingeez/;
  s/^hydro/wavver/;

  # Prefixes
  s/^h/'/;

  return $_;
}


# Replace specific words beginning with i-j
sub replace_i2j_words
{
  $_ = shift;

  # Convert individual words
  s/^i'd$/me da/;
  s/^identification$/ey-dee/;
  s/^idiots$/gitz/;
  s/^iirc$/iffi membaz roight/;
  s/^image$/piktur/;
  s/^imagination$/majin-ashun/;
  s/^imho$/oi tinks/;
  s/^immanent$/soon/;
  s/^immediately$/quiklee/;
  s/^impale$/gore/;
  s/^impales$/gorez/;
  s/^impaled$/gord/;
  s/^important$/big stuf/;
  s/^importance$/big deel/;
  s/^improve$/betta/;
  s/^immediately$/immedyi... imeedil... before anyfin els,/;
  s/^immobilized$/imolib... immbolz... stopped fum movin agin,/;
  s/^imnsho$/oi bludy tinks/;
  s/^imo$/oi sez/;
  s/^inadequate$/naff/;
  s/^incinerated$/vaprized/;
  s/^incineration$/vaprizin/;
  s/^incompetent$/wezzle/;
  s/^infantry$/slugga boyz/;
  s/^infinity$/imfini... intfiny... lotz and lotz/;
  s/^information/imfo-mashun/;
  s/^infrequent$/not much/;
  s/^ingratiating$/smarmy/;
  s/^ingredient$/stuf/;
  s/^inhabitant$/sqwatta/;
  s/^inhabitants$/sqwattaz/;
  s/^insane$/nutee/;
  s/^insanity$/nutz in da 'ead/;
  s/^insect$/bug/;
  s/^insects$/bugz/;
  s/^inspiration/in\'sprashun/;
  s/^instituted$/seddup/;
  s/^instructions$/orderz/;
  s/^insubstantial/mad'a fluf/;
  s/^intellectual$/brainzy/;
  s/^intelligence$/brainy/;
  s/^intelligent$/brainzy/;
  s/^into$/inta/;
  s/^into$/inta/;
  s/^intrinsic$/intrin-whazzit/;
  s/^iridescence$/'azynes/;
  s/^is$/iz/;
  s/^isn\'t$/in\'t/;
  s/^iterate$/do ova an ova/;
  s/^iterate$/duz ova an ova/;
  s/^iterated$/did ova an ova/;
  s/^itinerant$/travlin/;
  s/^itinerary$/plan/;
  s/^i\'ve/i\'s/;
  s/^initiative$/insha... inativ... ou goes furst,/;
  s/^jellyfish$/jeller fish/;
  s/^jetsam$/sinkaz/;
  s/^just$/jus'/;
  s/^juvenile$/snot droppa/;

  # Prefixes
  s/^iso/eyso/;

  return $_;
}


# Replace specific words beginning with k-l
sub replace_k2l_words
{
  $_ = shift;

  # Convert individual words
  s/^karate$/fansee crumpin/;
  s/^kb$/lotsa byt whatsits/;
  s/^kbyte$/lotsa byt whatsits/;
  s/^kbytes$/lotsa byt whatsits/;
  s/^kilobyte$/lotsa byt whatsits/;
  s/^kilobytes$/lotsa byt whatsits/;
  s/^kill$/kills/;
  s/^killer$/slayur/;
  s/^king$/bigg, bigg boss/;
  s/^kiss$/snogg/;
  s/^kissed$/snoggd/;
  s/^kissing$/snoggin'/;
  s/^knife/cutta/;
  s/^knight/nob/;
  s/^knives/cuttaz/;
  s/^know$/knowz/;
  s/^little$/lil'/;
  s/^laser$/pulsa/;
  s/^lasers$/pulsas/;
  s/^laugh$/laff/;
  s/^language$/langwage/;
  s/^languages$/langwijz/;
  s/^leader$/boz/;
  s/^learn/lern/;
  s/^leather$/levva/;
  s/^leopard$/spotted snarla/;
  s/^leopards$/spotted snarlaz/;
  s/^less$/liss/;
  s/^letter$/mark/;
  s/^letters$/markz/;
  s/^lexical$/leksic... luxisc... er, da wurdz,/;
  s/^lieutenant$/warboss/;
  s/^light$/lite/;
  s/^like$/loike/;
  s/^lion$/bigg snarla/;
  s/^lions$/bigg snarlaz/;
  s/^listen$/lissen/;
  s/^listens$/lissens/;
  s/^listened$/lissend/;
  s/^little$/bitty/;
  s/^losing$/luuzin/;
  s/^looters$/lootas/;
  s/^loudspeaker$/'orn fingee/;
  s/^lovely$/luverly/;
  s/^lunch$/grubbup/;

  return $_;
}


# Replace specific words beginning with m-n
sub replace_m2n_words
{
  $_ = shift;

  # Convert individual words
  s/^mace$/skull crusha/;
  s/^magic$/majik/;
  s/^maggots$/maggits/;
  s/^makes$/makz/;
  s/^malevolent$/badd/;
  s/^mankind$/oomie types/;
  s/^manual$/man yul/;
  s/^manufacturer$/maka/;
  s/^manufacturers$/makaz/;
  s/^manufacturing$/makin/;
  s/^map maker$/mappboy/;
  s/^massive$/garg/;
  s/^mastication$/chompin'/;
  s/^masturbate$/wank/;
  s/^masturbated$/wanked/;
  s/^masturbation$/wankin'/;
  s/^masturbating$/wankin'/;
  s/^material$/stuf/;
  s/^mb$/lotsa lotsa byt whatsits/;
  s/^mbyte$/lotsa lotsa byt whatsits/;
  s/^mbytes$/lotsa lotsa byt whatsits/;
  s/^me$/meeb/;
  s/^megabyte$/lotsa lotsa byt whatsits/;
  s/^megabytes$/lotsa lotsa byt whatsits/;
  s/^meander/me-anda/;
  s/^mech$/mek/;
  s/^mechs$/meks/;
  s/^meteorologist$/soggee weatha wizz/;
  s/^meteorological$/soggee weatha stuf/;
  s/^meteorology$/soggee weatha fingeez/;
  s/^microphone$/mik' fingee/;
  s/^microwave$/microw-whatzit/;
  s/^millions$/gobz/;
  s/^minion$/minyun/;
  s/^miserable$/mizrable/;
  s/^money$/loot/;
  s/^morons$/moronz/;
  s/^mortar$/lobba/;
  s/^mother$/muvva/;
  s/^monopolizes$/takes ova/;
  s/^mouth$/gob/;
  s/^movie$/muvee fingee/;
  s/^multitude$/lotz and lotz/;
  s/^murder$/snik/;
  s/^murdered$/snik'd/;
  s/^music$/nois/;
  s/^musical$/eer bleedin/;
  s/^musician$/nois maka/;
  s/^mutant$/mutie/;
  s/^mutants$/muties/;
  s/^my$/mi/;
  s/^myself/mi self/;
  s/^natural$/nachrul/;
  s/^naturally$/nachrulee/;
  s/^naught$/nuttin/;
  s/^navigation$/findin da way/;
  s/^navigator$/mappboy/;
  s/^necessary$/needid/;
  s/^necron$/tin'ead/;
  s/^nervous$/shuffly/;
  s/^never$/neva/;
  s/^new$/nyoo/;
  s/night$/nite/;
  s/^nine$/nuin/;
  s/^noble$/nob/;
  s/^nobles$/posh berks/;
  s/^none$/nun/;
  s/^not$/nub/;
  s/^nothing$/nuffin/;
  s/^now$/nows/;
  s/^numerous$/lotza/;

  return $_;
}


# Replace specific words beginning with o-p
sub replace_o2p_words
{
  $_ = shift;

  # Convert individual words
  s/^objective$/objektiv/;
  s/^obliterate$/stomp an crush/;
  s/^obliterates$/stomps an crushz/;
  s/^obliterated$/stompd an crushd/;
  s/^of$/o'/;
  s/^old$/ole/;
  s/^omnivorous$/grub eatin'/;
  s/^once$/wunce/;
  s/^one$/wun/;
  s/^ones$/wunz/;
  s/^opaque$/clowdy/;
  s/^opponent$/enimy/;
  s/^opponents$/enimyz/;
  s/^oratort$/rantin/;
  s/^orc$/ork/;
  s/^orcs$/orkies/;
  s/^other$/uvver/;
  s/^over$/ober/;
  s/^out$/owt/;
  s/^outrageous$/ova da top/;
  s/^painting$/piktur/;
  s/^panties$/frilly shortz/;
  s/^pathetic$/weedy/;
  s/^pavvetic$/weedy/;
  s/^paraphernalia$/stuf/;
  s/^patch/patsh/;
  s/^pedestrian$/marcha/;
  s/^penis$/nobbee/;
  s/^people$/uum\@i\@es/;
  s/^perfidious$/shifty/;
  s/^perimeter$/pamimeter/;
  s/^person$/uumie/;
  s/^personally$/purson-alee/;
  s/^person's$/uumie's/;
  s/^phonetically$/fone... fohen... 'ow it sownz,/;
  s/^photograph$/piktur fingee/;
  s/^pieces$/lil bitz/;
  s/^pigment$/color/;
  s/^pike$/skewa stik/;
  s/^pikes$/skewa stiks/;
  s/^pinacle$/top/;
  s/^please$/...wimper... pleez/;
  s/^pliable$/soff/;
  s/^pliability$/soffnes/;
  s/^pocket$/pokit/;
  s/^political$/pol-tikul/;
  s/^politics$/poltiks/;
  s/^portrait$/piktur/;
  s/^prescription$/medcin' rituul/;
  s/^president$/bigg, bigg boss/;
  s/^problem$/problum/;
  s/^produce$/make/;
  s/^production$/makin/;
  s/^productivity$/makin bizee/;
  s/^program$/stepz/;
  s/^programmer$/stepz writa/;
  s/^proletariat$/skum/;
  s/^proper$/propa/;
  s/^protruberance$/bump/;
  s/^protruding$/stikin' owt/;
  s/^psionic$/majik brainz fingee/;
  s/^psionics$/majik brainz fingees/;
  s/^public$/publikk/;
  s/^pungent$/stinkee/;
  s/^pungency$/stin-keenez/;
  s/^puzzle$/'ed scracha/;

  # Prefixes
  s/^phoe/fe/;
  s/^pre/per-/;

  return $_;
}


# Replace specific words beginning with q-r
sub replace_q2r_words
{
  $_ = shift;

  # Convert individual words
  s/^quagmire$/mire/;
  s/^quandry$/'ed scracha/;
  s/^quarterstaff$/skull splitta/;
  s/^question/qweztun/;
  s/^radio$/squawk-box/;
  s/^radiophone$/tra-smitta fingee/;
  s/^rapier$/pansee stikka/;
  s/^ran$/legged it/;
  s/^ranger$/sneakin' git/;
  s/^rangers$/sneakin' gitz/;
  s/^real$/reeel/;
  s/^really$/rilly/;
  s/^receiver$/receeva fingee/;
  s/^rectangular$/long sqware/;
  s/^redistributing$/dealin'/;
  s/^redskin/bludskin/;
  s/^reduce$/reju... redus... make reelly littul,/;
  s/^reduced$/reju... redus... made reelly littul,/;
  s/^refracts$/bendz/;
  s/^refraction$/bendin'/;
  s/^refractive$/bendz/;
  s/^refractivity$/bendin'/;
  s/^refrigerate$/freez/;
  s/^refrigerates$/freez'/;
  s/^refrigeration$/freezin/;
  s/^refrigerator$/freeza fingee/;
  s/^remember$/membur/;
  s/^repairman$/rigga/;
  s/^require$/need/;
  s/^requires$/needz/;
  s/^required$/neded/;
  s/^requirement$/need/;
  s/^requirements$/needz/;
  s/^resident$/sqwatta/;
  s/^resonance$/ringin/;
  s/^respect$/respekt/;
  s/^restore$/fix bak/;
  s/^restored$/fixd bak/;
  s/^restoration$/fixen bak/;
  s/^revolt$/take ova/;
  s/^revolution$/revu... relvo... ovathrows dem,/;
  s/^ride$/ridd/;
  s/^right$/roight/;
  s/^righteous$/proppa/;
  s/^rocket/rokkit/;
  s/^rogue$/sneaka/;
  s/^rough$/ruff/;
  s/^ruler$/boz/;
  s/^run$/scurry/;
  s/^rune$/mark/;
  s/^runes$/markz/;
  s/^running$/scurryin'/;

  # Prefixes
  s/^qu([aeiou])/qw$1/;

  return $_;
}


# Replace specific words beginning with s
sub replace_s_words
{
  $_ = shift;

  # Convert individual words
  s/^salivating$/droolin/;
  s/^savory$/yumee/;
  s/^says$/sez/;
  s/^scar$/scratchin/;
  s/^scars$/scratchinz/;
  s/^school/skool/;
  s/^scholar/scoolar/;
  s/^scimitar$/rendda/;
  s/^scimitars$/renddaz/;
  s/^semitransparency$/'azynes/;
  s/^semitransparent$/'azy/;
  s/^sensation$/feelin/;
  s/^settlement$/slag/;
  s/^seven$/sevin/;
  s/^shah$/bigg, bigg boss/;
  s/^shaman$/weerdboy/;
  s/^shamans$/weerdboyz/;
  s/^shit$/ploppaz/;
  s/^shits$/ploppaz/;
  s/^short$/stunty/;
  s/^should$/shud/;
  s/^sides$/siidz/;
  s/^sing$/sqwaak/;
  s/^singing$/sqwaakin/;
  s/^sip$/toke/;
  s/^sit$/sqwat/;
  s/^sits$/sqwatz/;
  s/^sitting$/sqwatin/;
  s/^skinny$/weedy/;
  s/^slaughter$/slorter/;
  s/^slaughterer$/slorterer/;
  s/^slaughtered$/plowin' a bleedin' field/;
  s/^slay$/snik/;
  s/^slayer$/slayur/;
  s/^slender$/weedy/;
  s/^small$/bitty/;
  s/^smell/smelie/;
  s/^snip$/snik/;
  s/^snotling$/snotgob/;
  s/^snuff$/snik/;
  s/^soda$/squig juice/;
  s/^some/sum/;
  s/^something/somfink/;
  s/^sounds$/sownz/;
  s/^speaker$/speech talka/;
  s/^spear$/pointy stick/;
  s/^spy$/sneakin' git/;
  s/^spies$/sneakin' gitz/;
  s/^squish/skwish/;
  s/^staggered$/clobberd/;
  s/^stab$/snaga/;
  s/^static$/whistlin' an craklin'/;
  s/^steal$/nick/;
  s/^stole$/nikked/;
  s/^stolen$/nikked/;
  s/^straggler$/late un/;
  s/^stragglers$/late wunz/;
  s/^strategy$/stratgee/;
  s/^strong$/strongg/;
  s/^stronghold$/dur/;
  s/^struck$/copped/;
  s/^stuff$/stuf/;
  s/^stunned$/kop'd/;
  s/^subtle$/sneeky/;
  s/^subtlety$/sneekz/;
  s/^summary$/sumree/;
  s/^super$/supa/;
  s/^superior$/bedda/;
  s/^supposed$/serposed/;
  s/^susceptibilities$/weaknez'/;
  s/^susceptibility$/weaknez/;
  s/^stupid$/stoopid/;
  s/^substantial$/solid/;
  s/^supposed$/spozed/;
  s/^submitted$/groveld/;
  s/^surgeon$/cutta/;
  s/^surgery$/cuttin/;
  s/^sword$/pointee cutta/;
  s/^swords$/pointee cuttaz/;
  s/^symptom$/sign/;
  s/^symptoms$/signs/;

  return $_;
}


# Replace specific words beginning with t
sub replace_t_words
{
  $_ = shift;

  # Convert individual words
  s/^tactical$/taktikle/;
  s/^tau$/fish'eads/;
  s/^talking$/chatterin'/;
  s/^tavern$/boozer/;
  s/^teeth$/fangs/;
  s/^technology$/mek/;
  s/^teleport$/majik jump/;
  s/^teleports$/majik jumps/;
  s/^teleporter$/majik jump fingee/;
  s/^teleportation$/majik jumpin/;
  s/^television$/telee/;
  s/^temperature$/'eat/;
  s/^temple$/tempul/;
  s/^to$/ter/;
  s/^that's$/datz/;
  s/^the$/da/;
  s/^them/dim/;
  s/^there$/der/;
  s/^they\'re/deyz/;
  s/^thin$/fin/;
  s/^thing$/fing/;
  s/^things/stuff/;
  s/^think$/tink/;
  s/third/fird/;
  s/^thirty$/triidy/;
  s/^this$/dis/;
  s/^those$/dem/;
  s/^thought$/thoght/;
  s/^thousands$/lotz an lotz/;
  s/^three$/trii/;
  s/^through$/thruu/;
  s/^throw$/chukk/;
  s/^thrower$/chukka/;
  s/^thus$/so/;
  s/^tiny$/bitty/;
  s/^to$/ta/;
  s/^together$/togevva/;
  s/^tolerant$/softey/;
  s/^tooth$/fang/;
  s/^tough$/dead 'ard/;
  s/^toughest$/dead 'ardest/;
  s/^tournament$/grudge match/;
  s/^toward$/tword/;
  s/^traitor$/pus snortin trata/;
  s/^tranquillity$/dullnez/;
  s/^transmitter$/tra-smitta fingee/;
  s/^transparency$/cleernes/;
  s/^transparent$/cleer/;
  s/^treacherous$/shifty/;
  s/^trillions$/gobz an gobz and gobz/;
  s/^troops$/ladz/;
  s/^trouble$/trubble/;
  s/^truck/trukk/;
  s/^true$/truu/;
  s/^twenty$/twody/;
  s/^two$/twuu/;

  # Prefixes
  s/^th([aeiou][mnt])/d$1/;

  return $_;
}


# Replace specific words beginning with u-v
sub replace_u2v_words
{
  $_ = shift;

  # Convert individual words
  s/^ugly$/ooglee/;
  s/^umm$/err/;
  s/^unaccustomed$/unn-akkustomed/;
  s/^unconscientious$/wormee/;
  s/^unconscious$/zoinky/;
  s/^unconsciously$/widout tinkin/;
  s/^undergoing$/doin'/;
  s/^underneath$/unda/;
  s/^understand$/noez/;
  s/^understanding$/noein/;
  s/^understands$/noes/;
  s/^underware$/unda-warz/;
  s/^unit$/oonit/;
  s/^units$/oonitz/;
  s/^unix$/uuniks/;
  s/^universe$/oo-nee-verz/;
  s/^universal$/oo-nee-verz-awl/;
  s/^unprincipled$/wormee/;
  s/^unsavory$/snotee/;
  s/^unstopable$/unstoppbul/;
  s/^urine$/ur'n/;
  s/^urinate$/ur'nate/;
  s/^useless$/weedy/;
  s/^vagabond$/slimee dogg/;
  s/^vanquish$/duff/;
  s/^vastly$/much/;
  s/^vegetarian$/stik an leef eeta/;
  s/^vegetarianism$/eetin' onli stikz an leefz/;
  s/^vehicle$/kart/;
  s/^venerable$/venar... venrab... amazin'/;
  s/^vernacular$/lingo/;
  s/^veteran$/skraga/;
  s/^via$/by/;
  s/^viscous$/t\@hikk/;
  s/^viscosity$/t\@hikknes/;

  return $_;
}


# Replace specific words beginning with w-z
sub replace_w2z_words
{
  $_ = shift;

  # Convert individual words
  s/^walk/tromp/;
  s/^want$/wan/;
  s/^war$/waa/;
  s/^we$/weeb/;
  s/^weakness$/weeknesz/;
  s/^weaknesses$/weeknessez/;
  s/^weapon$/wepin/;
  s/^weather$/wevva/;
  s/^webmaster/wheb boz/;
  s/^weenie$/pipsqueak/;
  s/^welcome/welcum/;
  s/^we\'re$/weez/;
  s/^web$/wheb/;
  s/^were$/woz/;
  s/^what$/wot/;
  s/^what's$/wotz/;
  s/^whatever$/worrevver/;
  s/^when/wen/;
  s/^where$/werr/;
  s/^wimp$/pansy/;
  s/^wimps$/pansies/;
  s/^with$/wif/;
  s/^without$/wif'out/;
  s/^withdrawal$/wifdrall/;
  s/^wolf$/wulf/;
  s/^women$/wimmen/;
  s/^wonderful$/wondaful/;
  s/^word$/wurd/;
  s/^words$/wurdz/;
  s/^work$/wurk/;
  s/^world$/woild/;
  s/^worlds$/woilds/;
  s/^would$/wuud/;
  s/^wound$/scratchin/;
  s/^wounded$/scratchd/;
  s/^wounds$/scratchin's/;
  s/^wrestling$/stompin/;
  s/^written$/ritten/;
  s/^yes$/ugh/;
  s/^you$/ya/;
  s/^you'd$/yer'd/;
  s/^your$/yer/;
  s/^you\'re$/yooz/;
  s/^zero$/nuttin/;
  s/^zoologist$/animul wizz/;
  s/^zoological$/animul stuf/;
  s/^zoology$/animul fingeez/;

  return $_;
}


# Convert specific words
sub replace_specific_word()
{
  $_ = shift;

  # HTML patterns
  s/^\&amp\;$/an/;

  # General patterns
  s/^=$/eqwals/;
  s/^([bg])ird$/$1urd/;
  s/^([bcdrw])are$/$1air/;
  s/^([dfghnry])ear$/$1eer/;

  # Branch based on starting letter
  return &replace_a_words( $_ ) if ( /^a/ );
  return &replace_b_words( $_ ) if ( /^b/ );
  return &replace_c_words( $_ ) if ( /^c/ );
  return &replace_d_words( $_ ) if ( /^d/ );
  return &replace_e_words( $_ ) if ( /^e/ );
  return &replace_f_words( $_ ) if ( /^f/ );
  return &replace_g_words( $_ ) if ( /^g/ );
  return &replace_h_words( $_ ) if ( /^h/ );
  return &replace_i2j_words( $_ ) if ( /^[ij]/ );
  return &replace_k2l_words( $_ ) if ( /^[kl]/ );
  return &replace_m2n_words( $_ ) if ( /^[mn]/ );
  return &replace_o2p_words( $_ ) if ( /^[op]/ );
  return &replace_q2r_words( $_ ) if ( /^[qr]/ );
  return &replace_s_words( $_ ) if ( /^s/ );
  return &replace_t_words( $_ ) if ( /^t/ );
  return &replace_u2v_words( $_ ) if ( /^[uv]/ );
  return &replace_w2z_words( $_ ) if ( /^[w-z]/ );

  return $_;
}


# Convert single words
sub replace_word
{
  my( $WORD ) = @_;
  my( $LEAD, $TRAIL, $NEWWORD );

  # Save a leading quote
  $LEAD="";
  if ( $WORD =~ /^['"]/ ) {
    $LEAD = substr( $WORD, 0, 1 );
    $WORD = substr( $WORD, 1 );
  }

  # Save a trailing quote
  $TRAIL="";
  if ( $WORD =~ /['"]$/ ) {
    $TRAIL = substr( $WORD, length( $WORD ) - 1, 1 );
    $WORD = substr( $WORD, 0, length( $WORD ) - 1 );
  }

  # Perform word substitution only if no change has occured
  $NEWWORD=&replace_specific_word( $WORD );
  $NEWWORD=&replace_component( $WORD ) if ( $WORD eq $NEWWORD );
  $WORD=$NEWWORD;

  # Restore quotes
  $WORD = $LEAD . $WORD . $TRAIL;

  return $WORD;
}


# Replace specific character expressions
sub replace_characters
{
  $_ = shift;

  # Special character expressions
  s/ \& / an /;
  s/\.\.\. /... erk-snorggg... /g;
  s/:-\)/)=]/g;
  s/=\)/)=]/g;
  s/\:\-\(/\)=\[/g;
  s/\:\-P/\)=P/g;
  s/\:\-D/\)=D/g;
  s/(!!+)/$1 Waaagh$1/g;

  return $_;
}


# Convert multi-word combinations
sub replace_multi_word
{
  $_ = shift;

  ### Word combinations
  s/\ba lot\b/lots/;
  s/\bA lot\b/Lots/;
  s/\b([Aa])ll of\b/$1lla/g;
  s/\bare so\b/so/g;
  s/\b([Aa])ren't you\b/$1rncha/g;
  s/\barmored personnel carrier/wartrak/g;
  s/\b([Aa])t a\b/$1tz a\b/g;
  s/\batomic bomb\b/melta-bomb/g;
  s/\bAttack\!\b/Dakka dakka dakka\!/;
  s/\battack the\b/stomp da/g;
  s/\bAttack the\b/Stomp da/g;
  s/\bbeautiful music\b/eer bleedin nois/;
  s/\bBeautiful music\b/Eer bleedin nois/;
  s/\bbeautiful sunshine\b/foul sunlight/;
  s/\bBeautiful sunshine\b/Foul sunlight/;
  s/\bblown to\b/splutched ta/;
  s/\bblowning them\b/splutchin dem/;
  s/\bby default\b/just cuz/g;
  s/\bBy default\b/Just cuz/g;
  s/\bcell phone\b/beema fingee/;
  s/\bCell phone\b/Beema fingee/;
  s/\bchimney stack\b/bigg smoke belcher/g;
  s/\bdefeat the\b/stomp da/g;
  s/\bDefeat the\b/Stomp da/g;
  s/\b([Dd])id it\b/$1iddit/g;
  s/\b([Dd])id you\b/$1idja/g;
  s/\bdestroyed them\b/stompd 'em fer good/g;
  s/\bdomestic cat\b/stuntee snarla/;
  s/\bdomestic cats\b/stuntee snarlaz/;
  s/\bDomestic cat\b/Stuntee snarla/;
  s/\bDomestic cat\b/Stuntee snarlaz/;
  s/\b([Dd])one it\b/$1unnit/g;
  s/\b([Dd])on't you\b/$1oncher/g;
  s/\b([Aa]) dweeb\b/$1 bleeder/g;
  s/\b([Aa]) real dweeb\b/$1 nasty lookin' bleeda/g;
  s/\bextreme pain\b/nasty, nasty pain/g;
  s/\b([Ff])ar away\b/$1ar ways away/;
  s/\b([Ff])etch it\b/$1etchitt/;
  s/\bFight\!\b/Dakka dakka dakka\!/;
  s/\bflame thrower\b/burna/g;
  s/\bFlame thrower\b/Burna/g;
  s/\b([Ff])orget it\b/$1ergerrit/g;
  s/\b([Ff])or you\b/$1'yers/g;
  s/\b([Ff])or himself./$1er iz-sloshed-self./g;
  s/\b([Ff])rom it/$1rommit/g;
  s/\bgardener\b/pansee flowaz growa/;
  s/\bGardener\b/Pansee flowaz growa/;
  s/\bgardening\b/pansee flowa growin/;
  s/\bGardening\b/Pansee flowa growin/;
  s/\b([Gg])et out\b/$1errout/g;
  s/\b([Gg])et us\b/$1errus/g;
  s/\b([Gg])et you\b/$1etcha/g;
  s/\bgo away\b/zogg off/g;
  s/\b([Gg])ood hit\b/$1ood wallop/g;
  s/\b([Gg])ot to\b/$1otta/g;
  s/\b([Gg])ot us\b/$1orrus/g;
  s/\bgreat axe\b/choppa/g;
  s/\bguard dog\b/snarla dog/;
  s/\bhand-to-hand\b/hand-fer-hand/g;
  s/\b([Hh])as to\b/$1asta/g;
  s/\bhave a\b/gotsa/g;
  s/\bHave a\b/Gotsa/g;
  s/\bhave to\b/gotta/g;
  s/\bHave to\b/Gotta/g;
  s/\b(Hh])e,/$1ur,/g;
  s/he[e]*(he[e]*)+/mwahahahaha/g;
  s/He[e]*(he[e]*)+/Mwahahahaha/g;
  s/\bheavy machine gun\b/big shoota/g;
  s/\bhere is\b/erez/g;
  s/\bHere is\b/Erez/g;
  s/\bhighly intelligent\b/roight brainy/;
  s/\bHighly intelligent\b/Roight brainy/;
  s/\bhomo sapien([s]*)\b/uumie$1/;
  s/\bhow our\b/owa/g;
  s/\bHow our\b/Owa/g;
  s/\bhydrogen bomb\b/bigg melta-bomb/g;
  s/^I\b/Me/g;
  s/([.?!]\s+)I\b/$1 Me/g;
  s/\bI\b/me/g;
  s/\bi don't\b/me no/g;
  s/\bi learned\b/learned me/g;
  s/\b([Ii])n it\b/([Ii])nnit/g;
  s/\b([Ii])n there./$1n der an all./g;
  s/\bImperial Guard\b/'umies/g;
  s/\bImperial Guards\b/'umies/g;
  s/\binstitute of\b/den o'/g;
  s/\bInstitute of\b/Den o'/g;
  s/\b([Ii])s sleeping\b/$1z koppin' a wink/;
  s/\b([Ii])s that\b/$1zzat/g;
  s/\bit's ([a-z])/s'$1/g;
  s/\bIt's ([a-z])/S'$1/g;
  s/\bi will do\b/me does/;
  s/\bI will do\b/Me does/;
  s/\bi will make\b/me makes/;
  s/\bI will make\b/Me makes/;
  s/\b([Kk])ind of\b/$1ina /g;
  s/\b([Ll])ots of\b/$1otsa /g;
  s/\blovely music\b/eer bleedin nois/;
  s/\bLovely music\b/Eer bleedin nois/;
  s/\bmachine gun\b/bolta/g;
  s/\bmachine guns\b/boltaz/g;
  s/\bMachine gun\b/Bolta/g;
  s/\bMachine guns\b/Boltaz/g;
  s/\bmade love to\b/bonked/g;
  s/\bMade love to\b/Bonked/g;
  s/\bmake love.\b/bonk./g;
  s/\bmake love to\b/bonk/g;
  s/\bMake love to\b/Bonk/g;
  s/\bmaking love.\b/bonkin'./g;
  s/\b([Mm])ore than\b/$1or'un/g;
  s/\b([Mm])ost brilliant\b/$1ost brillist/g;
  s/\b([Mm])otion picture\b/$1uvee fingee/;
  s/\bmove over\b/shift yerself/g;
  s/\bmust i\b/needs must me/;
  s/\bMust i\b/Needs must me/;
  s/\b([Mm])y goodness\b/$1i drippin snoz/g;
  s/\bNo!\b/Nar!/g;
  s/\bnot too bright\b/stoopid/;
  s/\bNot too bright\b/Stoopid/;
  s/\bnot very intelligent\b/stoopid/;
  s/\bNot very intelligent\b/Stoopid/;
  s/\b([Oo])h my/\b$1w mi stinke\@e gizzard/g;
  s/\bone of\b/wona/g;
  s/\b([Oo])n a\b/$1na/g;
  s/\b([Oo])ur men\b/([Oo])ur boyz/g;
  s/\b([Oo])ut of\b/$1uta/g;
  s/\b([Oo])ught to\b/$1ughtta/g;
  s/\b([Pp])ay tribute\b/$1ay wargud/g;
  s/\bPlease\b/...snivuls... Pleez/g;
  s/\bplasma cannon\b/zappa kannon/g;
  s/\bplasma gun\b/zappa kannon/g;
  s/\bprime minister\b/bigg, bigg boss/;
  s/\bPrime [Mm]inister\b/Bigg, bigg boss/;
  s/\bquite good\b/ded good/g;
  s/\bQuite good\b/Ded good/g;
  s/\brich reward\b/lotsa luverly loot/g;
  s/\brun away\b/leggit/g;
  s/\bRun away\b/Leggit/g;
  s/\brunning away\b/leg'n ut/g;
  s/\bRunning away\b/Leg'n ut/g;
  s/\bself[ -]evident\b/ob-vey-us/g;
  s/\bsevere pain\b/nasty pain/g;
  s/\b([Ss])hake a stick at\b/$1hake a dead rat/g;
  s/\bshock troops\b/'ead collectors/g;
  s/\bShoot\!\b/Dakka dakka dakka\!/;
  s/\bShoot first, ask questions later.\b/Bash furst, ask latta. Den bash agin./g;
  s/\b([Ss])hould have\b/$1hudda/g;
  s/\b([Ss])hut up\b/([Ss])hurrup /g;
  s/\bspace marine\b/beaky/g;
  s/\bSpace Marine\b/beaky/g;
  s/\b([Ss])tand aside\b/$1hift yerself/g;
  s/\bstreet gang/warband/g;
  s/\bStreet gang/Warband/g;
  s/\bTau\b/Fish'eds/g;
  s/\bTaus\b/Fish'eds/g;
  s/\bteach them\b/learn 'em/g;
  s/\bthis is what\b/dis 'ere's wot's/g;
  s/\bthree times\b/thrice/g;
  s/\btolerant of\b/soft tword/g;
  s/\b([Tt])oo numerous\b/$1oo menee/;
  s/\b([Tt])o read\b/$1o reed/;
  s/\b([Tt])o sleep\b/$1a kop a wink/;
  s/\bugly looking\b/nasty lookin/g;
  s/\bugly-looking\b/nasty-lookin/g;
  s/\bvery good\b/crakklin good/g;
  s/\bVery good\b/Crakklin good/g;
  s/\bvery intelligent\b/roight brainy/;
  s/\bVery intelligent\b/Roight brainy/;
  s/\bvice president\b/sub-boss/;
  s/\bVice [Pp]resident\b/Sub-boss/;
  s/\b([Ww])as a\b/$1uzza/g;
  s/\b([Ww])as nothing\b/$1oz no nuffin/;
  s/\b([Ww])as sleeping\b/$1oz koppin' a wink/;
  s/\b([Ww])e are\b/$1eez/g;
  s/\bwelding torches\b/skorchaz/g;
  s/\bwelding torch\b/skorcha/g;
  s/\bWhat[?]\b/Wotwot\?/g;
  s/\b([Ww])hat are you\b/$1otcher/g;
  s/\b([Ww])hat are your\b/$1otcher/g;
  s/\b([Ww])hat do\b/$1otter/g;
  s/\b([Ww])hat do you\b/$1otcher/g;
  s/\b([Ww])hat do your\b/$1otcher/g;
  s/\b([Ww])hat happened\b/$1hadappened /g;
  s/\b([Ww])hat is it\b/$1arrizt/g;
  s/\b([Ww])hat is\b/$1oss/g;
  s/\b([Ww])hat's\b/$1oss/g;
  s/\b([Ww])hat's that\b/$1osat/g;
  s/\b([Ww])hat you are\b/$1otcher/g;
  s/\b([Ww])hat you're\b/$1otcher/g;
  s/\bwho is\b/oose/g;
  s/\bWho is\b/Oose/g;
  s/\b([Yy])ou are\b/$1er/g;
  s/\bknow what\b/know-wotz/g;
  s/\b([Yy])ou know\b/$1'knowz/g;
  s/\b([Yy])our hands\b/$1er grubby lil' 'ands/g;
  s/\b([Yy])our worship/$1er boss-ship/g;

  # Suffixes
  s/g as\b/'z/g;

  return $_;
}


# Replace nasty expressions
sub replace_bad_expressions
{
  $_ = shift;

  # Nasty, naughty expressions
  s/\bbad ass\b/dead 'ard wun/g;
  s/\bbutt ugly\b/festerin' scabbie/g;
  s/\bcocksucker\b/weedy skum/g;
  s/\bCocksucker\b/Weedy skum/g;
  s/\bcunt\b/stinka/g;
  s/\bCunt\b/Stinka/g;
  s/\bkick your ass\b/plant a hobnailed boot up yer smelly bum/g;
  s/\bkicks your ass\b/plants a hobnailed boot up yer smelly bum/g;
  s/\bfaggot\b/fairee lova/g;
  s/\b([Ff])ilthy swine\b/$1ilthy maggit/g;
  s/\b([Ff])or god's sake\b/$1er spog's sake/g;
  s/\bfuck off\b/zogg off/g;
  s/\bFuck off\b/Zogg off/g;
  s/\b([Gg])ot balls\b/$1ot da bigg bruggs/g;
  s/\b([Gg])ot big balls\b/$1ot da bigg bruggs/g;
  s/\b([Gg])ot brass balls\b/$1ot ad bigg shinee bruggs /g;
  s/\bfucking shit\b/zoggin ummie snot/g;
  s/\bFucking shit\b/zoggin ummie snot/g;
  s/\b([Ff])uck you\b/$1ragg yer snot/g;
  s/\b([Aa]) jerk\b/$1 toerag/g;
  s/\bof jerks\b/of toerags/g;
  s/\b([Ll])ittle prick\b/$1il' nobb/;
  s/\bpiece of shit\b/goolash sucka/g;
  s/\bPiece of shit\b/Snivvelin dawg/g;
  s/\bpiss off\b/goz off/g;
  s/\bPiss off\b/Goz off/g;
  s/\bpissed off/ madd/g;
  s/\breally pissed off\b/madda dan a rabid wulf/g;
  s/\bscared shitless\b/actin all twitchy/g;
  s/\bshit for brains\b/squig fer brainz/g;
  s/\bshithead\b/squig 'ead/g;
  s/\bson of a bitch\b/pansie ellvee git/g;
  s/\btits\b/\bbitts\b/g;
  s/\bup yours\b/err-hhrukk/g;
  s/\bUp yours\b/Err-hhrukk/g;
  s/\b([Yy])ou asshole\b/$1a smelly pusburner/g;
  s/\b([Yy])ou mother fucker/you cross-eyed molester/g;
  s/\b([Yy])es sir\b/$1ezzir/g;

  return $_;
}


# kop
# squig - dobla
# dakka dakka

#Suggested replacements:
#
#knocked out - copped
#worm
#maggot
#grub
#scrap
#runt
#stick
#pesky
#puny
#we ain't got no respect
#weedy
#warparty
#cross-eyed
#backstabbers
#aarrgh!
#show 'em who is the real boss.
#broken nose
#gizzard stew
#spearchuckers
#mangler
#quest trash
#nasty lookking bleeders
#fingy
#open sore
#gobsmackin
#legbreakin
#eyegougin
#sore boyz
#nasties
#stinkee
#little snot
#scarhide
#hairy backed
#snout nosed
#elfboy
#dung-eatin' filth
#tongue that waggles
#slag (loose woman)


# -----------------------------------------------------------------
# This is the main library routine. It is called as follows:
#
#   require "orklib";
#   $ORK = orklib::ork_speak( $LINE );
#
# where $LINE is a string consisting of an expression in english.
# It returns a string of filtered text as the result.
# -----------------------------------------------------------------

sub ork_speak
{
  my( $LINE ) = @_;
  my( $WORD, $UC, $LENGTH, $MAX, $MOD );
  my( @WORDS, @MSG );

  # Initialization
  $MAX=0;

  # Wildcard is "@", followed by the character to be preserved.
  # So save wildcard character by inserting an extra '@'.
  $LINE=~s/^\@/\@\@/;

  # Filter combinations of words
  $LINE=replace_bad_expressions( $LINE );
  $LINE=replace_multi_word( $LINE );
  $LINE=replace_characters( $LINE );

  # Filter individual words
  @WORDS=split( /([^\-A-Za-z\'\"\@])/, $LINE );
  @MSG=();
  foreach $WORD ( @WORDS ) {
    ### Get the word length and compare to maximum
    $LENGTH = length( $WORD );
    next if ( $LENGTH <= 0 );
    $MAX = $LENGTH if ( $LENGTH > $MAX );

    # Save the case
    $UC=0;
    if ( $WORD =~ /[A-Z]/ ) {
      # Is the word all upper case?
      $UC=( $WORD =~ /[A-Z][A-Z]+/ ) ? 2 : 1;
    }

    # Filter the lower case word
    $WORD=&replace_word( lc( $WORD ) );

    # Restore the proper case
    $WORD=uc( $WORD ) if ( $UC == 2 );
    if ( $UC == 1 ) {
      if ( $WORD =~ /^[^a-z][a-z]/ ) {
        $WORD = substr( $WORD, 0, 1 ) . ucfirst( substr( $WORD, 1 ) );
      } else {
        $WORD=ucfirst( $WORD );
      }
    }

    # Add word to message array
    push( @MSG, $WORD );

    # Check for a convenient end of sentence
    if ( ( $WORD =~ /^[.?!]$/ ) && ( $MAX > 13 ) ) {
      # Orks no like da rilly bigg wurdz
      push( @MSG, " Oww, da bigg wurdz make mi 'ed 'urt!" );
      $MAX=0;
    }
  }

  # Strip out the wildcards
  $LINE=join( '', @MSG );
  $LINE=~s/@(.)/$1/g;

  # Return the converted line
  return $LINE;
}

1;
