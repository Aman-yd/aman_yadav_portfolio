import 'package:flutter/material.dart';
import 'package:porfolio/screens/AboutSection.dart';
import 'package:porfolio/screens/ContactSection.dart';
import 'package:porfolio/screens/ExperienceSection.dart';
import 'package:porfolio/screens/Footer.dart';
import 'package:porfolio/screens/HeroSection.dart';
import 'package:porfolio/screens/ProjectsSection.dart';
import 'package:porfolio/screens/SkillsSection.dart';

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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: const PortfolioHome(),
    );
  }
}

class PortfolioHome extends StatefulWidget {
  const PortfolioHome({Key? key}) : super(key: key);

  @override
  State<PortfolioHome> createState() => _PortfolioHomeState();
}

class _PortfolioHomeState extends State<PortfolioHome>
    with TickerProviderStateMixin {
  final ScrollController _scrollController = ScrollController();

  // Section keys
  final heroKey = GlobalKey();
  final aboutKey = GlobalKey();
  final experienceKey = GlobalKey();
  final projectsKey = GlobalKey();
  final skillsKey = GlobalKey();
  final contactKey = GlobalKey();

  void _scrollToSection(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOutCubic,
      );
    }
  }

  // Build nav button with hover effect
  Widget _navButton(String text, GlobalKey key) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: MouseRegion(
        cursor: SystemMouseCursors.click,
        child: TextButton(
          onPressed: () => _scrollToSection(key),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }

  // Animated wrapper for sections
  Widget _animatedSection(Widget child, Key key) {
    return TweenAnimationBuilder(
      key: key,
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 2000),
      curve: Curves.easeInOut,
      builder: (context, value, _) {
        return Transform.translate(
          offset: Offset(0, 50 * (1 - value)),
          child: Opacity(
            opacity: value,
            child: child,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true, // AppBar overlaps body
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.4),
        elevation: 0,
        title: const Text(
          "Aman Yadav • Portfolio",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          _navButton("Home", heroKey),
          _navButton("About", aboutKey),
          _navButton("Experience", experienceKey),
          _navButton("Projects", projectsKey),
          _navButton("Skills", skillsKey),
          _navButton("Contact", contactKey),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF0f2027), Color(0xFF203a43), Color(0xFF2c5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView(
          controller: _scrollController,
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _animatedSection(HeroSection(
                  onContactCallBack: () {
                    _scrollToSection(contactKey);
                  },
                ), heroKey),
                const SizedBox(height: 60),
                _animatedSection(const AboutSection(), aboutKey),
                const SizedBox(height: 60),
                _animatedSection(const ExperienceSection(), experienceKey),
                const SizedBox(height: 60),
                _animatedSection(const ProjectsSection(), projectsKey),
                const SizedBox(height: 60),
                _animatedSection(const SkillsSection(), skillsKey),
                const SizedBox(height: 60),
                _animatedSection(const ContactSection(), contactKey),
                const SizedBox(height: 100),
                const Footer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
