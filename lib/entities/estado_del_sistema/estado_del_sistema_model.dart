
import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class BoxGateDataModel {

  @JsonProperty(name: 'cerradura')
  final String? cerradura;

  @JsonProperty(name: 'puerta')
  final String? puerta;

  @JsonProperty(name: 'ultimaApertura')
  final String? ultimaApertura;

  @JsonProperty(name: 'duracion')
  final String? duracion;

  @JsonProperty(name: 'codigoCierre')
  final String? codigoCierre;

  @JsonProperty(name: 'estado')
  final String? estado;

  const BoxGateDataModel(this.cerradura, this.puerta, this.ultimaApertura,
      this.duracion, this.codigoCierre, this.estado);

  @override
  String toString() {
    return 'BoxGateDataModel{cerradura: $cerradura, puerta: $puerta, ultimaApertura: $ultimaApertura, duracion: $duracion, codigoCierre: $codigoCierre, estado: $estado}';
  }

  @override
  Map<String, dynamic> toJson() => {
    'cerradura': cerradura,
    'puerta': puerta,
    'ultimaApertura': ultimaApertura,
    'duracion': duracion,
    'codigoCierre': codigoCierre,
    'estado': estado,
  };

  @override
  factory BoxGateDataModel.fromJson(dynamic json){
    return BoxGateDataModel(
      (json['cerradura'] != null)?json['cerradura'] as String:null,
      (json['puerta'] != null)?json['puerta'] as String:null,
      (json['ultimaApertura'] != null)?json['ultimaApertura'] as String:null,
      (json['duracion'] != null)?json['duracion'] as String:null,
      (json['codigoCierre'] != null)?json['codigoCierre'] as String:null,
      (json['estado'] != null)?json['estado'] as String:null
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BoxGateDataModel &&
          runtimeType == other.runtimeType &&
          cerradura == other.cerradura &&
          puerta == other.puerta &&
          ultimaApertura == other.ultimaApertura &&
          duracion == other.duracion &&
          codigoCierre == other.codigoCierre &&
          estado == other.estado;

  @override
  int get hashCode =>
      cerradura.hashCode ^
      puerta.hashCode ^
      ultimaApertura.hashCode ^
      duracion.hashCode ^
      codigoCierre.hashCode ^
      estado.hashCode;
}
