import 'package:app_social/components/loading.dart';
import 'package:app_social/models/empresa_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class CedulaController extends GetxController {
  final GlobalKey<FormState> changeFormKey = GlobalKey<FormState>();

  final listDocument = <DropdownMenuItem>[].obs;
  final valueOrigen = "".obs;
  String idDocumento = "";
  late List data;
  final documentController = TextEditingController();
  final nombreController = TextEditingController();
  final segNombreController = TextEditingController();
  final apellidoController = TextEditingController();
  final segApellidoController = TextEditingController();
  final fechaController = TextEditingController();
  final edadController = TextEditingController();

  @override
  void onInit() {

    Loading().show('Cargando');
    super.onInit();
    loadDocument();
  }

  Future<dynamic> loadDocument() async {
      var jsonText = await rootBundle.loadString('assets/json/tipoDocumento.json');
      print(jsonText);
      data = empresaModelFromJson(jsonText);
      listarDocumento(data);
  }

  void listarDocumento(categorias) {
    listDocument.clear();
    print("FOR CATEGORIAS");
    for (var item in categorias) {
        listDocument.add(
          DropdownMenuItem(
            child: Text(item.name),
            value: item.name,
            onTap: (){
              print('GUARDANDO ID');
              idDocumento = item.id;
            },
          )
        );
    }
    Loading().hide();
    update();
  }
  Future<void> startBarcodeScanStream() async {
    String barcodeScanRes;
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          '#ff6666', 'Cancel', true, ScanMode.BARCODE);
      print(barcodeScanRes);

      validacion(barcodeScanRes);
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
  }

  void validacion(String dataBarcode) {
    nombreController.text = '';
    segNombreController.text = '';
    apellidoController.text = '';
    segApellidoController.text = '';
    documentController.text = '';
    print('entro a validacion');
    var filtroTemp = dataBarcode.replaceAll(RegExp(r'�'), ',');
    var filtro1 = filtroTemp.replaceAll(RegExp(r' '), ',');

    if (dataBarcode.contains(RegExp(r'�'))) {
      print('entro a if validar ?');
      filtroTemp = dataBarcode.replaceAll(RegExp(r'�'), ',');
      filtro1 = filtroTemp.replaceAll(RegExp(r' '), ',');
    } else {
      print('entro a else validar ?');
      nombreController.text = 'Error';
      segNombreController.text = 'Error';
      apellidoController.text = 'Error';
      segApellidoController.text = 'Error';
      documentController.text = 'Error';
    }
    var filtro2 = filtro1.split('-');
    print('1 filtro2');
    print(filtro2);
    List<String> lista = [];

    var data = filtro2[0].split(',');
    print('2 data');
    print(data);

    for (var item in data) {
      if (item != '') {
        lista.add(item);
      }
    }
    print('3 lista');
    print(lista);
    print('Printing lenght');
    print(lista.length);
    if (lista.length < 10) {
      print('4 if lista inicio');
      var numero = lista[2].replaceAll(RegExp(r'\D'), '');
      print(numero);
      var numeroCorto = numero.substring(0, 9);
      print(numeroCorto);
      var validarNumero = numeroCorto.contains('0');
      print(validarNumero);

      if (validarNumero) {
        documentController.text = numero.substring(10);
      } else {
        documentController.text = numero.substring(8);
      }

      apellidoController.text = lista[2].replaceAll(RegExp(r'\d'), '');
      apellidoController.text = lista[3];
      nombreController.text = lista[4];
      print('4 if lista');
      print(apellidoController.text);
      print(apellidoController.text);
      print(nombreController.text);
    } else {
      print('4 else lista inicio');
      var numero = lista[3].replaceAll(RegExp(r'\D'), '');
      print(numero);
      var numeroCorto = numero.substring(0, 10);
      print('numeroCorto');
      print(numeroCorto);
      var validarNumero = numeroCorto.contains('0');
        print(validarNumero);

      if (validarNumero) {
        print('entro if vl num');
        // documentController.text = numero.substring(10);
        documentController.text = numero;
        apellidoController.text = lista[3].substring(10);
        print(documentController.text);
      } else {
        print('entro if vl num');
        // documentController.text = numero.substring(8);
        documentController.text = numero;
        apellidoController.text = lista[3].substring(8);
        print(documentController.text);
      }

      // apellidoController.text = lista[2].replaceAll(RegExp(r'\d'), '');
      // segApellidoController.text = lista[3];
      // nombreController.text = lista[4];
      // segNombreController.text = lista[5];

      // apellidoController.text = lista[2].replaceAll(RegExp(r'\d'), '');
      segApellidoController.text = lista[4];
      nombreController.text = lista[5];
      segNombreController.text = lista[6];
      var temp = lista[7].substring(0,10);
      print("fechaaaa temppppp");
      print(temp);
      fechaController.text = temp.substring(2);
      print('fecha finaaaaaaallll');
      print(fechaController.text);

      var edad = fechaController.text.substring(0,4);
      print('EDADDDDDDD');
      print(edad);

      edadController.text = (2022 - int.parse(edad)).toString();

      print(edadController.text);

      print('4 else lista toda');
      print(apellidoController.text);
      print(segApellidoController.text);
      print(nombreController.text);
      print(segNombreController.text);
    }
  }

  siguiente(){
    Get.toNamed('/residencia');
  }

}