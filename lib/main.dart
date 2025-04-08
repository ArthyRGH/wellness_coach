// main.dart
import 'package:flutter/material.dart';
import 'screens/chat_screen.dart';

void main() {
  runApp(WellnessCoachApp());
}

class WellnessCoachApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'AI Wellness Coach',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ChatScreen(),
    );
  }
}
