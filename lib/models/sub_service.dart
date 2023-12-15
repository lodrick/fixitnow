class SubService {
  final String title;
  final bool isChecked;

  SubService({required this.title, required this.isChecked});

  static SubService fromJson(Map<String, dynamic> json) =>
      SubService(title: json['title'] as String, isChecked: json['isChecked']);
}
