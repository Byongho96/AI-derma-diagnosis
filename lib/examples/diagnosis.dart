class Diagnosis {
  final int? id;
  final int userId;
  final String imageUrl;
  final String? result;
  final double? confidence;
  final String status;

  Diagnosis({
    this.id,
    required this.userId,
    required this.imageUrl,
    this.result,
    this.confidence,
    this.status = 'pending',
  });

  factory Diagnosis.fromJson(Map<String, dynamic> json) {
    return Diagnosis(
      id: json['id'],
      userId: json['user_id'],
      imageUrl: json['image_url'],
      result: json['result'],
      confidence: json['confidence']?.toDouble(),
      status: json['status'] ?? 'pending',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user_id': userId,
      'image_url': imageUrl,
      'result': result,
      'confidence': confidence,
      'status': status,
    };
  }
}
