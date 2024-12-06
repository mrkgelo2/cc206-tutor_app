import 'dart:convert';
import 'package:cc206_tutor_app/screens/tutor_overlay.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cc206_tutor_app/bottom_navbar.dart';
import 'package:cc206_tutor_app/screens/available_tutors.dart';
import 'package:cc206_tutor_app/screens/featured_tutors.dart';
import 'package:cc206_tutor_app/screens/notifications.dart';
import 'package:cc206_tutor_app/screens/subjects.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cc206_tutor_app/screens/search_settings_overlay.dart';
import 'package:ionicons/ionicons.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  DashboardState createState() => DashboardState();
}

class DashboardState extends State<Dashboard> {
  var tutors = <String, Map<String, dynamic>>{};
  Map<String, dynamic>? featuredTutor;
  final int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    loadJson('assets/json/tutors_list.json');
  }

  Future<void> loadJson(String filePath) async {
    try {
      String data = await rootBundle.loadString(filePath);
      var jsonList = json.decode(data);

      setState(() {
        tutors = Map.fromIterable(
          jsonList.asMap().entries,
          key: (entry) => (entry.key + 1).toString(),
          value: (entry) {
            try {
              Map<String, dynamic> tutorData =
                  entry.value as Map<String, dynamic>;
              return {
                'name': tutorData['name'] ?? 'Unknown',
                'university': tutorData['university'] ?? 'Unknown',
                'description2': tutorData['description2'] ?? 'Unknown',
                'rating': tutorData['rating']?.toString() ?? '0',
                'image':
                    tutorData['image'] ?? 'assets/images/default_tutor.png',
              };
            } catch (e) {
              print("Error processing tutor data: $e");
              return {};
            }
          },
        );

        featuredTutor = tutors['1'];
      });
    } catch (e) {
      print("Error loading JSON: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    Map<int, Map<String, String>> subjects = {
      1: {
        "name": "Biology",
        "image": "assets/images/history.png",
      },
      2: {
        "name": "Math",
        "image": "assets/images/math.png",
      },
      3: {
        "name": "English",
        "image": "assets/images/english.png",
      },
      4: {
        "name": "History",
        "image": "assets/images/history.png",
      },
      5: {
        "name": "Recess",
        "image": "assets/images/history.png",
      },
    };

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Padding(
            padding: const EdgeInsets.only(left: 10, top: 30),
            child: Text(
              "Hi, Kenneth",
              style: GoogleFonts.poppins(
                color: const Color(0xFF21284C),
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 20, right: 20),
              child: IconButton(
                icon: const Icon(
                  Ionicons.notifications,
                  size: 30,
                  color: Color(0xFF2196f3),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const Notifications(),
                    ),
                  );
                },
              ),
            ),
          ],
          elevation: 0,
          automaticallyImplyLeading: false,
          centerTitle: false,
        ),
        bottomNavigationBar: const Navigation(currentIndex: 0),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Container(
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
                              Ionicons.search_outline,
                              color: Color(0xFFAEB4B9),
                            ),
                            border: InputBorder.none,
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 15, horizontal: 15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      decoration: BoxDecoration(
                        color: const Color(0xff2196f3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: IconButton(
                        icon: const Icon(
                          Ionicons.settings_outline,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (BuildContext context) =>
                                const SearchSettingsOverlay(),
                          ).then((value) {
                            if (value != null) {
                              // Handle the filter values here
                              print('Price Range: ${value['priceRange']}');
                              print('Availability: ${value['availability']}');
                              print('Experience: ${value['experience']}');
                              print('Rating: ${value['rating']}');
                            }
                          });
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                if (featuredTutor != null) ...[
                  Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(199, 33, 149, 243),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Best Tutor of the Month!",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                "${featuredTutor!['name']}",
                                style: GoogleFonts.poppins(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "is an English tutor with 2 years experiences.",
                                style: GoogleFonts.poppins(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 8),
                            ],
                          ),
                        ),
                        CircleAvatar(
                          radius: 45,
                          backgroundImage: AssetImage(featuredTutor!['image']),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Featured Tutors",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const FeaturedTutors()),
                            );
                          },
                          child: Text(
                            "View All",
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFAEB4B9),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 120,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: tutors.length,
                        itemBuilder: (context, index) {
                          final tutorData =
                              tutors.entries.elementAt(index).value;
                          return _tutorWidget(
                              index < tutors.length - 1,
                              tutorData["name"],
                              tutorData["university"],
                              tutorData["description2"],
                              tutorData["rating"],
                              tutorData["image"]);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Subjects",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Subjects(
                                  currentIndex: currentIndex,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            "View All",
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFAEB4B9),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: subjects.length,
                        itemBuilder: (context, index) {
                          final subjectData =
                              subjects.entries.elementAt(index).value;
                          return _subjectWidget(index < subjects.length - 1,
                              subjectData["name"], subjectData["image"]);
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Available Tutors",
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AvailableTutors()),
                            );
                          },
                          child: Text(
                            "View All",
                            style: GoogleFonts.poppins(
                              color: const Color(0xFFAEB4B9),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        )
                      ],
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                        itemCount: tutors.length,
                        itemBuilder: (context, index) {
                          final tutorData =
                              tutors.entries.elementAt(index).value;
                          return Column(
                            children: [
                              _availableTutorsWidget(
                                tutorData["name"],
                                tutorData["university"],
                                tutorData["description2"],
                                tutorData["rating"],
                                tutorData["image"],
                              ),
                              const SizedBox(height: 10),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _tutorWidget(bool hasMargin, String? name, String? university,
      String? description2, String? rating, String? image) {
    return Container(
      width: 275,
      margin: EdgeInsets.only(right: hasMargin ? 20 : 0),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(
              image ?? 'assets/images/default_image.jpg',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? 'Unknown',
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                Text(
                  university ?? 'Unknown',
                  style: const TextStyle(fontSize: 12),
                ),
                Text(
                  description2 ?? 'Unknown',
                  style: const TextStyle(fontSize: 12),
                ),
                Row(
                  children: List.generate(
                    int.tryParse(rating ?? '0') ?? 0,
                    (index) => const Icon(
                      Ionicons.star,
                      size: 15,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _availableTutorsWidget(String? name, String? university,
      String? description2, String? rating, String? image) {
    return Container(
      width: double.infinity,
      height: 140,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 45,
            backgroundImage: AssetImage(
              image ?? 'assets/images/default_image.jpg',
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name ?? 'Unknown',
                  style: GoogleFonts.poppins(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(university ?? 'Unknown'),
                Text(description2 ?? 'Unknown'),
                Row(
                  children: List.generate(
                    int.tryParse(rating ?? '0') ?? 0,
                    (index) => const Icon(
                      Ionicons.star,
                      size: 20,
                      color: Colors.yellow,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              const Icon(Ionicons.bookmark_outline),
              const Spacer(),
              TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const TutorProfileCardOverlay(),
                    ),
                  );
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all<Color>(Colors.blue),
                  foregroundColor: WidgetStateProperty.all<Color>(Colors.white),
                ),
                child: const Text("Book Now"),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _subjectWidget(bool hasMargin, String? subject, String? image) {
    // Map of subjects to their respective colors
    final Map<String, Color> subjectColors = {
      'Biology': const Color(0xFFE8F5E9),
      'Math': const Color(0xFFE3F2FD),
      'English': const Color(0xFFFCE4EC),
      'History': const Color(0xFFFFF3E0),
      'Recess': const Color(0xFFF3E5F5),
    };

    return Column(
      children: [
        Container(
          width: 75,
          height: 75,
          margin: EdgeInsets.only(right: hasMargin ? 20 : 0),
          decoration: BoxDecoration(
            color: subjectColors[subject] ?? Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: const Color(0xFFE0E0E0),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.1),
                spreadRadius: 1,
                blurRadius: 4,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image(
                  image: AssetImage(image ?? 'assets/images/default_image.jpg'),
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: 75,
          padding: const EdgeInsets.only(left: 8),
          child: Text(
            subject ?? 'Unknown',
            style: GoogleFonts.poppins(
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }
}
