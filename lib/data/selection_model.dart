enum Choice {
  shopping,
  laptop,
  dinner,
  vacation,
}

class SelectionModel {
  final Choice choice;
  final int cost;
  final int tenure; // no. of months

  const SelectionModel({
    required this.choice,
    required this.cost,
    required this.tenure,
  });
}
