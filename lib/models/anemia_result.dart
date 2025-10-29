class AnemiaResult {
  final bool hasAnemia;
  final double hemoglobinLevel;
  final DateTime timestamp;
  final String? imagePath;

  AnemiaResult({
    required this.hasAnemia,
    required this.hemoglobinLevel,
    required this.timestamp,
    this.imagePath,
  });

  Map<String, dynamic> toJson() {
    return {
      'hasAnemia': hasAnemia,
      'hemoglobinLevel': hemoglobinLevel,
      'timestamp': timestamp.toIso8601String(),
      'imagePath': imagePath,
    };
  }

  factory AnemiaResult.fromJson(Map<String, dynamic> json) {
    return AnemiaResult(
      hasAnemia: json['hasAnemia'] as bool,
      hemoglobinLevel: (json['hemoglobinLevel'] as num).toDouble(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      imagePath: json['imagePath'] as String?,
    );
  }
}
