import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class PromotionSection extends StatelessWidget {
  const PromotionSection({super.key});

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
      //color: Colors.black54,
      child: LayoutBuilder(
        builder: (context, constraints) {
          if (constraints.maxWidth > 800) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: CachedNetworkImage(
                      imageUrl: 'https://res.cloudinary.com/dsenp6ilm/image/upload/v1744430296/f8_ybjxzw.jpg',
                      fit: BoxFit.cover,
                      placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                      errorWidget: (context, url, error) => const Icon(Icons.error),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'รายละเอียดโครงการ',
                          style: GoogleFonts.prompt(
                            color: const Color(0xFF22382C),
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'บ้านเดี่ยวใกล้โรงพยาบาล สว่างแดนดิน',
                          style: GoogleFonts.prompt(  // Using Prompt font
                            color: const Color(0xFF362E24),
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 20),
                        Text(
                          'BLOOM PROJECT สว่างแดนดิน 1, โครงการที่พักอาศัย บ้านชั้นเดียวจำนวน 4 หลัง',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          'บริหารโครงการโดย : BLOOM PROJECT',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          'ก่อสร้างโดย : ทรัพย์ยิ่งเจริญ คอนสตรัคชั่น',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFF362E24),  // Updated color
                            foregroundColor: Colors.white,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 30, vertical: 15),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30),
                            ),
                          ),
                          onPressed: () => _launchURL('https://lin.ee/42jCoDx'),
                          child: const Text(
                            'ราคาบ้าน',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 30),

                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: CachedNetworkImage(
                    imageUrl: 'https://res.cloudinary.com/dsenp6ilm/image/upload/v1744430296/f8_ybjxzw.jpg',
                    fit: BoxFit.cover,
                    placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                    errorWidget: (context, url, error) => const Icon(Icons.error),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'รายละเอียดโครงการ',
                        style: GoogleFonts.prompt(
                          color: const Color(0xFF22382C),
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 20),
                      Text(
                        'บ้านเดี่ยวใกล้โรงพยาบาล สว่างแดนดิน',
                        style: GoogleFonts.prompt(  // Using Prompt font
                          color: const Color(0xFF362E24),
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'BLOOM PROJECT สว่างแดนดิน 1, โครงการที่พักอาศัย',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        'บ้านชั้นเดียวจำนวน 4 หลัง',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        'บริหารโครงการโดย : BLOOM PROJECT',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        'ก่อสร้างโดย : ทรัพย์ยิ่งเจริญ คอนสตรัคชั่น',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF362E24),  // Updated color
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () => _launchURL('https://lin.ee/42jCoDx'),
                        child: const Text(
                          'ราคาบ้าน',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }
        },
      ),
    );
  }
}