import 'package:app_social/components/loading.dart';
import 'package:app_social/models/empresa_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ResidenciaController extends GetxController {
  final GlobalKey<FormState> changeFormKey = GlobalKey<FormState>();

  final listCiudad = <DropdownMenuItem>[].obs;
  final valueOrigen = "".obs;
  String idCiudad = "";
  late List data;

  final listDirr = <DropdownMenuItem>[].obs;
  final valueOrigenSub = "".obs;
  String idDirr = "";
  late List datab;

  final direccionController = TextEditingController();
  final barrioController = TextEditingController();
  final telefonoController = TextEditingController();
  final celularController = TextEditingController();
  final emailController = TextEditingController();

  @override
  void onInit() {

    Loading().show('Cargando');
    super.onInit();
    loadDocument();
    loadDirr();
  }

  Future<dynamic> loadDocument() async {
      var jsonText = await rootBundle.loadString('assets/json/ciudad.json');
      print(jsonText);
      data = empresaModelFromJson(jsonText);
      listarCiudad(data);
  }

  void listarCiudad(categorias) {
    listCiudad.clear();
    print("FOR CATEGORIAS");
    for (var item in categorias) {
        listCiudad.add(
          DropdownMenuItem(
            child: Text(item.name),
            value: item.name,
            onTap: (){
              print('GUARDANDO ID');
              idCiudad = item.id;
            },
          )
        );
    }
    Loading().hide();
    update();
  }

  Future<dynamic> loadDirr() async {
      var jsonText = await rootBundle.loadString('assets/json/tipoDireccion.json');
      print(jsonText);
      datab = empresaModelFromJson(jsonText);
      listarDirr(datab);
  }

  void listarDirr(categorias) {
    listDirr.clear();
    print("FOR CATEGORIAS");
    for (var item in categorias) {
        listDirr.add(
          DropdownMenuItem(
            child: Text(item.name),
            value: item.name,
            onTap: (){
              print('GUARDANDO ID');
              idDirr = item.id;
            },
          )
        );
    }
    Loading().hide();
    update();
  }

  siguiente(){
    Get.toNamed('/complementario');
  }

}