// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Menu {
  final String id;
  final String title;
  final String subtitle;
  final String description;
  final String category;
  final double price;
  final double rate;
  final double sizeS;
  final double sizeM;
  final double sizeL;
  final String imageId;
  final String createdAt;
  final String updatedAt;
  Menu({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.description,
    required this.category,
    required this.price,
    required this.rate,
    required this.sizeS,
    required this.sizeM,
    required this.sizeL,
    required this.imageId,
    required this.createdAt,
    required this.updatedAt,
  });

  Menu copyWith({
    String? id,
    String? title,
    String? subtitle,
    String? description,
    String? category,
    double? price,
    double? rate,
    double? sizeS,
    double? sizeM,
    double? sizeL,
    String? imageId,
    String? createdAt,
    String? updatedAt,
  }) {
    return Menu(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      description: description ?? this.description,
      category: category ?? this.category,
      price: price ?? this.price,
      rate: rate ?? this.rate,
      sizeS: sizeS ?? this.sizeS,
      sizeM: sizeM ?? this.sizeM,
      sizeL: sizeL ?? this.sizeL,
      imageId: imageId ?? this.imageId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      '\$id': id,
      'title': title,
      'subtitle': subtitle,
      'description': description,
      'category': category,
      'price': price,
      'rate': rate,
      'sizeS': sizeS,
      'sizeM': sizeM,
      'sizeL': sizeL,
      'imageId': imageId,
      '\$createdAt': createdAt,
      '\$updatedAt': updatedAt,
    };
  }

  factory Menu.fromMap(Map<String, dynamic> map) {
    return Menu(
      id: map['\$id'] as String,
      title: map['title'] as String,
      subtitle: map['subtitle'] as String,
      description: map['description'] as String,
      category: map['category'] as String,
      price: map['price'] as double,
      rate: map['rate'] as double,
      sizeS: map['sizeS'] as double,
      sizeM: map['sizeM'] as double,
      sizeL: map['sizeL'] as double,
      imageId: map['imageId'] as String,
      createdAt: map['\$createdAt'] as String,
      updatedAt: map['\$updatedAt'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Menu.fromJson(String source) =>
      Menu.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Menu(id: $id, title: $title, subtitle: $subtitle, description: $description, category: $category, price: $price, rate: $rate, sizeS: $sizeS, sizeM: $sizeM, sizeL: $sizeL, imageId: $imageId, createdAt: $createdAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(covariant Menu other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.title == title &&
        other.subtitle == subtitle &&
        other.description == description &&
        other.category == category &&
        other.price == price &&
        other.rate == rate &&
        other.sizeS == sizeS &&
        other.sizeM == sizeM &&
        other.sizeL == sizeL &&
        other.imageId == imageId &&
        other.createdAt == createdAt &&
        other.updatedAt == updatedAt;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        subtitle.hashCode ^
        description.hashCode ^
        category.hashCode ^
        price.hashCode ^
        rate.hashCode ^
        sizeS.hashCode ^
        sizeM.hashCode ^
        sizeL.hashCode ^
        imageId.hashCode ^
        createdAt.hashCode ^
        updatedAt.hashCode;
  }
}
