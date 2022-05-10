import 'package:app_social/pages/cedula/cedula_body.dart';
import 'package:app_social/pages/complementario/complementario_body.dart';
import 'package:app_social/pages/datosResidencia/residencia_body.dart';
import 'package:app_social/pages/laboral/laboral_body.dart';
import 'package:app_social/pages/saludypension/saludypension_body.dart';
import 'package:app_social/pages/selectempresa/selectEmpresa_body.dart';
import 'package:get/route_manager.dart';

import 'package:get/get.dart';

getApplicationRoutes() {
  return [
    GetPage(name: '/selectEmpresa', page: () => SelectEmpresaBody()),
    GetPage(name: '/saludypension', page: () => SaludyPensionBody()),
    GetPage(name: '/cedula', page: () => CedulaBody()),
    GetPage(name: '/residencia', page: () => ResidenciaBody()),
    GetPage(name: '/complementario', page: () => ComplementarioBody()),
    GetPage(name: '/laboral', page: () => LaboralBody()),
  ];
}
