class ConditionModel {
  String? id;
  List<String>? hexColorCodes;

  ConditionModel({
    this.id,
    this.hexColorCodes,
  });

  factory ConditionModel.fromMap(Map<String, dynamic> map) {
    return ConditionModel(
      id: map['id'],
      hexColorCodes: List<String>.from(map['hexColorCodes'] ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'hexColorCodes': hexColorCodes,
    };
  }
}
