import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:development/helpers/colors.dart';
import 'package:development/pages/selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:sizer/sizer.dart';

class HomePage extends HookWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final isComplete = useState(false);
    final circularAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 750),
    );

    return Scaffold(
      body: Center(
        child: !isComplete.value
            ? AnimatedTextKit(
                animatedTexts: [
                  FadeAnimatedText(
                    'Welcome to',
                    textStyle: const TextStyle(
                      fontSize: 28.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  FadeAnimatedText(
                    'StreakSave 💸',
                    textStyle: const TextStyle(
                      color: StreakColors.green,
                      fontSize: 42.0,
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
                pause: const Duration(milliseconds: 750),
                onFinished: () {
                  AudioPlayer()
                      .play(DeviceFileSource('assets/audio/intro.mp3'));
                  isComplete.value = true;
                  circularAnimationController.forward();
                },
              )
            : CircularRevealAnimation(
                animation: CurvedAnimation(
                  parent: circularAnimationController,
                  curve: Curves.easeOut,
                ),
                child: const SelectionPage(),
              ),
      ),
    );
  }
}
