import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:app_social/components/loading.dart';
import 'package:app_social/models/empresa_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SaludyPensionController extends GetxController {

  final listSalud = <DropdownMenuItem>[].obs;
  final listPension = <DropdownMenuItem>[].obs;

  final valueOrigen = "".obs;
  final valueOrigenSub = "".obs;

  String idSalud = "";
  String idPension = "";

  @override
  void onInit() {

    Loading().show('Cargando');
    super.onInit();
    loadJSaludData();
    loadJPensionData();
  }
  late List data;
  late List dataP;

  Future<dynamic> loadJSaludData() async {
      var jsonText = await rootBundle.loadString('assets/json/eps.json');
      print(jsonText);
      data = empresaModelFromJson(jsonText);
      listarSalud(data);
  }

  void listarSalud(categorias) {
    listSalud.clear();
    print("FOR CATEGORIAS");
    for (var item in categorias) {
        listSalud.add(
          DropdownMenuItem(
            child: Text(item.name),
            value: item.name,
            onTap: (){
              print('GUARDANDO ID');
              idSalud = item.id;
            },
          )
        );
    }
    Loading().hide();
    update();
  }

  Future<dynamic> loadJPensionData() async {
      var jsonText = await rootBundle.loadString('assets/json/pension.json');
      print(jsonText);
      data = empresaModelFromJson(jsonText);
      listarPension(data);
  }

  void listarPension(categorias) {
    listPension.clear();
    print("FOR CATEGORIAS");
    for (var item in categorias) {
        listPension.add(
          DropdownMenuItem(
            child: Text(item.name),
            value: item.name,
            onTap: (){
              print('GUARDANDO ID');
              idPension = item.id;
            },
          )
        );
    }
    Loading().hide();
    update();
  }

  siguiente(){
    Get.toNamed('/cedula');
  }


}