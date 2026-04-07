import 'package:cloud_firestore/cloud_firestore.dart';

class FarmModel {
  final String id;
  final String ownerId;
  final String name;
  final double area;
  final String soilType;
  final List<GeoPoint> boundaries;
  final DateTime createdAt;
  final DateTime updatedAt;

  FarmModel({
    required this.id,
    required this.ownerId,
    required this.name,
    required this.area,
    required this.soilType,
    required this.boundaries,
    required this.createdAt,
    required this.updatedAt,
  });

  Map<String, dynamic> toMap() {
    return {
      'ownerId': ownerId,
      'name': name,
      'area': area,
      'soilType': soilType,
      'boundaries': boundaries,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
    };
  }

  factory FarmModel.fromMap(String id, Map<String, dynamic> map) {
    return FarmModel(
      id: id,
      ownerId: map['ownerId'] ?? '',
      name: map['name'] ?? '',
      area: (map['area'] ?? 0.0).toDouble(),
      soilType: map['soilType'] ?? '',
      boundaries: List<GeoPoint>.from(map['boundaries'] ?? []),
      createdAt: (map['createdAt'] as Timestamp).toDate(),
      updatedAt: (map['updatedAt'] as Timestamp).toDate(),
    );
  }
}
