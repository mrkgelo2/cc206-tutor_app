import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:cc206_tutor_app/bottom_navbar.dart';
import 'package:cc206_tutor_app/screens/subjects.dart';
import 'package:cc206_tutor_app/screens/search_settings_overlay.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ionicons/ionicons.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  SearchState createState() => SearchState();
}

class SearchState extends State<Search> {
  final int currentIndex = 1;
  List<dynamic> subjects = [];

  @override
  void initState() {
    super.initState();
    loadJson('assets/json/subjects_list.json');
  }

  Future<void> loadJson(String filePath) async {
    final String data = await rootBundle.loadString(filePath);
    final List<dynamic> jsonResult = json.decode(data);
    setState(() {
      subjects = jsonResult;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xff108fc4),
          elevation: 0,
          centerTitle: true,
          title: Text(
            'Search',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        bottomNavigationBar: const Navigation(currentIndex: 1),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
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
                          hintStyle: GoogleFonts.openSans(
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
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Subjects",
                        style: GoogleFonts.poppins(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                    TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Subjects(
                                      currentIndex: currentIndex,
                                    )),
                          );
                        },
                        child: Text(
                          "View All",
                          style: GoogleFonts.poppins(
                            color: const Color(0xFFAEB4B9),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ))
                  ],
                ),
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return Card(
                      color: Colors.blue[50],
                      child: ListTile(
                        title: Text(
                          subjects[index]['name'],
                          style: GoogleFonts.poppins(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        subtitle: Text(
                          subjects[index]['description'],
                          style: GoogleFonts.poppins(),
                        ),
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
