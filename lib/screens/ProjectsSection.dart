import 'package:flutter/material.dart';

class ProjectsSection extends StatefulWidget {
  const ProjectsSection({Key? key}) : super(key: key);

  @override
  State<ProjectsSection> createState() => _ProjectsSectionState();
}

class _ProjectsSectionState extends State<ProjectsSection> {
  final ScrollController _scrollController = ScrollController();

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

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 340,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 340,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  final List<List<Color>> gradients = [
    [Colors.blue.shade400, Colors.blue.shade900],
    [Colors.purple.shade400, Colors.purple.shade800],
    [Colors.orange.shade400, Colors.orange.shade800],
    [Colors.teal.shade400, Colors.teal.shade800],
    [Colors.red.shade400, Colors.red.shade800],
  ];
  Widget _buildArrow({required bool left, required VoidCallback onTap}) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.black.withOpacity(0.3),
          ),
          padding: const EdgeInsets.all(8),
          child: Icon(
            left ? Icons.arrow_back_ios_new : Icons.arrow_forward_ios,
            color: Colors.white,
            size: 28,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.grey.shade50,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Projects',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  fontWeight: FontWeight.bold, color: Colors.blueGrey[900]),
            ),
            const SizedBox(height: 16),
            SizedBox(
              height: 180,
              child: Row(
                children: [
                  _buildArrow(left: true, onTap: _scrollLeft),
                  Expanded(
                    child: ListView.builder(
                      controller: _scrollController,
                      scrollDirection: Axis.horizontal,
                      itemCount: projects.length + 1,
                      itemBuilder: (context, index) {
                        if (index == projects.length) {
                          // Special "+14 Apps More" card
                          return Container(
                            width: 300,
                            margin: const EdgeInsets.only(right: 20),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(16),
                              gradient: LinearGradient(
                                colors: [
                                  Colors.grey.shade400,
                                  Colors.grey.shade600
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                              border: Border.all(
                                  color: Colors.white70,
                                  width: 2,
                                  style: BorderStyle.solid),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black26,
                                  blurRadius: 2,
                                  offset: Offset(0, 2),
                                )
                              ],
                            ),
                            child: const Center(
                              child: Text(
                                '+14 Apps More',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          );
                        }
                        final p = projects[index];
                        final gradientColors =
                            gradients[index % gradients.length];

                        return TweenAnimationBuilder<double>(
                          tween: Tween(begin: 0, end: 1),
                          duration:
                              Duration(milliseconds: 1200 + (index * 200)),
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
                            width: 320,
                            margin: const EdgeInsets.only(right: 16),
                            child: Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 5,
                              shadowColor: Colors.black26,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  gradient: LinearGradient(
                                    colors: gradientColors,
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                  ),
                                ),
                                padding: const EdgeInsets.all(16),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      p['title'] ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .titleMedium
                                          ?.copyWith(
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                    ),
                                    const SizedBox(height: 6),
                                    Text(
                                      '${p['duration']} | ${p['tech']}',
                                      style: TextStyle(
                                          color: Colors.white70, fontSize: 12),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      p['description'] ?? '',
                                      style: TextStyle(
                                        fontSize: 13,
                                        color: Colors.white.withOpacity(0.9),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  _buildArrow(left: false, onTap: _scrollRight),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
