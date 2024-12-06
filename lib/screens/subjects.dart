import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:cc206_tutor_app/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Subjects extends StatefulWidget {
  const Subjects({super.key, required this.currentIndex});
  final int currentIndex;

  @override
  State<Subjects> createState() => _SubjectsState();
}

class _SubjectsState extends State<Subjects> {
  List<dynamic> subjects = [];
  int indexNav = 0;

  @override
  void initState() {
    super.initState();
    indexNav = widget.currentIndex;
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
        title: Text(
          "Subjects",
          style: GoogleFonts.poppins(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      bottomNavigationBar: Navigation(currentIndex: indexNav),
      body: Expanded(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2),
          itemCount: subjects.length,
          itemBuilder: (context, index) {
            return Card(
              color: Colors.blue[50],
              child: ListTile(
                title: Text(
                  subjects[index]['name'],
                  style: GoogleFonts.poppins(
                      fontSize: 14, fontWeight: FontWeight.bold),
                ),
                subtitle: Text(
                  subjects[index]['description'],
                  style: GoogleFonts.poppins(),
                ),
                trailing: const Icon(Icons.arrow_forward),
              ),
            );
          },
        ),
      ),
    ));
  }
}
