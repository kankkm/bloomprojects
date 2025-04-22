import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';

class LocationMap extends StatelessWidget {
  const LocationMap({super.key});

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
      child: Column(
        children: [
          Text(
            'แผนที่',
            style: GoogleFonts.prompt(
              color: const Color(0xFF362E24),  // Updated color
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: CachedNetworkImage(
              imageUrl: 'https://res.cloudinary.com/dsenp6ilm/image/upload/v1745289848/f23_mi2nvi.jpg',
              fit: BoxFit.cover,
              placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
              errorWidget: (context, url, error) => const Icon(Icons.error),

                          ),
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
                              'บลูม โปรเจค สว่างแดนดิน 1',
                              style: GoogleFonts.prompt(
                                color: const Color(0xFF362E24),  // Updated color
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const SizedBox(height: 20),
                            Text(
                              '3นาที ถึงโรงพยาบาล สว่างแดนดิน ใกล้ศูนย์ราชการ',
                              style: GoogleFonts.prompt(
                                color: const Color(0xFF362E24),  // Updated color
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 30),
                            LocationInfo(  // Removed const to allow style changes
                              icon: Icons.location_on,
                              text: 'ตำบล สว่างแดนดิน อำเภอสว่างแดนดิน สกลนคร 47110',
                            ),
                            //const SizedBox(height: 15),
                            //LocationInfo(
                              //icon: Icons.phone,
                              //text: '+1 (555) 123-4567',
                            //),
                           // const SizedBox(height: 15),
                            //LocationInfo(
                             // icon: Icons.email,
                             // text: 'info@bloomproject.com',
                            //),
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
                              onPressed: () => _launchURL('https://maps.app.goo.gl/eSoXkyJFJTMFgV9L8'),
                              child: const Text(
                                'คลิกดูแผนที่',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
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
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: CachedNetworkImage(
                          imageUrl: 'https://res.cloudinary.com/dsenp6ilm/image/upload/v1745289848/f23_mi2nvi.jpg',
                          fit: BoxFit.cover,
                          placeholder: (context, url) => const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) => const Icon(Icons.error),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'บลูม โปรเจค สว่างแดนดิน 1',
                            style: GoogleFonts.prompt(
                              color: const Color(0xFF362E24),  // Updated color
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 20),
                          Text(
                            '3นาที ถึงโรงพยาบาล สว่างแดนดิน ใกล้ศูนย์ราชการ',
                            style: GoogleFonts.prompt(
                              color: const Color(0xFF362E24),  // Updated color
                              fontSize: 16,
                            ),
                          ),
                          const SizedBox(height: 30),
                          LocationInfo(  // Removed const to allow style changes
                            icon: Icons.location_on,
                            text: 'ตำบล สว่างแดนดิน อำเภอสว่างแดนดิน สกลนคร 47110',
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
                            onPressed: () => _launchURL('https://maps.app.goo.gl/eSoXkyJFJTMFgV9L8'),
                            child: const Text(
                              'คลิกดูแผนที่',
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
        ],
      ),
    );
  }
}

class LocationInfo extends StatelessWidget {
  final IconData icon;
  final String text;

  const LocationInfo({
    super.key,
    required this.icon,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 20,
          color: const Color(0xFF362E24),  // Updated icon color
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Text(
            text,
            style: GoogleFonts.prompt(
              color: const Color(0xFF362E24),  // Updated text color
              fontSize: 16,
            ),
          ),
        ),
      ],
    );
  }
}