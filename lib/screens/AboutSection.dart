import 'package:flutter/material.dart';

class AboutSection extends StatefulWidget {
  const AboutSection({Key? key}) : super(key: key);

  @override
  State<AboutSection> createState() => _AboutSectionState();
}

class _AboutSectionState extends State<AboutSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();
  }

  Widget _buildHighlight(IconData icon, String text, BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.blueGrey.shade100.withOpacity(0.5),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blueAccent, size: 26),
          const SizedBox(width: 10),
          Expanded(
            child: Text(
              text,
              style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w600,
                  ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 24),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blueGrey.shade50, Colors.blueGrey.shade100],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 1000),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title
                Text(
                  'About Me',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey[900],
                      ),
                ),
                const SizedBox(height: 20),

                // Intro text with gradient card
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(18),
                    gradient: LinearGradient(
                        colors: [Colors.blue.shade50, Colors.blue.shade100]),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blueGrey.shade100.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(4, 6),
                      ),
                    ],
                  ),
                  padding: const EdgeInsets.all(24),
                  child: Text(
                    '🚀 I am an experienced Sr. Mobile App Developer passionate about building '
                    'high-quality apps for Android and iOS using Flutter and native technologies. '
                    'I excel in designing elegant UI/UX, integrating APIs, and leading teams '
                    'to deliver impactful solutions.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          height: 1.5,
                          color: Colors.grey[800],
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                const SizedBox(height: 30),

                // Highlights with animation
                Wrap(
                  spacing: 20,
                  runSpacing: 12,
                  children: [
                    _buildHighlight(Icons.smartphone,
                        "5+ years in Mobile App Development", context),
                    _buildHighlight(
                        Icons.people, "Team Leadership & Mentorship", context),
                    _buildHighlight(
                        Icons.api, "REST API & Firebase Integrations", context),
                    _buildHighlight(Icons.speed,
                        "Performance Optimization & Scalability", context),
                    _buildHighlight(Icons.design_services,
                        "UI/UX focused design approach", context),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
