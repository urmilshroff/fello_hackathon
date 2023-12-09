import 'package:development/helpers/colors.dart';
import 'package:development/widgets/bouncing_image.dart';
import 'package:development/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class ChoiceWidget extends StatelessWidget {
  final String title;
  final Color color;
  final String image;

  const ChoiceWidget({
    super.key,
    required this.title,
    required this.color,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: 100.w,
      color: color,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'What do you want to save up for?',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 2.h),
          Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: color,
            period: const Duration(seconds: 4),
            child: Text(
              title,
              style: const TextStyle(
                fontSize: 26.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 4.h),
          BouncingImage(image: image),
          SizedBox(height: 6.h),
          PrimaryButton(
            onPressed: () {},
            text: 'Start Saving!',
            highlightColor: color,
          ),
        ],
      ),
    );
  }
}

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
      positionSlideIcon: 0.8,
      slideIconWidget: const Icon(Icons.arrow_back_ios),
      waveType: WaveType.liquidReveal,
      fullTransitionValue: 900,
      preferDragFromRevealedArea: true,
      enableSideReveal: true,
      enableLoop: true,
      pages: const [
        ChoiceWidget(
          title: 'Shopping Spree',
          color: StreakColors.purple,
          image: 'assets/images/shopping.png',
        ),
        ChoiceWidget(
          title: 'Fancy Laptop',
          color: StreakColors.black,
          image: 'assets/images/laptop.png',
        ),
        ChoiceWidget(
          title: 'Luxury Dinner',
          color: StreakColors.orange,
          image: 'assets/images/food.png',
        ),
        ChoiceWidget(
          title: 'Relaxing Vacation',
          color: StreakColors.green,
          image: 'assets/images/vacation.png',
        ),
      ],
    );
  }
}
