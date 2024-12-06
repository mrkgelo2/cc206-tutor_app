import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchSettingsOverlay extends StatefulWidget {
  const SearchSettingsOverlay({super.key});

  @override
  SearchSettingsOverlayState createState() => SearchSettingsOverlayState();
}

class SearchSettingsOverlayState extends State<SearchSettingsOverlay> {
  RangeValues _priceRange = const RangeValues(10, 50);
  String _selectedAvailability = 'Any Time';
  String _selectedExperience = 'Any Experience';
  String _selectedRating = 'Any Rating';

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Search Filters',
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text(
              'Price Range (per hour)',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            RangeSlider(
              values: _priceRange,
              min: 0,
              max: 100,
              divisions: 20,
              labels: RangeLabels(
                '\$${_priceRange.start.round()}',
                '\$${_priceRange.end.round()}',
              ),
              onChanged: (RangeValues values) {
                setState(() {
                  _priceRange = values;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Availability',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedAvailability,
              items: ['Any Time', 'Morning', 'Afternoon', 'Evening']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedAvailability = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Experience Level',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedExperience,
              items: [
                'Any Experience',
                'Beginner (1-2 years)',
                'Intermediate (3-5 years)',
                'Expert (5+ years)'
              ].map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedExperience = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            Text(
              'Rating',
              style: GoogleFonts.poppins(fontWeight: FontWeight.w600),
            ),
            DropdownButton<String>(
              isExpanded: true,
              value: _selectedRating,
              items: ['Any Rating', '4.5 & above', '4.0 & above', '3.5 & above']
                  .map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  _selectedRating = newValue!;
                });
              },
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Apply filters and close overlay
                  Navigator.pop(context, {
                    'priceRange': _priceRange,
                    'availability': _selectedAvailability,
                    'experience': _selectedExperience,
                    'rating': _selectedRating,
                  });
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xff2196f3),
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: Text(
                  'Apply Filters',
                  style: GoogleFonts.poppins(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
