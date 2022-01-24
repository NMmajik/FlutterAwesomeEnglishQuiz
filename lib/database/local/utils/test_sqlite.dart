class DbTestItemField {
  static final String title = 'title';
  static final String size = 'size';
  static final String question_number = 'question_number';
  static final String score = 'score';
  static final String downloaded = 'downloaded';
  static final String resource_url = 'resource_url';
  static final String ver = 'ver';
}

class TestSqlite {
  final String title;
  final String size;
  final int question_number;
  final int ver;
  final int? score;
  final bool? downloaded;
  final String resource_url;
  TestSqlite({
    required this.title,
    required this.size,
    required this.question_number,
    required this.ver,
    required this.resource_url,
    this.score,
    this.downloaded,
  });

  static TestSqlite fromJson(Map<String, Object?> json) {
    return TestSqlite(
      title: json[DbTestItemField.title] as String,
      size: json[DbTestItemField.size] as String,
      question_number: json[DbTestItemField.question_number] as int,
      ver: json[DbTestItemField.ver] as int,
      resource_url: json[DbTestItemField.resource_url] as String,
      score: json[DbTestItemField.score] == null
          ? -1
          : json[DbTestItemField.score] as int,
      downloaded: json[DbTestItemField.downloaded] == null
          ? false
          : json[DbTestItemField.downloaded] as bool,
    );
  }

  Map<String, dynamic> toJson() => {
        DbTestItemField.title: title,
        DbTestItemField.size: size,
        DbTestItemField.question_number: question_number,
        DbTestItemField.ver: ver,
        DbTestItemField.score: score ?? -1,
        DbTestItemField.downloaded: downloaded ?? false,
        DbTestItemField.resource_url: resource_url,
      };
}
