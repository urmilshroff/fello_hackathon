import 'package:development/helpers/colors.dart';
import 'package:development/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (
        BuildContext context,
        Orientation orientation,
        DeviceType deviceType,
      ) =>
          MaterialApp(
        title: 'StreakSave',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
            seedColor: StreakColors.green,
            brightness: Brightness.dark,
          ),
          useMaterial3: true,
          fontFamily: 'LexendDeca',
        ),
        home: const HomePage(),
      ),
    );
  }
}
