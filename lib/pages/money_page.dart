import 'package:development/providers/selection_provider.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MoneyPage extends HookConsumerWidget {
  const MoneyPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final selection = ref.read(selectionProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text('Saving up for a ${selection?.choice.name} 🎉'),
      ),
    );
  }
}
