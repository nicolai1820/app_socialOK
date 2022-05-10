import 'package:app_social/pages/saludypension/saludypension_controller.dart';
import 'package:app_social/widget/auth_background.dart';
import 'package:app_social/widget/card_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:search_choices/search_choices.dart';

class SaludyPensionBody extends StatelessWidget {
  const SaludyPensionBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SaludyPensionController>(
      init: SaludyPensionController(),
      builder: (_){
        return AuthBackground(
            child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 250),
                CardContainer(
                    child: Column(
                    children: [
                    SizedBox(height: 10),
                    Text('Seleccione seguridad social', textAlign: TextAlign.center, style: TextStyle(
                      fontSize: 20
                    )),
                    SizedBox(height: 50),
                    _ListSalud(),
                    SizedBox(height: 50),
                    _ListPension(),
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
                )),
                SizedBox(height: 50),
              ],
            ),
          ));
      }
    );
  }
}



class _ListSalud extends StatelessWidget {
  const _ListSalud({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SaludyPensionController>(
      init: SaludyPensionController(),
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
            items: _.listSalud,
            value: _.valueOrigen.value,
            hint: "EPS",
            searchHint: "Escoge la eps",
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



class _ListPension extends StatelessWidget {
  const _ListPension({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SaludyPensionController>(
      init: SaludyPensionController(),
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
            items: _.listPension,
            value: _.valueOrigenSub.value,
            hint: "Pensión",
            searchHint: "Escoge la pensión",
            onChanged: (value) {
              if (value == null) {
                _.valueOrigenSub.value = "";
              } else {
                _.valueOrigenSub.value = value;
              }
            },
            selectedValueWidgetFn: (item) {
              return (Text(_.valueOrigenSub.value));
            },
            dialogBox: true,
          ),
        );
      });
  }
}