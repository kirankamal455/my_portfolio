// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CustomServiceCardModel {
  final String tittle;
  final String imagePath;
  CustomServiceCardModel({
    required this.tittle,
    required this.imagePath,
  });

  CustomServiceCardModel copyWith({
    String? tittle,
    String? imagePath,
  }) {
    return CustomServiceCardModel(
      tittle: tittle ?? this.tittle,
      imagePath: imagePath ?? this.imagePath,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'tittle': tittle,
      'imagePath': imagePath,
    };
  }

  factory CustomServiceCardModel.fromMap(Map<String, dynamic> map) {
    return CustomServiceCardModel(
      tittle: map['tittle'] as String,
      imagePath: map['imagePath'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory CustomServiceCardModel.fromJson(String source) => CustomServiceCardModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CustomServiceCardModel(tittle: $tittle, imagePath: $imagePath)';

  @override
  bool operator ==(covariant CustomServiceCardModel other) {
    if (identical(this, other)) return true;
  
    return 
      other.tittle == tittle &&
      other.imagePath == imagePath;
  }

  @override
  int get hashCode => tittle.hashCode ^ imagePath.hashCode;
}
