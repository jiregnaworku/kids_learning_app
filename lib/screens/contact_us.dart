import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactUsScreen extends StatelessWidget {
  const ContactUsScreen({super.key});

  final String email = 'jiregna123w@gmail.com';
  final String phone = '+251918348141';
  final String phone2 = '+251998033444';
  final String facebook = 'https://fb.com/jiro.worku';
  final String github = 'https://github.com/jiregnaworku';
  final String linkedin = 'www.linkedin.com/in/jiregna-worku-5519302aa';

  void _launchUrl(String url) async {
    final Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final feedbackController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text("Contact Us"),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Get in Touch",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.deepOrange,
              ),
            ),
            const SizedBox(height: 20),

            // Email
            ListTile(
              leading: const Icon(Icons.email, color: Colors.teal),
              title: const Text("Email"),
              subtitle: Text(email),
              onTap: () => _launchUrl('mailto:$email'),
            ),

            // Phone
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.green),
              title: const Text("Phone 1"),
              subtitle: Text(phone),
              onTap: () => _launchUrl('tel:$phone'),
            ),
            ListTile(
              leading: const Icon(Icons.phone, color: Colors.green),
              title: const Text("Phone 2"),
              subtitle: Text(phone2),
              onTap: () => _launchUrl('tel:$phone2'),
            ),

            // Facebook
            ListTile(
              leading: const Icon(Icons.facebook, color: Colors.indigo),
              title: const Text("Facebook"),
              subtitle: const Text("fb.com/jiro.worku"),
              onTap: () => _launchUrl(facebook),
            ),

            // GitHub
            ListTile(
              leading: const Icon(Icons.code, color: Colors.black),
              title: const Text("GitHub"),
              subtitle: Text(github),
              onTap: () => _launchUrl(github),
            ),

            // LinkedIn
            ListTile(
              leading: const Icon(Icons.business, color: Colors.blueAccent),
              title: const Text("LinkedIn"),
              subtitle: Text(linkedin),
              onTap: () => _launchUrl(linkedin),
            ),

            const Divider(height: 40, thickness: 2),

            const Text(
              "Send Feedback",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),

            TextField(
              controller: feedbackController,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "Write your message here...",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fillColor: Colors.orange.shade50,
                filled: true,
              ),
            ),
            const SizedBox(height: 10),

            Center(
              child: ElevatedButton.icon(
                onPressed: () {
                  final message = Uri.encodeComponent(feedbackController.text);
                  final url =
                      'mailto:$email?subject=App Feedback&body=$message';
                  _launchUrl(url);
                },
                icon: const Icon(Icons.send),
                label: const Text("Send via Gmail"),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepOrange,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 12,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
