import 'package:app_social/pages/complementario/complementario_controller.dart';
import 'package:app_social/widget/auth_background.dart';
import 'package:app_social/widget/card_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:search_choices/search_choices.dart';

class ComplementarioBody extends StatelessWidget {
  const ComplementarioBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<ComplementarioController>(
      init: ComplementarioController(),
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
                    Text('Datos complementarios', textAlign: TextAlign.center, style: TextStyle(
                      fontSize: 20
                    )),
                    SizedBox(height: 50),
                    _listObject(context, _.listEstado, _.valueOrigen,'Estado civil', 'Escoge estado civil'),
                    SizedBox(height: 5),
                    _listObject(context, _.listGenero, _.valueOrigenSub,'Género', 'Escoge Género'),
                    SizedBox(height: 5),
                    _listObject(context, _.listOrientacion, _.valueOrigenO,'Orientación', 'Escoge orientación'),
                    SizedBox(height: 5),
                    _listObject(context, _.listEscolaridad, _.valueOrigenE,'Nivel de escolaridad', 'Escoge escolaridad'),
                    SizedBox(height: 5),
                    _listObject(context, _.listVulnerabilidad, _.valueOrigenV,'Factor de vulnerabilidad', 'Escoge vulnerabilidad'),
                    SizedBox(height: 5),
                    _listObject(context, _.listEtnia, _.listEtnia,'Pertenencia étnica', 'Escoge pertenencia'),
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

  Widget _listObject(context, list, valueOn, hint,sHint){
    Size size = MediaQuery.of(context).size;
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
            items: list,
            value: valueOn,
            hint: hint,
            searchHint: sHint,
            onChanged: (value) {
              if (value == null) {
                valueOn = "";
              } else {
                valueOn = value;
              }
            },
            selectedValueWidgetFn: (item) {
              return (Text(valueOn));
            },
            dialogBox: true,
          ),
        );
  }
}