import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const PortfolioApp());
}

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Aman Yadav • Sr. Mobile App Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blueGrey),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatelessWidget {
  const PortfolioHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: ConstrainedBox(
          constraints:
              BoxConstraints(minHeight: MediaQuery.of(context).size.height),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HeroSection(),
              SizedBox(height: 40),
              AboutSection(),
              SizedBox(height: 40),
              ExperienceSection(),
              SizedBox(height: 40),
              ProjectsSection(),
              SizedBox(height: 40),
              SkillsSection(),
              SizedBox(height: 40),
              ContactSection(),
              SizedBox(height: 80),
              Footer(),
            ],
          ),
        ),
      ),
    );
  }
}

class HeroSection extends StatelessWidget {
  const HeroSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Aman Yadav',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 8),
              Text('Sr. Mobile App Developer (Team Leader)',
                  style: Theme.of(context)
                      .textTheme
                      .titleMedium
                      ?.copyWith(color: Colors.grey[700])),
              const SizedBox(height: 16),
              Text(
                  'Hello! I am a Sr. Mobile App Developer with 5+ years of experience in Flutter, Android (Java), React Native, and Git. I specialize in building scalable mobile apps, integrating REST APIs, and leading development teams.',
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}

class AboutSection extends StatelessWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('About Me',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Text(
                  'Experienced in building production apps for Android and iOS using Flutter and native technologies. Skilled in UI/UX, backend integration, performance optimization, and team leadership.',
                  style: Theme.of(context).textTheme.bodyLarge),
            ],
          ),
        ),
      ),
    );
  }
}

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Work Experience',
              style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: experiences.length,
              itemBuilder: (context, index) {
                final e = experiences[index];
                return Container(
                  width: 300,
                  margin: const EdgeInsets.only(right: 12),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(e['role'] ?? '',
                              style: Theme.of(context).textTheme.titleMedium),
                          Text(
                              '${e['company']} | ${e['location']} | ${e['duration']}',
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 12)),
                          const SizedBox(height: 4),
                          Text(e['description'] ?? '',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  static final List<Map<String, String>> projects = [
    {
      'title': 'Taxi Driver App (ITC Abu Dhabi UAE)',
      'duration': 'Aug 2023 – Nov 2023',
      'tech': 'Android, Java',
      'description':
          'Self-service app for hire car drivers with Socket API and tracking.'
    },
    {
      'title': 'POS iMenu360',
      'duration': 'Dec 2022 – Current',
      'tech': 'Flutter, Firebase, Thermal Printing',
      'description': 'Restaurant solution app.'
    },
    {
      'title': 'Unyte',
      'duration': 'Jan 2023 – Current',
      'tech': 'Flutter, Firebase',
      'description': 'Investment application.'
    },
    {
      'title': 'WhyBuy',
      'duration': 'Aug 2022 – Dec 2022',
      'tech': 'Android, Java, Firebase',
      'description': 'Ecommerce app with RazorPay integration.'
    },
    {
      'title': 'My Live Location',
      'duration': 'Jan 2022 – Aug 2022',
      'tech': 'Android, Firebase',
      'description': 'Location sharing, chat & video call.'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Projects', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          SizedBox(
            height: 150,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: projects.length,
              itemBuilder: (context, index) {
                final p = projects[index];
                return Container(
                  width: 300,
                  margin: const EdgeInsets.only(right: 12),
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(p['title'] ?? '',
                              style: Theme.of(context).textTheme.titleMedium),
                          Text('${p['duration']} | ${p['tech']}',
                              style: TextStyle(
                                  color: Colors.grey[700], fontSize: 12)),
                          const SizedBox(height: 4),
                          Text(p['description'] ?? '',
                              style: TextStyle(fontSize: 12)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class SkillsSection extends StatelessWidget {
  const SkillsSection({Key? key}) : super(key: key);

  static const skills = [
    'Flutter',
    'Android',
    'Java',
    'Git',
    'DSA',
    'MySQL',
    'React Native'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Skills', style: Theme.of(context).textTheme.headlineSmall),
          const SizedBox(height: 12),
          Wrap(
              spacing: 12,
              runSpacing: 8,
              children: skills.map((s) => Chip(label: Text(s))).toList())
        ],
      ),
    );
  }
}

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  final String email = 'abyadav113@gmail.com';
  final String phone = '+91(721)8144612';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Contact', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Text(
                  'I am available for freelance or full-time opportunities. Feel free to reach out via email or phone.',
                  style: Theme.of(context).textTheme.bodyLarge),
              const SizedBox(height: 16),
              Row(
                children: [
                  ElevatedButton.icon(
                    icon: const Icon(Icons.email),
                    label: const Text('Email'),
                    onPressed: () =>
                        launchUrl(Uri(scheme: 'mailto', path: email)),
                  ),
                  const SizedBox(width: 12),
                  ElevatedButton.icon(
                    icon: const Icon(Icons.phone),
                    label: const Text('Call'),
                    onPressed: () => launchUrl(Uri(scheme: 'tel', path: phone)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey[200],
      padding: const EdgeInsets.symmetric(vertical: 24),
      child: Center(
        child: Text('© 2025 Aman Yadav • All Rights Reserved.',
            style: TextStyle(color: Colors.grey[700])),
      ),
    );
  }
}
