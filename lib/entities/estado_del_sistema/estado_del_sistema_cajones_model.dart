import 'dart:convert';

import 'package:dart_json_mapper/dart_json_mapper.dart';

@jsonSerializable
class DrawersDataModel {
  @JsonProperty(name: 'cerradura')
  final String? cerradura;

  @JsonProperty(name: 'ultimoCajonAbierto')
  final String? ultimoCajonAbierto;

  @JsonProperty(name: 'ultimaApertura')
  final String? ultimaApertura;

  @JsonProperty(name: 'duracion')
  final String? duracion;

  @JsonProperty(name: 'codigoCierre')
  final String? codigoCierre;

  @JsonProperty(name: 'estado')
  final String? estado;

  const DrawersDataModel(this.cerradura, this.ultimoCajonAbierto, this.ultimaApertura,
      this.duracion, this.codigoCierre, this.estado);

  @override
  String toString() {
    return 'DrawersDataModel{cerradura: $cerradura, ultimoCajonAbierto: $ultimoCajonAbierto, ultimaApertura: $ultimaApertura, duracion: $duracion, codigoCierre: $codigoCierre, estado: $estado}';
  }
  @override
  Map<String, dynamic> toJson() => {
    'cerradura': cerradura,
    'ultimoCajonAbierto': ultimoCajonAbierto,
    'ultimaApertura': ultimaApertura,
    'duracion': duracion,
    'codigoCierre': codigoCierre,
    'estado': estado,
  };
  @override
  factory DrawersDataModel.fromJson(dynamic json){
    return DrawersDataModel(
        (json['cerradura'] != null)?json['cerradura'] as String:null,
        (json['ultimoCajonAbierto'] != null)?json['ultimoCajonAbierto'] as String:null,
        (json['ultimaApertura'] != null)?json['ultimaApertura'] as String:null,
        (json['duracion'] != null)?json['duracion'] as String:null,
        (json['codigoCierre'] != null)?json['codigoCierre'] as String:null,
        (json['estado'] != null)?json['estado'] as String:null
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DrawersDataModel &&
          runtimeType == other.runtimeType &&
          cerradura == other.cerradura &&
          ultimoCajonAbierto == other.ultimoCajonAbierto &&
          ultimaApertura == other.ultimaApertura &&
          duracion == other.duracion &&
          codigoCierre == other.codigoCierre &&
          estado == other.estado;

  @override
  int get hashCode =>
      cerradura.hashCode ^
      ultimoCajonAbierto.hashCode ^
      ultimaApertura.hashCode ^
      duracion.hashCode ^
      codigoCierre.hashCode ^
      estado.hashCode;
}