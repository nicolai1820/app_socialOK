import 'package:app_social/components/loading.dart';
import 'package:app_social/models/empresa_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class SelectEmpresaController extends GetxController {


  final listEmpresa = <DropdownMenuItem>[].obs;
  final valueOrigen = "".obs;

  String idEmpresa = "";

  @override
  void onInit() {
    super.onInit();
    loadJEmpresasData();

  }
  late List data;

  Future<dynamic> loadJEmpresasData() async {
    Loading().show('Cargando');
      var jsonText = await rootBundle.loadString('assets/json/empresas.json');
      print(jsonText);
      data = empresaModelFromJson(jsonText);
      lisEmpresas(data);
  }

  void lisEmpresas(categorias) {
    listEmpresa.clear();
    print("FOR CATEGORIAS");
    for (var item in categorias) {
        listEmpresa.add(
          DropdownMenuItem(
            child: Text(item.name),
            value: item.name,
            onTap: (){
              print('GUARDANDO ID');
              idEmpresa = item.id;
            },
          )
        );
    }
    Loading().hide();
    update();
  }

  siguiente(){
      Get.toNamed('/saludypension');
  }




}
