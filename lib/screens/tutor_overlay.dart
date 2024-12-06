import 'package:cc206_tutor_app/screens/date_selection.dart';
import 'package:flutter/material.dart';

class TutorProfileCardOverlay extends StatelessWidget {
  const TutorProfileCardOverlay({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: SizedBox(
            width: double.infinity,
            child: SingleChildScrollView(
                child: Material(
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                shadowColor: Colors.transparent,
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: IconButton(
                          icon: const Icon(Icons.close),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Lebron James",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "Full-Time Proffesor",
                                  style: TextStyle(fontSize: 14),
                                ),
                                Text(
                                  "Iloilo Science and Technology University",
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                "4.9",
                                style:
                                    TextStyle(fontSize: 16, color: Colors.blue),
                              ),
                              Icon(Icons.star, color: Colors.amber, size: 16),
                              Text("(230)", style: TextStyle(fontSize: 12)),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 8,
                        runSpacing: 4,
                        children: [
                          _buildSubjectChip("Science"),
                          _buildSubjectChip("English"),
                          _buildSubjectChip("Math"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildStatCard("79", "Libs"),
                          _buildStatCard("100", "Hours of\nTutoring"),
                          _buildStatCard("1.5", "GPA"),
                        ],
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        "Schedule",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      const Text("Weekdays - Afternoon"),
                      const Text("Weekends - Morning, Afternoon"),
                      const SizedBox(height: 10),
                      const Text(
                        "Bio",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 5),
                      const Text(
                        "I'm a passionate and dedicated tutor with a background in math and science, helping students from middle school to college achieve their academic goals. With 2 years of tutoring experience, I strive to make complex subjects understandable and enjoyable.",
                        style: TextStyle(fontSize: 14),
                      ),
                      const SizedBox(height: 20),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const DateSelection(),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 15, horizontal: 30),
                                textStyle: const TextStyle(fontSize: 16),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Colors.blue),
                            child: const Text(
                              "BOOK A SCHEDULE",
                              style: TextStyle(color: Colors.white),
                            ),
                          )),
                    ],
                  ),
                ),
              ),
            ))));
  }

  static Widget _buildSubjectChip(String subject) => Chip(label: Text(subject));

  static Widget _buildStatCard(String value, String label) => SizedBox(
        width: 80,
        child: Column(
          children: [
            Text(
              value,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(label, style: const TextStyle(fontSize: 12)),
          ],
        ),
      );
}

class TutorDetails extends StatelessWidget {
  const TutorDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tutor Details")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => showDialog(
                  context: context,
                  builder: (context) => const TutorProfileCardOverlay()),
              child: const Text('Show Tutor Profile'),
            ),
          ],
        ),
      ),
    );
  }
}
