// To parse this JSON data, do
//
//     final empresaModel = empresaModelFromJson(jsonString);

import 'dart:convert';

List<EmpresaModel> empresaModelFromJson(String str) => List<EmpresaModel>.from(json.decode(str).map((x) => EmpresaModel.fromJson(x)));

String empresaModelToJson(List<EmpresaModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class EmpresaModel {
    EmpresaModel({
        required this.name,
        required this.id,
    });

    String name;
    String id;

    factory EmpresaModel.fromJson(Map<String, dynamic> json) => EmpresaModel(
        name: json["name"],
        id: json["id"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
    };
}
