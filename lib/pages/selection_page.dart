import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:sizer/sizer.dart';

class SelectionPage extends StatefulWidget {
  const SelectionPage({super.key});

  @override
  State<SelectionPage> createState() => _SelectionPageState();
}

class _SelectionPageState extends State<SelectionPage> {
  late LiquidController liquidController;

  @override
  void initState() {
    super.initState();
    liquidController = LiquidController();
  }

  @override
  Widget build(BuildContext context) {
    return LiquidSwipe(
      liquidController: liquidController,
      positionSlideIcon: 0.5,
      slideIconWidget: const Icon(Icons.keyboard_double_arrow_left_rounded),
      waveType: WaveType.liquidReveal,
      fullTransitionValue: 880,
      enableSideReveal: true,
      preferDragFromRevealedArea: true,
      enableLoop: true,
      ignoreUserGestureWhileAnimating: true,
      pages: [
        Container(
          height: 100.h,
          width: 100.w,
          color: Colors.tealAccent,
        ),
      ],
    );
  }
}
