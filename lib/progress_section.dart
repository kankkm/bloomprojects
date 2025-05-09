import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:url_launcher/url_launcher.dart';

class ProgressSection extends StatefulWidget {
  const ProgressSection({super.key});

  @override
  State<ProgressSection> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<ProgressSection> {
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
                      imageUrl: 'https://res.cloudinary.com/dsenp6ilm/image/upload/v1745291947/f27_dyqzjq.jpg',
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
                          'จองวันนี้ รับสิทธิพิเศษ',
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
                          '1. ส่วนลด',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          '2. ฟรี! จอง ประเมิน',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          '3. ฟรี! ค่าโอน',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          '4. ฟรี! แอร์ 1 เครื่อง',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          '5. ฟรี! เครื่องทำน้ำอุ่น 1 เครื่อง',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          '6. ฟรี! ชุดเคาน์เตอร์ครัว ยาว 5 เมตร',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          '7. ฟรี! สนามหญ้า',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          '8. ฟรี! ระบบกันปลวก',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          '9. ประกันบ้านทุกส่วน 1 ปี',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          '10. ประกันงานโครงสร้าง 10 ปี',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        Text(
                          '11. *โครงสร้าง ลงเสาเข็มลึก 6 เมตร ทุกต้น (บ้านแข็งแรงมาก)',
                          style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                         style: ElevatedButton.styleFrom(
                         backgroundColor: const Color(0xFF22382C),
                         foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                          horizontal: 32,
                          vertical: 14,
                         ),
                          shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(30),
                          ),
                         ),
                         onPressed: () => _launchURL('https://lin.ee/42jCoDx'),
                         child: Text(
                         'จอง',
                          style: GoogleFonts.prompt(
                          fontSize: isMobile ? 14 : 16,
                          fontWeight: FontWeight.bold,
                         ),
                          ),
                          ).animate().fadeIn(delay: 600.ms),
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
                    imageUrl: 'https://res.cloudinary.com/dsenp6ilm/image/upload/v1745291947/f27_dyqzjq.jpg',
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
                        'จองวันนี้ รับสิทธิพิเศษ',
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
                        '1. ส่วนลด',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        '2. ฟรี! จอง ประเมิน',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        '3. ฟรี! ค่าโอน',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        '4. ฟรี! แอร์ 1 เครื่อง',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        '5. ฟรี! เครื่องทำน้ำอุ่น 1 เครื่อง',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        '6. ฟรี! ชุดเคาน์เตอร์ครัว ยาว 5 เมตร',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        '7. ฟรี! สนามหญ้า',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        '8. ฟรี! ระบบกันปลวก',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        '9. ประกันบ้านทุกส่วน 1 ปี',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        '10. ประกันงานโครงสร้าง 5 ปี',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      Text(
                        '11. *โครงสร้าง ลงเสาเข็มลึก 6 เมตร ทุกต้น (บ้านแข็งแรงมาก)',
                        style: GoogleFonts.prompt(color: const Color(0xFF362E24),fontSize: 16),
                      ),
                      const SizedBox(height: 30),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF22382C),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 32,
                            vertical: 14,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        onPressed: () => _launchURL('https://lin.ee/42jCoDx'),
                        child: Text(
                          'จอง',
                          style: GoogleFonts.prompt(
                            fontSize: isMobile ? 14 : 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ).animate().fadeIn(delay: 600.ms),
                      const SizedBox(height: 30),
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