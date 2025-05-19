import 'package:flutter/material.dart';

class AlphabetScreen extends StatelessWidget {
  final List<Map<String, String>> alphabet = [
    {
      "letter": "A",
      "emoji": "🥛",
      "word": "Aannan (Milk)",
      "description":
          "Aannan Sa'aa irraa kan argannu dhugaatii humna qabufii ijoollotaaf bayyee barbaachisaa ta'edha! -           🥛            - A nutritious white drink we got from cows.",
    },
    {
      "letter": "B",
      "emoji": "☕",
      "word": "Buna (Coffee)",
      "description":
          "Bunni dhugaatii bufaan gurraacha ta'eefii kan namoonni gurguddoon dhuganidha, naannoo oromiyaatti baayyinaan argama! -          ☕          - A popular Ethiopian drink.The arabica coffee is endiginous coffe found in ethiopia!",
    },
    {
      "letter": "C",
      "emoji": "❄️",
      "word": "Cabbii (Snow)",
      "description":
          "Cabbiin wanta bokaa waliin roobufii bayyee qabana'aa kan ta'edha ! -          ❄️          - A flying insect with beautiful wings.",
    },
    {
      "letter": "Ch",
      "emoji": "📝",
      "word": "Chaappaa (Stamp)",
      "description":
          "Chaappaan mallattoo abbaan angoo namaa kennudha! -          📝          - A stamp is a small, adhesive label used to prepay the cost of sending mail, often featuring a design and a value.",
    },
    {
      "letter": "D",
      "emoji": "🧑‍🏫",
      "word": "Dabaree (QClassroom)",
      "description":
          "Dareen kutaa barnotaa itti nuti barannudha! -       🧑‍🏫        - Classroom is a room in which a class of students is taught..",
    },
    {
      "letter": "Dh",
      "emoji": "⛰︎",
      "word": "Dhagaa (Stone)",
      "description":
          "Dhagaa jechuun wanta jabaa lafa jala ykn lafa irratti argamuudha. Dhagaa gosa garaagaraa qaba, kanneen akka kan ijaarsaaf, faayidaa addaddaa qabaniif! -             ⛰︎            - A hard, solid material found on or beneath the ground, often used in construction.",
    },
    {
      "letter": "E",
      "emoji": "🍢",
      "word": "Eeboo (spear)",
      "description":
          "Eeboon kan namoonni durii waraanaaf itti fayyadaman waan qara qabufii mukaan dabaalame dha !  -           🍢           - spear is .",
    },
    {
      "letter": "E",
      "emoji": "🍢",
      "word": "Eeboo (spear)",
      "description":
          "Eeboon kan namoonni durii waraanaaf itti fayyadaman waan qara qabufii mukaan dabaalame dha !  -               🍢            - spear is .",
    },
    {
      "letter": "F",
      "emoji": "🐎",
      "word": "Farda (Horse)",
      "description":
          "Fardi oromoo biratti bineelda manaa kabaja guddaa qabufii ulfaataa dha ! -             🐎           - A strong animal used for transport.",
    },
    {
      "letter": "G",
      "emoji": "🐪",
      "word": "Gaala (Camel)",
      "description":
          "Gaalli baabura gammoojjii jedhamtee beekamti, bishaan takkaa dhugdeen guyyaa bayyee turuu dandeessi! -           🐪           - A desert animal with humps. also called the desert train.",
    },
    {
      "letter": "H",
      "emoji": "🚣🏻‍♂️",
      "word": "Haroo (Lake)",
      "description":
          "Haroon bishaan yeroo bayyee bashannanaaf itti fayyadamnudha! kanneen akka haroo langaanoo, haroo abijaataa fa'i ! -          🚣🏻‍♂️         - A large body of water.",
    },
    {
      "letter": "I",
      "emoji": "👦",
      "word": "Ilma (Child)",
      "description": "Ilma is child - 👦 - A young boy or girl.",
    },
    {
      "letter": "J",
      "emoji": "🦍",
      "word": "Jaldeessa (Monkey)",
      "description":
          "Jaldeessi bineensa lagaa yoo ta'u jabaafii sodaachisaa kan ta'edha yeroo mara gurmuun kan adeemuufii maatii qamalotaa keessaa tokko kan ta'edha! -            🦍           - Monkeys are intelligent animals that are good at solving problems.",
    },
    {
      "letter": "K",
      "emoji": "📖",
      "word": "Kitaaba (Book)",
      "description":
          "Kitaaba irraa barannuuf bohaartiif irraa dubbisnudha ! -         📖         - Used to read and learn.",
    },
    {
      "letter": "L",
      "emoji": "🐄",
      "word": "Loon (saawwa), (Cattle)",
      "description":
          "Loon ykn Saawwi kan irraa aannan argannufii foon isanii nyaannu dha ! -          🐄         - Farm animals for milk and meat.",
    },
    {
      "letter": "M",
      "emoji": "🏠",
      "word": "Mana (House)",
      "description":
          "Manni bakka nuti keessa jiraannudha! -           🏠         - A place to live in.",
    },
    {
      "letter": "N",
      "emoji": "👤",
      "word": "Nama (Person)",
      "description":
          "Nama jechuuun si'iif maatikee dabalatee kan harka waaqaan uumamanidha ! -      👤      - A human being.",
    },
    {
      "letter": "O",
      "emoji": "📢",
      "word": "Oduu (News)",
      "description":
          "Oduun karaa foddaa TV kenyaa kan ilaallufii kan mana barnotaatti nu mudate mala ittiin gallee warra keenyatti himnudha ! -        📢        - Information or announcement.",
    },
    {
      "letter": "P",
      "emoji": "🦜",
      "word": "Paarotii (Parrot)",
      "description":
          "paarrotiin gosa simbirroo sagalee namaa akkeessu dandeessudha! -      🦜      - A colorful talking bird.",
    },
    {
      "letter": "Ph",
      "emoji": "𝗣𝗵",
      "word": "Ph qubee dachaa afaan orormoodha (English meaning...)",
      "description":
          "Qubee dachaa afaan orormoodha ! -       𝗣𝗵       - English meaning ...",
    },
    {
      "letter": "Q",
      "emoji": "🖊️",
      "word": "Qubeessa (Pen)",
      "description":
          "Qubeessa jechuun kan ittiin barreessinu dha !  -     🖊️    - Used for writing.",
    },
    {
      "letter": "R",
      "emoji": "🐛",
      "word": "Raammoo (Worm)",
      "description":
          "Raammoon bineensa lafarra lo'u yommuu ta'u lafa gara jelaaf akka qilleensa argatu godha! -        🐛       - Worms are a diverse group of invertebrate animals characterized by their elongated, usually soft, bodies..",
    },
    {
      "letter": "S",
      "emoji": "🐶",
      "word": "Saree (Dog)",
      "description":
          "Sareen bineensa manaafi kan amanamaa ta'eef ijolleen hundi kan jaallatanidha ! -      🐶      - A loyal pet.",
    },
    {
      "letter": "Sh",
      "emoji": "💃🏻🕺🏽",
      "word": "Shubbisaa (Dance)",
      "description":
          "Shubbisi gosa bashannanaa keessaa tokko kan ta'eefi ijolleen kan ittiin bohaaranidha ! -       💃🏻🕺🏽      - Dance is an art form that uses rhythmic and choreographed body movements, often performed to music, for aesthetic, symbolic, or expressive purposes.",
    },
    {
      "letter": "T",
      "emoji": "🚬",
      "word": "Tamboo (Cigarette)",
      "description":
          "Tamboon kan namoonni gurguddoon bayyeen araada isaan qabamanii xuuxan yoo ta'u, fayyaa qaama kenyaa bayyee kan miidhuuf du;aaf illee kan nama saaxiludha ! -         🚬         - Cigarette smoking is detrimental to health, increasing the risk of various diseases and damaging nearly every organ in the body. It's a major cause of lung cancer, heart disease, stroke, and other cancers..",
    },
    {
      "letter": "U",
      "emoji": "🥍",
      "word": "Ulee (Stick)",
      "description":
          "Uleen gaafa balleessinu kan ittin reebamnu ulee qalloo dha! -          🥍          - A Stick refers to a long, thin piece of wood, often a branch that has fallen from a tree, or an implement made from wood, like a hockey stick or walking stick.",
    },
    {
      "letter": "V",
      "emoji": "🦠",
      "word": "Vaayirasii (Virus)",
      "description":
          "Vaayirasiin gosa jarmii nama dhukkubsachisuu danda'udha.! -        🦠         - A tiny germ that causes illness.",
    },
    {
      "letter": "W",
      "emoji": "🐺",
      "word": "Waraabessa (Hyena)",
      "description":
          "Waraabessi gosa bineennsaa laga galufii du'aa nyaatudha ! -          🐺           - A wild scavenger animal.",
    },
    {
      "letter": "X",
      "emoji": "✉️",
      "word": "Xalayaa (Letter)",
      "description":
          "Xalayaan karaa namni tokko ergaa isaa kara waraqaan barreessee nama barbaadeef ergudha! -         ✉️         - A written message.",
    },
    {
      "letter": "Y",
      "emoji": "🐺",
      "word": "Yeeyyii (Wolf)",
      "description":
          "Yeeyyiin bineensa lagaa fi kan saree fakkaatuudha! -           🐺          - Wolves are large, canid mammals characterized by their broad skulls, long legs, and bushy tails.",
    },
    {
      "letter": "Z",
      "emoji": "🧴💦",
      "word": "Zayitii (Oil)",
      "description":
          "Zayitiin dhangala'aa nyaata bilcheessuuf itti fayadamnu dha !  -          🧴💦        - Food oils are liquid fats, typically derived from plants or animals, that are used for cooking and other culinary purposes.",
    },
  ];

  AlphabetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Afaan Oromoo Alphabet")),
      body: GridView.builder(
        padding: const EdgeInsets.all(16),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: alphabet.length,
        itemBuilder: (context, index) {
          final item = alphabet[index];
          return GestureDetector(
            onTap:
                () => showDialog(
                  context: context,
                  builder:
                      (_) => AlertDialog(
                        contentPadding: const EdgeInsets.all(20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        title: Center(
                          child: Text(
                            item['letter']!,
                            style: const TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              item['emoji']!,
                              style: const TextStyle(fontSize: 60),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item['word']!,
                              style: const TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              item['description']!,
                              textAlign: TextAlign.center,
                              style: const TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: const Text("OK"),
                          ),
                        ],
                      ),
                ),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.amberAccent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Center(
                child: Text(
                  item['letter']!,
                  style: const TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
