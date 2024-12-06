import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo, tagline
            Image.asset(
              'assets/logowname.png',
              height: 250,
            ),
            const Text(
              'Seeking knowledge in a friendly and easy way',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 150),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Sign in Button
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/sign_in'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF148fc5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    'Sign In',
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),

                // Sign up Button
                ElevatedButton(
                  onPressed: () => Navigator.pushNamed(context, '/sign_up'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF148fc5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 50, vertical: 15),
                  ),
                  child: Text(
                    'Sign Up',
                    style: GoogleFonts.poppins(fontSize: 16, color: Colors.white),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
