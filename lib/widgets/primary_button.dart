import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shimmer/shimmer.dart';
import 'package:sizer/sizer.dart';

class PrimaryButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color highlightColor;

  const PrimaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
    required this.highlightColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 7.h,
      width: 40.w,
      child: ElevatedButton(
        onPressed: () async {
          await HapticFeedback.mediumImpact();
          onPressed();
        },
        child: Center(
          child: Shimmer.fromColors(
            baseColor: Colors.white,
            highlightColor: highlightColor,
            period: const Duration(seconds: 4),
            child: Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
