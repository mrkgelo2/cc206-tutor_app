// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cc206_tutor_app/bottom_navbar.dart';

class SavedTutors extends StatefulWidget {
  const SavedTutors({super.key});

  @override
  State<SavedTutors> createState() => _SavedTutorsState();
}

class _SavedTutorsState extends State<SavedTutors> {
  late Future<List<Map<String, dynamic>>> _futureTutors;

  @override
  void initState() {
    super.initState();
    _futureTutors = loadJson('assets/json/tutors_list.json');
  }

  Future<List<Map<String, dynamic>>> loadJson(String filePath) async {
    try {
      String data = await rootBundle.loadString(filePath);
      List<dynamic> jsonList = json.decode(data);

      return jsonList
          .map((tutorData) {
            try {
              String name = tutorData['name'] ?? 'Unknown';
              String university = tutorData['university'] ?? 'Unknown';
              String description2 = tutorData['description2'] ?? 'Unknown';
              String rating = tutorData['rating']?.toString() ?? '0';
              String image =
                  tutorData['image'] ?? 'assets/images/default_tutor.png';

              return {
                'name': name,
                'university': university,
                'description2': description2,
                'rating': rating,
                'image': image,
              } as Map<String, dynamic>;
            } catch (e) {
              print("Error processing tutor data: $e");
              return <String, dynamic>{};
            }
          })
          .toList()
          .cast<Map<String, dynamic>>();
    } catch (e) {
      print("Error loading JSON: $e");
      return []; // Return an empty list in case of error
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Saved Tutors",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          centerTitle: true,
        ),
        bottomNavigationBar: const Navigation(currentIndex: 4),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: FutureBuilder<List<Map<String, dynamic>>>(
              future: _futureTutors,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else {
                  final tutors = snapshot.data!;
                  return ListView.builder(
                    itemCount: tutors.length,
                    itemBuilder: (context, index) {
                      final tutorData = tutors[index];
                      return Column(
                        children: [
                          _availableTutorsWidget(
                              tutorData["name"],
                              tutorData["university"],
                              tutorData["description2"],
                              tutorData["rating"],
                              tutorData["image"]),
                          const SizedBox(height: 10),
                        ],
                      );
                    },
                  );
                }
              },
            )),
      ),
    );
  }

  Widget _availableTutorsWidget(String? name, String? university,
      String? description2, String? rating, String? image) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Container(
            width: 80,
            height: 80,
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: AssetImage(image ?? 'assets/images/default_tutor.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(name ?? 'Unknown',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold)),
                Text(university ?? 'Unknown',
                    style: const TextStyle(fontSize: 14)),
                Text(description2 ?? 'Unknown',
                    style: const TextStyle(fontSize: 14)),
                Row(
                  children: List.generate(
                      int.tryParse(rating ?? '0') ?? 0,
                      (index) => const Icon(Icons.star,
                          size: 20, color: Color.fromARGB(255, 255, 234, 0))),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                const Icon(Icons.bookmark, color: Colors.blue),
                const SizedBox(height: 10),
                SizedBox(
                  width: 80,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                    ),
                    child: const Text("Book Now"),
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
