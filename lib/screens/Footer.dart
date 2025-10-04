import 'package:flutter/material.dart';

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
