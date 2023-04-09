class JuegoModel {
  JuegoModel({
    required this.abreviatura,
    required this.activo,
    required this.descripcion,
    this.id,
    required this.name,
    required this.posiciones,
    required this.rangoMaximo,
    required this.rangoMinimo,
  });

  String abreviatura;
  bool activo;
  String descripcion;
  String? id;
  String name;
  int posiciones;
  int rangoMaximo;
  int rangoMinimo;

  factory JuegoModel.fromJson(Map<String, dynamic> json) => JuegoModel(
        abreviatura: json["abreviatura"],
        activo: json["activo"],
        descripcion: json["descripcion"],
        id: json["id"],
        name: json["name"],
        posiciones: json["posiciones"],
        rangoMaximo: json["rango_maximo"],
        rangoMinimo: json["rango_minimo"],
      );

  Map<String, dynamic> toJson() => {
        "abreviatura": abreviatura,
        "activo": activo,
        "descripcion": descripcion,
        "id": id,
        "name": name,
        "posiciones": posiciones,
        "rango_maximo": rangoMaximo,
        "rango_minimo": rangoMinimo,
      };
}
