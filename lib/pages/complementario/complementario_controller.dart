import 'package:app_social/components/loading.dart';
import 'package:app_social/models/empresa_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ComplementarioController extends GetxController {
  final GlobalKey<FormState> changeFormKey = GlobalKey<FormState>();

  final listEstado = <DropdownMenuItem>[].obs;
  final valueOrigen = "".obs;
  String idEstado = "";
  late List data;

  final listGenero = <DropdownMenuItem>[].obs;
  final valueOrigenSub = "".obs;
  String idGenero = "";
  late List dataG;

  final listOrientacion = <DropdownMenuItem>[].obs;
  final valueOrigenO = "".obs;
  String idOrientacion = "";
  late List dataO;

  final listEscolaridad = <DropdownMenuItem>[].obs;
  final valueOrigenE = "".obs;
  String idEscolaridad = "";
  late List dataEs;

  final listVulnerabilidad = <DropdownMenuItem>[].obs;
  final valueOrigenV = "".obs;
  String idVulnerabilida = "";
  late List dataV;

  final listEtnia = <DropdownMenuItem>[].obs;
  final valueOrigenEt = "".obs;
  String idDirr = "";
  late List dataEt;

  @override
  void onInit() {

    Loading().show('Cargando');
    super.onInit();
    loadEstado();
    loadGenero();
    loadOrientacion();
    loadEscolaridad();
    loadVulnerabilidad();
    loadEtnia();
  }

  Future<dynamic> loadEstado() async {
      var jsonText = await rootBundle.loadString('assets/json/estadoCivil.json');
      print(jsonText);
      data = empresaModelFromJson(jsonText);
      listarCiudad(data);
  }

  void listarCiudad(categorias) {
    listEstado.clear();
    print("FOR CATEGORIAS");
    for (var item in categorias) {
        listEstado.add(
          DropdownMenuItem(
            child: Text(item.name),
            value: item.name,
            onTap: (){
              print('GUARDANDO ID');
              idEstado = item.id;
            },
          )
        );
    }
    Loading().hide();
    update();
  }

  Future<dynamic> loadGenero() async {
      var jsonText = await rootBundle.loadString('assets/json/genero.json');
      print(jsonText);
      dataG = empresaModelFromJson(jsonText);
      listarGenero(dataG);
  }

  void listarGenero(categorias) {
    listGenero.clear();
    print("FOR CATEGORIAS");
    for (var item in categorias) {
        listGenero.add(
          DropdownMenuItem(
            child: Text(item.name),
            value: item.name,
            onTap: (){
              print('GUARDANDO ID');
              idGenero = item.id;
            },
          )
        );
    }
    Loading().hide();
    update();
  }

  Future<dynamic> loadOrientacion() async {
      var jsonText = await rootBundle.loadString('assets/json/sexualidad.json');
      print(jsonText);
      dataO = empresaModelFromJson(jsonText);
      listarOrientacion(dataO);
  }

  void listarOrientacion(categorias) {
    listOrientacion.clear();
    print("FOR CATEGORIAS");
    for (var item in categorias) {
        listOrientacion.add(
          DropdownMenuItem(
            child: Text(item.name),
            value: item.name,
            onTap: (){
              print('GUARDANDO ID');
              idOrientacion = item.id;
            },
          )
        );
    }
    Loading().hide();
    update();
  }

  Future<dynamic> loadEscolaridad() async {
      var jsonText = await rootBundle.loadString('assets/json/escolaridad.json');
      print(jsonText);
      dataEs = empresaModelFromJson(jsonText);
      listarEscolaridad(dataEs);
  }

  void listarEscolaridad(categorias) {
    listEscolaridad.clear();
    print("FOR CATEGORIAS");
    for (var item in categorias) {
        listEscolaridad.add(
          DropdownMenuItem(
            child: Text(item.name),
            value: item.name,
            onTap: (){
              print('GUARDANDO ID');
              idEscolaridad = item.id;
            },
          )
        );
    }
    Loading().hide();
    update();
  }

  Future<dynamic> loadVulnerabilidad() async {
      var jsonText = await rootBundle.loadString('assets/json/vulnerabilidad.json');
      print(jsonText);
      dataV = empresaModelFromJson(jsonText);
      listarVulnerabilidad(dataV);
  }

  void listarVulnerabilidad(categorias) {
    listVulnerabilidad.clear();
    print("FOR CATEGORIAS");
    for (var item in categorias) {
        listVulnerabilidad.add(
          DropdownMenuItem(
            child: Text(item.name),
            value: item.name,
            onTap: (){
              print('GUARDANDO ID');
              idVulnerabilida = item.id;
            },
          )
        );
    }
    Loading().hide();
    update();
  }

  Future<dynamic> loadEtnia() async {
      var jsonText = await rootBundle.loadString('assets/json/etnia.json');
      print(jsonText);
      dataEt = empresaModelFromJson(jsonText);
      listarEtnia(dataEt);
  }

  void listarEtnia(categorias) {
    listEtnia.clear();
    print("FOR CATEGORIAS");
    for (var item in categorias) {
        listEtnia.add(
          DropdownMenuItem(
            child: Text(item.name),
            value: item.name,
            onTap: (){
              print('GUARDANDO ID');
              idVulnerabilida = item.id;
            },
          )
        );
    }
    Loading().hide();
    update();
  }

  siguiente(){
    Get.toNamed('/laboral');
  }

}