import 'package:flutter/material.dart';

class OpeningScreen extends StatelessWidget {
  const OpeningScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Logo Section
            Image.asset(
              'assets/logowname.png',
              height: 250,
            ),

            // Tagline
            const Text(
              'Seeking knowledge in a friendly and easy way',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey,
              ),
            ),

            const SizedBox(height: 150),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Sign In Button
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
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 16, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 20),

                // Sign Up Button
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
                  child: const Text(
                    'Sign up',
                    style: TextStyle(fontSize: 16, color: Colors.white),
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
