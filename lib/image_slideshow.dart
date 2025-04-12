import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cached_network_image/cached_network_image.dart'; // Added for better network image handling

class ImageSlideshow extends StatefulWidget {
  const ImageSlideshow({super.key});

  @override
  State<ImageSlideshow> createState() => _ImageSlideshowState();
}

class _ImageSlideshowState extends State<ImageSlideshow> {
  final PageController _pageController = PageController();
  final List<String> _imageUrls = [ // Changed to network URLs
    'https://res.cloudinary.com/dsenp6ilm/image/upload/v1744430302/f11_zu7vkh.png', // Replace with your actual URLs
    'https://res.cloudinary.com/dsenp6ilm/image/upload/v1744430313/f12_ubct43.png',
    'https://res.cloudinary.com/dsenp6ilm/image/upload/v1744430300/f13_c9sycg.png',
    'https://res.cloudinary.com/dsenp6ilm/image/upload/v1744430299/f14_qjr2md.jpg',
    'https://res.cloudinary.com/dsenp6ilm/image/upload/v1744430305/f15_ijjkf9.jpg',
    'https://res.cloudinary.com/dsenp6ilm/image/upload/v1744430303/f16_iu9vio.jpg',
    'https://res.cloudinary.com/dsenp6ilm/image/upload/t_tablet2/v1744434229/f17_oeycyx.jpg',
    'https://res.cloudinary.com/dsenp6ilm/image/upload/t_toiletnew/v1744434233/f18_w7nvff.jpg',
    'https://res.cloudinary.com/dsenp6ilm/image/upload/t_bed/v1744432159/f19_krfefo.jpg',
    'https://res.cloudinary.com/dsenp6ilm/image/upload/t_kitchen/v1744432165/f20_w6xsde.jpg',
  ];

  int _currentPage = 0;
  Timer? _timer;
  bool _isPlaying = true;

  @override
  void initState() {
    super.initState();
    _startAutoPlay();
  }

  @override
  void dispose() {
    _timer?.cancel();
    _pageController.dispose();
    super.dispose();
  }

  void _startAutoPlay() {
    _timer = Timer.periodic(const Duration(seconds: 5), (Timer timer) {
      if (_isPlaying) {
        _goToNextPage();
      }
    });
  }

  void _goToNextPage() {
    if (_currentPage < _imageUrls.length - 1) {
      _currentPage++;
    } else {
      _currentPage = 0;
    }
    _animateToPage(_currentPage);
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {
      _currentPage--;
    } else {
      _currentPage = _imageUrls.length - 1;
    }
    _animateToPage(_currentPage);
  }

  void _animateToPage(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void _togglePlayPause() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'รูปบ้าน',
          style: GoogleFonts.prompt(
            color: const Color(0xFF22382C),
            fontSize: 32,
            fontWeight: FontWeight.bold,
          ),
        ).animate().fadeIn().slideY(),

        // Image Slideshow
        AspectRatio(
          aspectRatio: 16 / 9,
          child: Stack(
            alignment: Alignment.center,
            children: [
              PageView.builder(
                controller: _pageController,
                itemCount: _imageUrls.length,
                onPageChanged: (int page) {
                  setState(() => _currentPage = page);
                },
                itemBuilder: (context, index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 8,
                          spreadRadius: 2,
                        ),
                      ],
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: CachedNetworkImage( // Using cached network image
                        imageUrl: _imageUrls[index],
                        fit: BoxFit.cover,
                        width: double.infinity,
                        placeholder: (context, url) => Center(
                          child: CircularProgressIndicator(
                            color: Colors.grey[300],
                          ),
                        ),
                        errorWidget: (context, url, error) => Container(
                          color: Colors.grey[200],
                          child: const Icon(Icons.error),
                        ),
                      ),
                    ),
                  ).animate().fadeIn(duration: 500.ms);
                },
              ),

              // Navigation Arrows
              Positioned(
                left: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
                  onPressed: _goToPreviousPage,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black38,
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ),
              Positioned(
                right: 16,
                child: IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.white),
                  onPressed: _goToNextPage,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black38,
                    padding: const EdgeInsets.all(16),
                  ),
                ),
              ),

              // Play/Pause Button
              Positioned(
                bottom: 20,
                child: IconButton(
                  icon: Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: Colors.white,
                    size: 30,
                  ),
                  onPressed: _togglePlayPause,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.black38,
                    padding: const EdgeInsets.all(12),
                  ),
                ),
              ),

              // Dots Indicator
              Positioned(
                bottom: 20,
                right: 20,
                child: Row(
                  children: List.generate(_imageUrls.length, (index) {
                    return Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: _currentPage == index
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    );
                  }),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}