import 'dart:convert';

class ReserveModel {
  final String RE_ID;
  final String RE_Month;
  final String RE_Year;
  final String L_Name;
  final String RES_Name;
  final String M_Name;
  final String Price;
  final String T_Name;
  final String Z_Name;
  ReserveModel({
    required this.RE_ID,
    required this.RE_Month,
    required this.RE_Year,
    required this.L_Name,
    required this.RES_Name,
    required this.M_Name,
    required this.Price,
    required this.T_Name,
    required this.Z_Name,
  });

  ReserveModel copyWith({
    String? RE_ID,
    String? RE_Month,
    String? RE_Year,
    String? L_Name,
    String? RES_Name,
    String? M_Name,
    String? Price,
    String? T_Name,
    String? Z_Name,
  }) {
    return ReserveModel(
      RE_ID: RE_ID ?? this.RE_ID,
      RE_Month: RE_Month ?? this.RE_Month,
      RE_Year: RE_Year ?? this.RE_Year,
      L_Name: L_Name ?? this.L_Name,
      RES_Name: RES_Name ?? this.RES_Name,
      M_Name: M_Name ?? this.M_Name,
      Price: Price ?? this.Price,
      T_Name: T_Name ?? this.T_Name,
      Z_Name: Z_Name ?? this.Z_Name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'RE_ID': RE_ID,
      'RE_Month': RE_Month,
      'RE_Year': RE_Year,
      'L_Name': L_Name,
      'RES_Name': RES_Name,
      'M_Name': M_Name,
      'Price': Price,
      'T_Name': T_Name,
      'Z_Name': Z_Name,
    };
  }

  factory ReserveModel.fromMap(Map<String, dynamic> map) {
    return ReserveModel(
      RE_ID: map['RE_ID'] ?? '',
      RE_Month: map['RE_Month'] ?? '',
      RE_Year: map['RE_Year'] ?? '',
      L_Name: map['L_Name'] ?? '',
      RES_Name: map['RES_Name'] ?? '',
      M_Name: map['M_Name'] ?? '',
      Price: map['Price'] ?? '',
      T_Name: map['T_Name'] ?? '',
      Z_Name: map['Z_Name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory ReserveModel.fromJson(String source) =>
      ReserveModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'ReserveModel(RE_ID: $RE_ID, RE_Month: $RE_Month, RE_Year: $RE_Year, L_Name: $L_Name, RES_Name: $RES_Name, M_Name: $M_Name, Price: $Price, T_Name: $T_Name, Z_Name: $Z_Name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ReserveModel &&
        other.RE_ID == RE_ID &&
        other.RE_Month == RE_Month &&
        other.RE_Year == RE_Year &&
        other.L_Name == L_Name &&
        other.RES_Name == RES_Name &&
        other.M_Name == M_Name &&
        other.Price == Price &&
        other.T_Name == T_Name &&
        other.Z_Name == Z_Name;
  }

  @override
  int get hashCode {
    return RE_ID.hashCode ^
        RE_Month.hashCode ^
        RE_Year.hashCode ^
        L_Name.hashCode ^
        RES_Name.hashCode ^
        M_Name.hashCode ^
        Price.hashCode ^
        T_Name.hashCode ^
        Z_Name.hashCode;
  }
}
