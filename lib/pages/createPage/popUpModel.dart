class SelectionPopupModel {
  final String title;
  final String value;

  SelectionPopupModel({required this.title, String? value})
      : value = value ?? title;
}
