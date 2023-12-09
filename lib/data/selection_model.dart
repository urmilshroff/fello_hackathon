enum Choice {
  smartphone,
  car,
  house,
}

class SelectionModel {
  final Choice choice;
  final int cost;
  final int tenure;

  const SelectionModel({
    required this.choice,
    required this.cost,
    required this.tenure,
  });
}
