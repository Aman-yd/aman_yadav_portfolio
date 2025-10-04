import 'package:flutter/material.dart';

class ExperienceSection extends StatelessWidget {
  const ExperienceSection({Key? key}) : super(key: key);

  static final List<Map<String, String>> experiences = [
    {
      'role': 'Sr. Mobile Application Developer (Team Leader)',
      'company': 'Point Matrix IT Services',
      'location': 'Nashik, MH',
      'duration': 'Jan 2022 – Current',
      'description':
          'Writing clean and efficient codes for Android and Hybrid Technology, managing production mobile apps with REST API integrations.'
    },
    {
      'role': 'Sr. Android Developer',
      'company': 'Limbic Technology',
      'location': 'Bhopal, MP',
      'duration': 'May 2020 – Jan 2022',
      'description':
          'Developed Android apps, monitored performance, optimized code, fixed bugs, and managed production mobile apps.'
    },
    {
      'role': 'Android Developer Intern',
      'company': 'ADSPL Tech',
      'location': 'Gwalior, MP',
      'duration': 'Nov 2019 – May 2020',
      'description':
          'Worked on native applications interacting with IoT devices.'
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Work Experience',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold)),
            const SizedBox(height: 16),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: experiences.length,
                itemBuilder: (context, index) {
                  final e = experiences[index];
                  return TweenAnimationBuilder<double>(
                    tween: Tween(begin: 0, end: 1),
                    duration: Duration(milliseconds: 500 + (index * 200)),
                    builder: (context, value, child) {
                      return Opacity(
                        opacity: value,
                        child: Transform.translate(
                          offset: Offset(0, 50 * (1 - value)),
                          child: child,
                        ),
                      );
                    },
                    child: Container(
                      width: 420,
                      margin: const EdgeInsets.only(right: 16),
                      child: Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16)),
                        elevation: 5,
                        shadowColor: Colors.blueGrey.withOpacity(0.3),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(e['role'] ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blueGrey[800])),
                              const SizedBox(height: 6),
                              Text(
                                  '${e['company']} | ${e['location']} | ${e['duration']}',
                                  style: TextStyle(
                                      color: Colors.grey[700], fontSize: 12)),
                              const SizedBox(height: 12),
                              Text(e['description'] ?? '',
                                  style: TextStyle(
                                      fontSize: 13, color: Colors.grey[800])),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
