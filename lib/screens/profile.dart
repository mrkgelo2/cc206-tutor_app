import 'package:flutter/material.dart';
import 'package:cc206_tutor_app/bottom_navbar.dart';
import 'package:cc206_tutor_app/screens/saved_tutors.dart';
import 'package:cc206_tutor_app/screens/settings.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff108fc4),
          title: Text(
            'Me',
            textAlign: TextAlign.center,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold, color: Colors.white),
          ),
          centerTitle: true,
        ),
        bottomNavigationBar: const Navigation(currentIndex: 4),
        body: Padding(
          padding: const EdgeInsets.all(0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile section and profile avatar
              Container(
                padding: const EdgeInsets.all(16),
                decoration: const BoxDecoration(
                  color: Color(0xff108fc4),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage:
                          const AssetImage("assets/images/kensho.jpg"),
                    ),
                    const SizedBox(height: 16),
                    Text(
                      'Kenneth Balayon',
                      style: GoogleFonts.poppins(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      'College, 3rd Year',
                      style: GoogleFonts.poppins(color: Colors.white70),
                    ),
                    Text(
                      'West Visayas State University',
                      style: GoogleFonts.poppins(color: Colors.white70),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        _buildIconCircle(Ionicons.mail_outline),
                        const SizedBox(width: 12),
                        _buildIconCircle(Ionicons.call_outline),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: Container(
                            height: 30,
                            width: 1,
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        _buildIconCircle(Ionicons.chatbubble_outline),
                        const SizedBox(width: 12),
                        _buildIconCircle(Ionicons.star_outline),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // List of menus for me page
              Expanded(
                child: ListView(
                  padding: const EdgeInsets.only(left: 16),
                  children: [
                    ListTile(
                      leading: const Icon(Icons.monetization_on_outlined,
                          color: Color(0xFF3D376C)),
                      title: Text(
                        'Earned Points',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading: const Icon(Icons.bookmark_outline,
                          color: Color(0xFF3D376C)),
                      title: Text(
                        'Saved Tutors',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const SavedTutors()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.settings_outlined,
                          color: Color(0xFF3D376C)),
                      title: Text(
                        'Settings',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const Settings()),
                        );
                      },
                    ),
                    ListTile(
                      leading: const Icon(Icons.info_outline,
                          color: Color(0xFF3D376C)),
                      title: Text(
                        'Terms and Conditions',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                      onTap: () {},
                    ),
                    ListTile(
                      leading:
                          const Icon(Icons.logout, color: Color(0xFF3D376C)),
                      title: Text(
                        'Log out',
                        style: GoogleFonts.poppins(fontWeight: FontWeight.w500),
                      ),
                      onTap: () {},
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildIconCircle(IconData icon) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.white,
          width: 2,
        ),
      ),
      child: Icon(icon, color: Colors.white),
    );
  }
}
