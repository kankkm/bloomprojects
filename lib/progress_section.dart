import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
      //color: Colors.black26,
      child: Column(
        children: [
          Text(
            'FEATURED PROPERTIES',
            style: GoogleFonts.prompt(
              color: const Color(0xFF22382C),
              fontSize: 32,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          const Text(
            'Explore our premium selection of properties',
            style: TextStyle(fontSize: 16, color: const Color(0xFF22382C)),
          ),
          const SizedBox(height: 40),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth > 800) {
                return const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    PropertyCard(
                      imagePath: 'assets/Images/f3.jpg',
                      title: 'Luxury Villa',
                      location: 'Sawang Dandin, Sakonnakorn',
                      price: '\$2,500,000',
                    ),
                    PropertyCard(
                      imagePath: 'assets/Images/f3.jpg',
                      title: 'Modern Apartment',
                      location: 'Sawang Dandin, Sakonnakorn',
                      price: '\$1,200,000',
                    ),
                    PropertyCard(
                      imagePath: 'assets/Images/f3.jpg',
                      title: 'Country House',
                      location: 'Sawang Dandin, Sakonnakorn',
                      price: '\$950,000',
                    ),
                  ],
                );
              } else {
                return const Column(
                  children: [
                    PropertyCard(
                      imagePath: 'assets/Images/f3.jpg',
                      title: 'Luxury Villa',
                      location: 'Sawang Dandin, Sakonnakorn',
                      price: '\$2,500,000',
                    ),
                    SizedBox(height: 20),
                    PropertyCard(
                      imagePath: 'assets/Images/f3.jpg',
                      title: 'Modern Apartment',
                      location: 'Sawang Dandin, Sakonnakorn',
                      price: '\$1,200,000',
                    ),
                    SizedBox(height: 20),
                    PropertyCard(
                      imagePath: 'assets/Images/f3.jpg',
                      title: 'Country House',
                      location: 'Sawang Dandin, Sakonnakorn',
                      price: '\$950,000',
                    ),
                  ],
                );
              }
            },
          ),
          const SizedBox(height: 30),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF22382C),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            onPressed: () {},
            child: const Text(
              'VIEW ALL PROPERTIES',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class PropertyCard extends StatelessWidget {
  final String imagePath;
  final String title;
  final String location;
  final String price;

  const PropertyCard({
    super.key,
    required this.imagePath,
    required this.title,
    required this.location,
    required this.price,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 10,
            offset: const Offset(0, 5),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(10)),
            child: Image.asset(
              imagePath,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 16,
                      color: Colors.grey,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      location,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Text(
                  price,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF22382C),
                  ),
                ),
                const SizedBox(height: 15),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF22382C),
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () {},
                    child: const Text('Buy Now'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}