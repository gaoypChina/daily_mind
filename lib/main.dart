import 'package:daily_mind/features/dashboard/presentation/dashboard.dart';
import 'package:daily_mind/theme/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DailyMind',
      theme: darkTheme,
      themeMode: ThemeMode.dark,
      home: const Dashboard(),
    );
  }
}
