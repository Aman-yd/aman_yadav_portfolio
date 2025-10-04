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
      title: 'Your Name • Flutter Developer',
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
          constraints: BoxConstraints(
            minHeight: MediaQuery.of(context).size.height,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              HeroSection(),
              SizedBox(height: 40),
              AboutSection(),
              SizedBox(height: 40),
              ProjectsSection(),
              SizedBox(height: 40),
              TestimonialsSection(),
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
    final width = MediaQuery.of(context).size.width;
    final isNarrow = width < 800;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 48, horizontal: 24),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.06),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: isNarrow
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: const [
                    HeroText(),
                    SizedBox(height: 24),
                    HeroActions()
                  ],
                )
              : Row(
                  children: const [
                    Expanded(child: HeroText()),
                    SizedBox(width: 24),
                    HeroActions()
                  ],
                ),
        ),
      ),
    );
  }
}

class HeroText extends StatelessWidget {
  const HeroText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Your Name',
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontWeight: FontWeight.bold)),
        const SizedBox(height: 8),
        Text('Flutter & Android Developer',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: Colors.grey[700])),
        const SizedBox(height: 16),
        Text(
          'I build high-quality cross-platform mobile apps. I take features end-to-end—from UI/UX to backend integration—focusing on clean, scalable code and excellent user experience.',
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ],
    );
  }
}

class HeroActions extends StatelessWidget {
  const HeroActions({Key? key}) : super(key: key);

  Future<void> _launchEmail() async {
    final uri = Uri(
      scheme: 'mailto',
      path: 'youremail@example.com',
      queryParameters: {'subject': 'Project inquiry'},
    );
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ElevatedButton(
          onPressed: _launchEmail,
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            child: Text('Hire Me'),
          ),
        ),
        const SizedBox(height: 12),
        OutlinedButton(
          onPressed: () {
            // link to GitHub or resume
            launchUrl(Uri.parse('https://github.com/yourusername'));
          },
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 12.0, horizontal: 20.0),
            child: Text('View Code / Resume'),
          ),
        ),
      ],
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
                'I am an experienced Flutter and Android developer with a strong background in building production apps. I specialize in designing responsive UI, integrating RESTful APIs and Firebase services, and improving app performance and architecture. I enjoy solving challenging problems and delivering apps that users love.',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              const SizedBox(height: 18),
              Wrap(spacing: 12, runSpacing: 8, children: const [
                SkillChip('Flutter'),
                SkillChip('Dart'),
                SkillChip('Kotlin'),
                SkillChip('Firebase'),
                SkillChip('REST APIs'),
                SkillChip('Stripe / Payments'),
                SkillChip('State Management'),
                SkillChip('CI / CD'),
              ])
            ],
          ),
        ),
      ),
    );
  }
}

class SkillChip extends StatelessWidget {
  final String label;
  const SkillChip(this.label, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(label: Text(label));
  }
}

class ProjectsSection extends StatelessWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  static final List<Map<String, String>> projects = [
    {
      'title': 'Project One',
      'description':
          'An e-commerce app with Flutter, Firebase, and Stripe integration.',
      'link': 'https://play.google.com/store/apps/details?id=example1'
    },
    {
      'title': 'Project Two',
      'description':
          'A booking app with real-time updates and offline support.',
      'link': 'https://github.com/yourusername/project-two'
    },
    {
      'title': 'Project Three',
      'description':
          'A POS integration app for hardware peripherals using Bluetooth.',
      'link': 'https://github.com/yourusername/project-three'
    },
  ];

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
              Text('Selected Work',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Wrap(
                  spacing: 16,
                  runSpacing: 16,
                  children: projects.map((p) => ProjectCard(p)).toList())
            ],
          ),
        ),
      ),
    );
  }
}

class ProjectCard extends StatelessWidget {
  final Map<String, String> project;
  const ProjectCard(this.project, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 340,
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(project['title'] ?? '',
                  style: Theme.of(context).textTheme.titleMedium),
              const SizedBox(height: 8),
              Text(project['description'] ?? ''),
              const SizedBox(height: 12),
              TextButton(
                onPressed: () => launchUrl(Uri.parse(project['link'] ?? '')),
                child: const Text('View'),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TestimonialsSection extends StatelessWidget {
  const TestimonialsSection({Key? key}) : super(key: key);

  static final List<Map<String, String>> testimonials = [
    {
      'text': 'Great developer — delivered on time and with excellent quality.',
      'name': 'Client A',
      'role': 'Product Manager'
    },
    {
      'text':
          'Very professional and communicates clearly. Strong attention to detail.',
      'name': 'Client B',
      'role': 'CTO'
    }
  ];

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
              Text('Testimonials',
                  style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Column(
                  children:
                      testimonials.map((t) => TestimonialCard(t)).toList())
            ],
          ),
        ),
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final Map<String, String> t;
  const TestimonialCard(this.t, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('"${t['text']}"'),
            const SizedBox(height: 8),
            Text('- ${t['name']}, ${t['role']}',
                style: TextStyle(color: Colors.grey[700])),
          ],
        ),
      ),
    );
  }
}

class ContactSection extends StatefulWidget {
  const ContactSection({Key? key}) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final _formKey = GlobalKey<FormState>();
  final _name = TextEditingController();
  final _email = TextEditingController();
  final _message = TextEditingController();

  Future<void> _sendMail() async {
    final subject = Uri.encodeComponent('Portfolio inquiry from ${_name.text}');
    final body = Uri.encodeComponent(
        'Name: ${_name.text}\nEmail: ${_email.text}\n\n${_message.text}');
    final uri =
        Uri.parse('mailto:youremail@example.com?subject=$subject&body=$body');
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 700),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Contact', style: Theme.of(context).textTheme.headlineSmall),
              const SizedBox(height: 12),
              Form(
                key: _formKey,
                child: Column(children: [
                  TextFormField(
                      controller: _name,
                      decoration: const InputDecoration(labelText: 'Name'),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Enter name' : null),
                  const SizedBox(height: 8),
                  TextFormField(
                      controller: _email,
                      decoration: const InputDecoration(labelText: 'Email'),
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Enter email' : null),
                  const SizedBox(height: 8),
                  TextFormField(
                      controller: _message,
                      decoration: const InputDecoration(labelText: 'Message'),
                      maxLines: 5,
                      validator: (v) =>
                          v == null || v.isEmpty ? 'Enter message' : null),
                  const SizedBox(height: 12),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState?.validate() ?? false) {
                          _sendMail();
                        }
                      },
                      child: const Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 12.0, horizontal: 20.0),
                          child: Text('Send')),
                    )
                  ])
                ]),
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
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 24),
      color: Theme.of(context).colorScheme.primary.withOpacity(0.04),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('© ${DateTime.now().year} Your Name'),
              Row(children: [
                IconButton(
                    onPressed: () =>
                        launchUrl(Uri.parse('https://github.com/yourusername')),
                    icon: const Icon(Icons.code)),
                IconButton(
                    onPressed: () => launchUrl(
                        Uri.parse('https://www.linkedin.com/in/yourusername')),
                    icon: const Icon(Icons.link)),
              ])
            ],
          ),
        ),
      ),
    );
  }
}
