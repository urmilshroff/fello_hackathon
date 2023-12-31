import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:development/helpers/colors.dart';
import 'package:development/pages/selection_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class HomePage extends HookConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isIntroComplete = useState(false);

    final circularAnimationController = useAnimationController(
      duration: const Duration(milliseconds: 750),
    );

    return Scaffold(
      body: Center(
        child: Builder(builder: (context) {
          if (!isIntroComplete.value) {
            return AnimatedTextKit(
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
                AudioPlayer().play(DeviceFileSource('assets/audio/intro.mp3'));
                isIntroComplete.value = true;
                circularAnimationController.forward();
              },
            );
          } else {
            return CircularRevealAnimation(
              animation: CurvedAnimation(
                parent: circularAnimationController,
                curve: Curves.easeOut,
              ),
              child: const SelectionPage(),
            );
          }
        }),
      ),
    );
  }
}
