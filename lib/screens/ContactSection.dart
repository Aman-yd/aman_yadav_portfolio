import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactSection extends StatelessWidget {
  const ContactSection({Key? key}) : super(key: key);

  final String email = 'abyadav113@gmail.com';
  final String phone = '+91(721)8144612';

  Future<void> _launchEmail() async {
    final Uri emailUri = Uri(scheme: 'mailto', path: email);
    if (!await launchUrl(emailUri)) throw 'Could not launch $emailUri';
  }

  Future<void> _launchPhone() async {
    final Uri phoneUri = Uri(scheme: 'tel', path: phone);
    if (!await launchUrl(phoneUri)) throw 'Could not launch $phoneUri';
  }

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
              Text('Contact',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.bold, color: Colors.white)),
              const SizedBox(height: 12),
              Text(
                'I am available for freelance or full-time opportunities. Feel free to reach out via email, phone, or social media.',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      height: 1.5,
                      color: Colors.white70, // <- add a custom color here
                      fontWeight:
                          FontWeight.w500, // optional: make it a bit bolder
                    ),
              ),
              const SizedBox(height: 24),
              Wrap(
                spacing: 16,
                runSpacing: 12,
                children: [
                  _buildFancyButton(
                      icon: Icons.email,
                      label: 'Email',
                      color: Colors.blue,
                      onTap: _launchEmail),
                  _buildFancyButton(
                      icon: Icons.phone,
                      label: 'Call (7218144612)',
                      color: Colors.green,
                      onTap: _launchPhone),
                  _buildFancyButton(
                      icon: Icons.linked_camera,
                      label: 'LinkedIn',
                      color: Colors.blueAccent,
                      onTap: () async {
                        final Uri url = Uri.parse(
                            'www.linkedin.com/in/aman-yadav-4218aa1b1');
                        if (!await launchUrl(url))
                          throw 'Could not launch $url';
                      }),
                  _buildFancyButton(
                      icon: Icons.code,
                      label: 'GitHub',
                      color: Colors.black,
                      onTap: () async {
                        final Uri url =
                            Uri.parse('https://github.com/Aman-yd/');
                        if (!await launchUrl(url))
                          throw 'Could not launch $url';
                      }),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFancyButton(
      {required IconData icon,
      required String label,
      required Color color,
      required VoidCallback onTap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [color.withOpacity(0.8), color],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight),
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(
                color: color.withOpacity(0.4),
                blurRadius: 8,
                offset: const Offset(2, 4),
              )
            ],
          ),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(icon, color: Colors.white),
              const SizedBox(width: 8),
              Text(label,
                  style: const TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }
}
