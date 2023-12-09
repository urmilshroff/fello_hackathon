import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:development/pages/selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final showButton = useState(false);

    final circularAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 500),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('StreakSave 💸'),
        centerTitle: true,
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                    'Welcome to',
                    textStyle: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FadeAnimatedText(
                    'StreakSave',
                    textStyle: const TextStyle(
                      color: Colors.tealAccent,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FadeAnimatedText(
                    'Let\'s begin!',
                    textStyle: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
                totalRepeatCount: 1,
                pause: const Duration(milliseconds: 700),
                onFinished: () => circularAnimationController.forward(),
              ),
              CircularRevealAnimation(
                animation: CurvedAnimation(
                  parent: circularAnimationController,
                  curve: Curves.easeOut,
                ),
                centerOffset: Offset(50.w, 50.h),
                child: const SelectionPage(),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
