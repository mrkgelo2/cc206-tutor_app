import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cc206_tutor_app/bottom_navbar.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  List<Map<String, dynamic>> notifications = [
    {
      'title': 'Math Class',
      'message': 'Did you finish your homework?',
      'time': '09:20AM',
      'date': 'Today',
      'showButton': true,
      'visible': true,
    },
    {
      'title': 'Science Class',
      'message': 'How was the experiment?',
      'time': '08:46AM',
      'date': 'Today',
      'showButton': true,
      'visible': true,
    },
    {
      'title': 'English Class',
      'message': 'Read the next chapter',
      'time': '09:20AM',
      'date': 'Yesterday',
      'showButton': false,
      'visible': true,
    },
    {
      'title': 'History Class',
      'message': 'Study for the quiz',
      'time': '09:20AM',
      'date': 'This Weekend',
      'showButton': false,
      'visible': true,
    },
    {
      'title': 'Language Class',
      'message': 'Practice your pronunciation',
      'time': '09:20AM',
      'date': 'This Weekend',
      'showButton': false,
      'visible': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Notifications",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.more_horiz),
            onPressed: () {},
          ),
        ],
        toolbarHeight: kToolbarHeight,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          for (String date in ['Today', 'Yesterday', 'This Weekend'])
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  date,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.bold, fontSize: 16),
                ),
                const SizedBox(height: 8),
                ...notifications.where((n) => n['date'] == date).map((n) {
                  if (!n['visible']) return const SizedBox.shrink();
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.1),
                            spreadRadius: 1,
                            blurRadius: 4,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: ListTile(
                        contentPadding: const EdgeInsets.all(16),
                        leading: CircleAvatar(
                          backgroundColor: Colors.blue.withOpacity(0.1),
                          child: const Icon(Icons.person, color: Colors.blue),
                        ),
                        title: Text(
                          n['title'],
                          style:
                              GoogleFonts.poppins(fontWeight: FontWeight.bold),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(n['message'], style: GoogleFonts.poppins()),
                            const SizedBox(height: 8),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  n['time'],
                                  style: GoogleFonts.poppins(
                                    color: Colors.grey[600],
                                    fontSize: 12,
                                  ),
                                ),
                                if (n['showButton'])
                                  ElevatedButton(
                                    onPressed: () {
                                      setState(() {
                                        n['visible'] = false;
                                      });
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: Colors.blue,
                                      foregroundColor: Colors.white,
                                      padding: const EdgeInsets.symmetric(
                                        horizontal: 24,
                                        vertical: 8,
                                      ),
                                    ),
                                    child: const Text('Yes'),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ],
            ),
        ],
      ),
      bottomNavigationBar: const Navigation(currentIndex: 0),
    );
  }
}
