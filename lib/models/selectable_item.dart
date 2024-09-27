/// Represents an item that can be selected in the SelectableItemBottomSheet.
class SelectableItem<T> {
  /// The title of the selectable item.
  final String title;

  /// Indicates whether the item is currently selected.
  bool isSelected;

  /// The value associated with the selectable item.
  final T? value;

  SelectableItem({required this.title, this.isSelected = false, this.value});

  /// Creates a copy of the SelectableItem with optional parameter overrides.
  SelectableItem<T> copyWith({
    String? title,
    bool? isSelected,
    T? value,
  }) {
    return SelectableItem(
      title: title ?? this.title,
      isSelected: isSelected ?? this.isSelected,
      value: value ?? this.value,
    );
  }
}
