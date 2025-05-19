import 'package:flutter/material.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ℹ️ Waa'ee Koo"),
        backgroundColor: Colors.deepPurple,
      ),
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.deepPurple, Colors.indigo],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.white.withAlpha((0.95 * 255).toInt()),
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage('assets/images/icon.png'),
                      radius: 40,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "👨‍👩‍👧‍👦 Ijoollummaakoo",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      height: 400, // Adjust as needed
                      child: SingleChildScrollView(
                        child: Text(
                          "About the Developer\n\n"
                          "Hi, I'm Jiregna Worku, a 25-year-old Software Engineering student currently in my fourth year of study. I'm passionate about using technology to make quality education more accessible, especially for Oromo children.\n\n"
                          "This application is currently available in English and Afaan Oromoo, with Amharic support coming soon. My goal is to create an inclusive learning tool that helps children improve their knowledge, sharpen their minds, and confidently engage with technology.\n\n"
                          "I believe that educating children is a shared mission for humanity - and I'm proud to be contributing through this app. (Globe)(Brain)\n\n"
                          "Thank you for being part of this journey!\n\n"
                          "With love ❤️,\n"
                          "Jiregna Worku\n\n"
                          "\n\n"
                          "Ani maqaan koo Jireenyaa Warquun jedhama, umuriin koo 25. Ani barataa Software Engineering Waggaa 4ffaa dha. Ani ijoollee Oromoo hundaaf fayyadama ykn Application barnoota gaarii fi bashannanaaf ta'u uumuuf carraaqaan jira.\n\n"
                          "Application kana buustanii waan fayyadamtaniif guddaa galatomaa. Addunyaa ijoollotaa bareechuun dirqama nama hundumaati.\n\n"
                          "Yaadi kiyyaaf galmi kiyya application bareedaa ijollee keenya madaalu hojechufii, ilmolee keenya qaxaleefi kan teekinooloojiitti fayyadaman gochuufidha!\n\n"
                          "Ana faana taatanii yaada keessan waan naaf hiixattaniif Guddaa Galatomaa! ❤️"
                          " Jireenyaa Warquu,\n\n",
                          textAlign: TextAlign.center,
                          style: const TextStyle(fontSize: 18, height: 1.5),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
