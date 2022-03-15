import 'dart:convert';

class PayModel {
  final String Pay_ID;
  final String Pay_Date;
  final String Slip_Filename;
  final String Price;
  final String PS_Name;
  final String RE_ID;
  final String RE_FDate;
  final String L_Name;
  final String RES_Name;
  final String M_Name;
  final String T_Name;
  PayModel({
    required this.Pay_ID,
    required this.Pay_Date,
    required this.Slip_Filename,
    required this.Price,
    required this.PS_Name,
    required this.RE_ID,
    required this.RE_FDate,
    required this.L_Name,
    required this.RES_Name,
    required this.M_Name,
    required this.T_Name,
  });

  PayModel copyWith({
    String? Pay_ID,
    String? Pay_Date,
    String? Slip_Filename,
    String? Price,
    String? PS_Name,
    String? RE_ID,
    String? RE_FDate,
    String? L_Name,
    String? RES_Name,
    String? M_Name,
    String? T_Name,
  }) {
    return PayModel(
      Pay_ID: Pay_ID ?? this.Pay_ID,
      Pay_Date: Pay_Date ?? this.Pay_Date,
      Slip_Filename: Slip_Filename ?? this.Slip_Filename,
      Price: Price ?? this.Price,
      PS_Name: PS_Name ?? this.PS_Name,
      RE_ID: RE_ID ?? this.RE_ID,
      RE_FDate: RE_FDate ?? this.RE_FDate,
      L_Name: L_Name ?? this.L_Name,
      RES_Name: RES_Name ?? this.RES_Name,
      M_Name: M_Name ?? this.M_Name,
      T_Name: T_Name ?? this.T_Name,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'Pay_ID': Pay_ID,
      'Pay_Date': Pay_Date,
      'Slip_Filename': Slip_Filename,
      'Price': Price,
      'PS_Name': PS_Name,
      'RE_ID': RE_ID,
      'RE_FDate': RE_FDate,
      'L_Name': L_Name,
      'RES_Name': RES_Name,
      'M_Name': M_Name,
      'T_Name': T_Name,
    };
  }

  factory PayModel.fromMap(Map<String, dynamic> map) {
    return PayModel(
      Pay_ID: map['Pay_ID'] ?? '',
      Pay_Date: map['Pay_Date'] ?? '',
      Slip_Filename: map['Slip_Filename'] ?? '',
      Price: map['Price'] ?? '',
      PS_Name: map['PS_Name'] ?? '',
      RE_ID: map['RE_ID'] ?? '',
      RE_FDate: map['RE_FDate'] ?? '',
      L_Name: map['L_Name'] ?? '',
      RES_Name: map['RES_Name'] ?? '',
      M_Name: map['M_Name'] ?? '',
      T_Name: map['T_Name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory PayModel.fromJson(String source) =>
      PayModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'PayModel(Pay_ID: $Pay_ID, Pay_Date: $Pay_Date, Slip_Filename: $Slip_Filename, Price: $Price, PS_Name: $PS_Name, RE_ID: $RE_ID, RE_FDate: $RE_FDate, L_Name: $L_Name, RES_Name: $RES_Name, M_Name: $M_Name, T_Name: $T_Name)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is PayModel &&
        other.Pay_ID == Pay_ID &&
        other.Pay_Date == Pay_Date &&
        other.Slip_Filename == Slip_Filename &&
        other.Price == Price &&
        other.PS_Name == PS_Name &&
        other.RE_ID == RE_ID &&
        other.RE_FDate == RE_FDate &&
        other.L_Name == L_Name &&
        other.RES_Name == RES_Name &&
        other.M_Name == M_Name &&
        other.T_Name == T_Name;
  }

  @override
  int get hashCode {
    return Pay_ID.hashCode ^
        Pay_Date.hashCode ^
        Slip_Filename.hashCode ^
        Price.hashCode ^
        PS_Name.hashCode ^
        RE_ID.hashCode ^
        RE_FDate.hashCode ^
        L_Name.hashCode ^
        RES_Name.hashCode ^
        M_Name.hashCode ^
        T_Name.hashCode;
  }
}
