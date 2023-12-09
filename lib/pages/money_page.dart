import 'package:development/providers/selection_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:sizer/sizer.dart';

class MoneyPage extends HookConsumerWidget {
  const MoneyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.read(selectionProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Saving up for a ${selection?.choice.name} 🎉'),
      ),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                  height: 32.h,
                  child: Image.asset('assets/images/sad.png')),
              const Text(
                'No time to complete this :(',
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
