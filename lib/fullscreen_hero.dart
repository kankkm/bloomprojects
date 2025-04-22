import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class FullScreenHero extends StatefulWidget {
  const FullScreenHero({super.key});

  @override
  State<FullScreenHero> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<FullScreenHero> {
  void _launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print('Could not launch $url');
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          // Background
          Positioned.fill(
            child: CachedNetworkImage(
              imageUrl: 'https://res.cloudinary.com/dsenp6ilm/image/upload/v1744430294/f6_viczew.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.center,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Center(child: Icon(Icons.error)),
            ).animate().fadeIn(duration: 800.ms),
          ),

          // Overlay
          Container(color: Colors.black.withOpacity(0.4)),

          // Content
          Center(
            child: SingleChildScrollView( // ป้องกันล้นจอในมือถือ
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: ConstrainedBox(
                  constraints: const BoxConstraints(maxWidth: 1000),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const SizedBox(height: 0),
                      Text(
                        'บลูม โปรเจค',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.prompt(
                          fontSize: isMobile ? 36 : 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ).animate().fadeIn(delay: 200.ms).slideY(begin: 0.1),

                      const SizedBox(height: 10),
                      Text(
                        'บ้านเดี่ยวใกล้โรงพยาบาล สว่างแดนดิน',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.prompt(
                          fontSize: isMobile ? 28 : 36,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          height: 1.3,
                        ),
                      ).animate().fadeIn(delay: 300.ms).slideY(begin: 0.1),

                      const SizedBox(height: 20),
                      Text(
                        'BLOOM PROJECT',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.prompt(
                          fontSize: isMobile ? 16 : 20,
                          color: Colors.white,
                        ),
                      ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),
                      Text(
                        '“ส่งมอบความสำเร็จ เติมเต็มความฝัน”',
                        textAlign: TextAlign.center,
                        style: GoogleFonts.prompt(
                          fontSize: isMobile ? 16 : 20,
                          color: Colors.white,
                        ),
                      ).animate().fadeIn(delay: 400.ms).slideY(begin: 0.1),

                      const SizedBox(height: 40),
                      //ElevatedButton(
                       // style: ElevatedButton.styleFrom(
                        //  backgroundColor: const Color(0xFF22382C),
                        //  foregroundColor: Colors.white,
                        //  padding: const EdgeInsets.symmetric(
                          //  horizontal: 32,
                          //  vertical: 14,
                         // ),
                        //  shape: RoundedRectangleBorder(
                         //   borderRadius: BorderRadius.circular(30),
                        //  ),
                       // ),
                       // onPressed: () => _launchURL('https://lin.ee/42jCoDx'),
                       // child: Text(
                         // 'สอบถาม รายละเอียด',
                        //  style: GoogleFonts.prompt(
                          //  fontSize: isMobile ? 14 : 16,
                          //  fontWeight: FontWeight.bold,
                         // ),
                      //  ),
                    //  ).animate().fadeIn(delay: 600.ms),
                      const SizedBox(height: 80),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
