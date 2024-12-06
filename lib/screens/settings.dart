import 'package:flutter/material.dart';
import 'package:cc206_tutor_app/bottom_navbar.dart';
import 'package:google_fonts/google_fonts.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  SettingsState createState() => SettingsState();
}

class SettingsState extends State<Settings> {
  bool _generalNotif = true;
  bool _sound = false;
  bool _vibration = true;
  bool _appUpdates = false;
  bool _billReminder = true;
  bool _loyaltyAwards = true;
  bool _discountAvailability = false;
  bool _paymentRequest = false;
  bool _serviceAvailabilityUpdate = false;
  bool _tipsAvailabilityUpdate = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text(
          "Settings",
          style: GoogleFonts.poppins(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("General",
                      style: GoogleFonts.poppins(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      )),
                  const SizedBox(height: 10),
                  _settingsItem("General Notifications", _generalNotif,
                      (value) {
                    setState(() {
                      _generalNotif = value;
                    });
                  }),
                  const SizedBox(height: 5),
                  _settingsItem("Sound", _sound, (value) {
                    setState(() {
                      _sound = value;
                    });
                  }),
                  const SizedBox(height: 5),
                  _settingsItem("Vibration", _vibration, (value) {
                    setState(() {
                      _vibration = value;
                    });
                  }),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("System & Service Update",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 10),
                  _settingsItem("App Updates", _appUpdates, (value) {
                    setState(() {
                      _appUpdates = value;
                    });
                  }),
                  const SizedBox(height: 5),
                  _settingsItem("Bill Reminder", _billReminder, (value) {
                    setState(() {
                      _billReminder = value;
                    });
                  }),
                  const SizedBox(height: 5),
                  _settingsItem("Loyalty Awards", _loyaltyAwards, (value) {
                    setState(() {
                      _loyaltyAwards = value;
                    });
                  }),
                  const SizedBox(height: 5),
                  _settingsItem("Discount Availability", _discountAvailability,
                      (value) {
                    setState(() {
                      _discountAvailability = value;
                    });
                  }),
                  const SizedBox(height: 5),
                  _settingsItem("Payment Request", _paymentRequest, (value) {
                    setState(() {
                      _paymentRequest = value;
                    });
                  }),
                ],
              ),
              const SizedBox(height: 20),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Others",
                      style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold, fontSize: 20)),
                  const SizedBox(height: 10),
                  _settingsItem(
                      "Service Availability Update", _serviceAvailabilityUpdate,
                      (value) {
                    setState(() {
                      _serviceAvailabilityUpdate = value;
                    });
                  }),
                  const SizedBox(height: 5),
                  _settingsItem(
                      "Tips Availability Update", _tipsAvailabilityUpdate,
                      (value) {
                    setState(() {
                      _tipsAvailabilityUpdate = value;
                    });
                  }),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const Navigation(currentIndex: 4),
    );
  }

  Row _settingsItem(String title, bool value, ValueChanged<bool> onChanged) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.poppins(
            fontSize: 16,
          ),
        ),
        Switch(
          value: value,
          activeColor: const Color(0xff108fc4),
          inactiveThumbColor: Colors.grey,
          inactiveTrackColor: Colors.grey[300],
          onChanged: onChanged,
        ),
      ],
    );
  }
}
