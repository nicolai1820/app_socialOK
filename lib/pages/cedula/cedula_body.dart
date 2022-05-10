import 'package:app_social/pages/cedula/cedula_controller.dart';
import 'package:app_social/widget/auth_background.dart';
import 'package:app_social/widget/card_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:get/get_utils/src/extensions/widget_extensions.dart';
import 'package:search_choices/search_choices.dart';

class CedulaBody extends StatelessWidget {
  const CedulaBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CedulaController>(
        init: CedulaController(),
        builder: (_) {
          return AuthBackground(
            child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 250),
                CardContainer(
                    child: Form(
                      key: _.changeFormKey,
                      child: Column(
                      children: [
                      SizedBox(height: 10),
                      Text('Datos de identificación', textAlign: TextAlign.center, style: TextStyle(
                        fontSize: 20
                      )),
                      ElevatedButton(
                        onPressed: (){
                          _.startBarcodeScanStream();

                        },
                        child: Text('Escanear cédula')
                      ),
                      SizedBox(height: 50),
                      _listDocument(),
                      SizedBox(height: 15),
                      inputs(context, _.documentController,'Documento'),
                      inputs(context, _.nombreController,'Nombre'),
                      inputs(context, _.segNombreController,'Segundo nombre'),
                      inputs(context, _.apellidoController,'Apellido'),
                      inputs(context, _.segApellidoController,'Segundo apellido'),
                      inputs(context, _.fechaController,'Fecha'),
                      inputs(context, _.edadController,'Edad'),
                      SizedBox(height: 50),
                      SizedBox(
                        width: size.width * 0.6,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            primary: Colors.grey[400],
                            side: BorderSide.none
                          ),
                          onPressed: (){
                            _.siguiente();
                          }, 
                          child: const Text('Siguiente')
                        ),
                      ),
                      SizedBox(height: 50),
                  ],
                ),
                    )),
                SizedBox(height: 50),
              ],
            ),
          ));
        }
    );
  }

  Widget inputs(context,controller,String hintT){
    Size size = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
      width: size.width * 0.8,
      // height: 80,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(
                0.0,
                3.0,
              ),
              blurRadius: 5.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          borderRadius: BorderRadius.circular(5)
      ),
      child: TextFormField(
        onChanged: ( value ) => controller.text = value,
        validator: ( value ) {
          if ( value == null || value.length < 1 )
            return 'El campo es obligatorio'; 
        },
        controller: controller,
        decoration: InputDecoration(
          hintText: hintT,
          enabledBorder:InputBorder.none,
          focusedBorder:InputBorder.none,
        ),
      )
    ).marginOnly(bottom: 10.0);
  }
}

class _listDocument extends StatelessWidget {
  const _listDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CedulaController>(
      init: CedulaController(),
      builder: (_){
        return Container(
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          padding: EdgeInsets.all(5),
          width: size.width * 0.8,
          // height: 80,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(
                    0.0,
                    3.0,
                  ),
                  blurRadius: 5.0,
                  spreadRadius: 0.0,
                ), //BoxShadow
              ],
              borderRadius: BorderRadius.circular(5)),
          child: SearchChoices.single(
            doneButton: null,
            closeButton: "Cerrar",
            underline: const SizedBox(),
            // disabledHint: true,
            iconEnabledColor: Colors.grey[900],
            // iconSize: 10,
            displayClearIcon: true,
            items: _.listDocument,
            value: _.valueOrigen.value,
            hint: "Tipo de documento",
            searchHint: "Escoge tipo de documento",
            onChanged: (value) {
              if (value == null) {
                _.valueOrigen.value = "";
              } else {
                _.valueOrigen.value = value;
              }
            },
            selectedValueWidgetFn: (item) {
              return (Text(_.valueOrigen.value));
            },
            dialogBox: true,
          ),
        );
      });
  }
}