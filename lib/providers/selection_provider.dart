import 'package:development/data/selection_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final selectionProvider =
    StateNotifierProvider<SelectionManager, SelectionModel?>(
  (ref) => SelectionManager(ref),
);

class SelectionManager extends StateNotifier<SelectionModel?> {
  final StateNotifierProviderRef ref;

  SelectionManager(this.ref) : super(null);

  void makeSelection(SelectionModel selection) {
    state = selection;
  }
}
