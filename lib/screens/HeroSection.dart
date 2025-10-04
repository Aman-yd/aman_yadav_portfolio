import 'package:flutter/material.dart';

class HeroSection extends StatefulWidget {
  VoidCallback onContactCallBack;
  HeroSection({Key? key, required this.onContactCallBack}) : super(key: key);

  @override
  State<HeroSection> createState() => _HeroSectionState();
}

class _HeroSectionState extends State<HeroSection>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  final List<String> _titles = [
    "Sr. Mobile App Developer",
    "Flutter Specialist",
    "React Native & Android (Java)",
    "Team Leader"
  ];
  int _titleIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _controller.forward();

    // Change title every 3 sec
    Future.doWhile(() async {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return false;
      setState(() {
        _titleIndex = (_titleIndex + 1) % _titles.length;
      });
      _controller.forward(from: 0);
      return true;
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildButton(String text, IconData icon, VoidCallback onTap) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, size: 18),
      label: Text(text),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        elevation: 4,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 80, horizontal: 24),
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF283c86), Color(0xFF45a247)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 1100),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Left Section (Text)
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '👋 Hi, I am',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: Colors.white70,
                            fontWeight: FontWeight.w400,
                          ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Aman Yadav',
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                    ),
                    const SizedBox(height: 12),
                    FadeTransition(
                      opacity: _fadeAnimation,
                      child: Text(
                        _titles[_titleIndex],
                        style:
                            Theme.of(context).textTheme.headlineSmall?.copyWith(
                                  color: Colors.amberAccent,
                                  fontWeight: FontWeight.w600,
                                ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Text(
                      'I have 5+ years of experience in Flutter, Android (Java), React Native, '
                      'and Git. I specialize in building scalable mobile apps, integrating REST APIs, '
                      'and leading development teams.',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            color: Colors.white.withOpacity(0.9),
                          ),
                    ),
                    const SizedBox(height: 30),
                    Row(
                      children: [
                        // _buildButton("📄 Download CV", Icons.download, () {
                        //   // TODO: link to your CV
                        // }),
                        const SizedBox(width: 16),
                        _buildButton("📩 Contact Me", Icons.mail,
                            widget.onContactCallBack),
                      ],
                    )
                  ],
                ),
              ),

              const SizedBox(width: 40),

              // Right Section (Profile Avatar)
              // Expanded(
              //   flex: 1,
              //   child: CircleAvatar(
              //     radius: 90,
              //     backgroundColor: Colors.white,
              //     child: CircleAvatar(
              //       radius: 85,
              //       backgroundImage: AssetImage(
              //           "assets/profile.jpg"), // put your photo in assets
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
    );
  }
}
