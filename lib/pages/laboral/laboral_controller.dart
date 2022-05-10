import 'package:app_social/components/loading.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LaboralController extends GetxController {
  final GlobalKey<FormState> changeFormKey = GlobalKey<FormState>();

  final ocupacionController = TextEditingController();
  final ingresoDateController = TextEditingController();
  final cargoController = TextEditingController();
  final horasTraCntroller = TextEditingController();
  final slarioController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
  }

  siguiente(){
    Loading().success('Datos enviado con éxito');
    Get.toNamed('/selectEmpresa');
  }

}