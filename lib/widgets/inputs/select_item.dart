class SelectItem<T> {
  String title;
  T? id;

  SelectItem({
    required this.title,
    this.id,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is SelectItem && runtimeType == other.runtimeType && id == other.id;

  @override
  int get hashCode => super.hashCode;
}
