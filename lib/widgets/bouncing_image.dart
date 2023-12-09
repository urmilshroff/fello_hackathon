import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class BouncingImage extends HookConsumerWidget {
  final String image;
  const BouncingImage({super.key, required this.image});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller =
        useAnimationController(duration: const Duration(milliseconds: 750))
          ..repeat(reverse: true);

    final Animation<double> imageAnimation =
        Tween<double>(begin: 0, end: 12).animate(controller);

    return AnimatedBuilder(
      animation: imageAnimation,
      child: Container(
        alignment: Alignment.center,
        child: Image.asset(
          image,
          width: 48.w,
        ),
      ),
      builder: (context, child) {
        return Transform.translate(
          offset: Offset(0, imageAnimation.value),
          child: child,
        );
      },
    );
  }
}
