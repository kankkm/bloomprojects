import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({super.key});

  // Function to launch URLs or actions
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      color: const Color(0xFFDCD5CD),
      child: Column(
        children: [
          Text(
            'ติดต่อเรา',
            style: GoogleFonts.prompt(
              color: const Color(0xFF22382C),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          //const SizedBox(height: 10),
          //const Text(
            //'We\'d love to hear from you',
            //style: TextStyle(fontSize: 16, color: const Color(0xFF22382C),),
         // ),
          const SizedBox(height: 0),
          Container(
            constraints: const BoxConstraints(maxWidth: 800),
            padding: const EdgeInsets.all(30),
            decoration: BoxDecoration(
              color: const Color(0xFF727C73),
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              children: [
                ListTile(
                  leading: const Icon(Icons.chat, color: Colors.white, size: 30),
                  title: const Text(
                    'Line',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: const Text(
                    '@bloomproject',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () => _launchURL('https://lin.ee/42jCoDx'),
                ),
                const Divider(color: Colors.white24),
                ListTile(
                  leading: const Icon(Icons.phone, color: Colors.white, size: 30),
                  title: const Text(
                    'Telephone',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: const Text(
                    '+66 62 997 9642',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () => _launchURL('tel:+66629979642'),
                ),
                const Divider(color: Colors.white24),
                // Email
                ListTile(
                  leading: const Icon(Icons.email, color: Colors.white, size: 30),
                  title: const Text(
                    'Email',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: const Text(
                    'bloomproject.dev@gmail.com',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () => _launchURL('mailto:bloomproject.dev@gmail.com'),
                ),
                const Divider(color: Colors.white24),

                // Telephone
                ListTile(
                  leading: const Icon(Icons.facebook, color: Colors.white, size: 30),
                  title: const Text(
                    'Facebook',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: const Text(
                    'BLOOM PROJECT บ้านเดี่ยวใกล้โรงพยาบาล สว่างแดนดิน',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () => _launchURL('https://www.facebook.com/bloomproject.developer'),
                ),
                const Divider(color: Colors.white24),

                ListTile(
                  leading: const Icon(Icons.photo_camera, color: Colors.white, size: 30),
                  title: const Text(
                    'Instagram',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: const Text(
                    'BLOOM PROJECT',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () => _launchURL('https://www.instagram.com/bloom.developer/'),
                ),
                const Divider(color: Colors.white24),
                ListTile(
                  leading: const Icon(Icons.tiktok, color: Colors.white, size: 30),
                  title: const Text(
                    'Tiktok',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: const Text(
                    'bloomproject_dev',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () => _launchURL('https://www.tiktok.com/@bloomproject_dev'),
                ),
                const Divider(color: Colors.white24),
                ListTile(
                  leading: const Icon(Icons.ondemand_video_sharp, color: Colors.white, size: 30),
                  title: const Text(
                    'Youtube',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  subtitle: const Text(
                    'BLOOM PROJECT บ้านเดี่ยว สว่างแดนดิน',
                    style: TextStyle(color: Colors.white70),
                  ),
                  onTap: () => _launchURL('https://www.youtube.com/@BLOOMPROJECT_Developer'),
                ),


               // const SizedBox(height: 30),
               // SizedBox(
                 // width: double.infinity,
                 // child: ElevatedButton(
                  //  style: ElevatedButton.styleFrom(
                    //  backgroundColor: const Color(0xFF1B5E20),
                     // foregroundColor: Colors.white,
                     // padding: const EdgeInsets.symmetric(vertical: 16),
                    //  shape: RoundedRectangleBorder(
                      //  borderRadius: BorderRadius.circular(8),
                     // ),
                  //  ),
                    //onPressed: () => _launchURL('mailto:contact@yourcompany.com'),
                   // child: const Text(
                      //'CONTACT US NOW',
                     // style: TextStyle(
                      //  fontSize: 16,
                       // fontWeight: FontWeight.bold,
                      //),
                  //  ),
                 // ),
              //  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}