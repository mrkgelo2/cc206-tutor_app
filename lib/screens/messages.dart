import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cc206_tutor_app/bottom_navbar.dart';

class Messages extends StatelessWidget {
  const Messages({super.key});

  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> tutorMessages = {
      "John Doe": {
        "message": "Hello, how are you?",
        "image": "assets/images/man2.jpg"
      },
      "Jane Doe": {
        "message": "Please check the assignment",
        "image": "assets/images/jane.jpg"
      },
      "Lebron James": {
        "message": "I will be late for the class",
        "image": "assets/images/lebron.jpg"
      },
      "Demarcus Siblings": {
        "message": "I am ready for the class",
        "image": "assets/images/man3.jpg"
      }
    };

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff108fc4),
          title: Text(
            "Messages",
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true,
          elevation: 0,
        ),
        bottomNavigationBar: const Navigation(currentIndex: 3),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xffF7F9FE),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  style: GoogleFonts.poppins(),
                  decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: GoogleFonts.poppins(
                      fontSize: 14,
                      fontWeight: FontWeight.normal,
                      color: const Color(0xFFAEB4B9),
                    ),
                    prefixIcon: const Icon(
                      Icons.search,
                      color: Color(0xFFAEB4B9),
                    ),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                        vertical: 20, horizontal: 15),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Active",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              // Row of active user images
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(width: 10), // Initial padding
                    for (var image in [
                      'assets/images/jane.jpg',
                      'assets/images/man.jpg',
                      'assets/images/man2.jpg',
                      'assets/images/man3.jpg',
                      'assets/images/lebron.jpg',
                    ])
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12), // Increased gap
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.white,
                          backgroundImage: AssetImage(image),
                          child: Container(
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: const Color(0xFF005983),
                                width: 2,
                              ),
                            ),
                          ),
                        ),
                      ),
                    const SizedBox(width: 10), // Final padding
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "Messages",
                style: GoogleFonts.poppins(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView(
                  children: [
                    for (var entry in tutorMessages.entries)
                      _messageItem(entry.key, entry.value['message'],
                          entry.value['image']),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding _messageItem(String name, String message, String image) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 1),
      child: Container(
        height: 100,
        padding: const EdgeInsets.only(left: 5, right: 5, top: 0, bottom: 0),
        decoration: BoxDecoration(
            color: const Color.fromARGB(0, 255, 255, 255),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
          children: [
            Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: const Color(0xFF005983),
                    width: 2, // Border width
                  ),
                  image: DecorationImage(image: AssetImage(image))),
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "Active",
                        style: GoogleFonts.poppins(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromARGB(255, 3, 247, 72),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Text(
                    message,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
