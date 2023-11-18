import 'dart:convert';

class Welcome {
  String greeting;
  List<Instruction> instructions;

  Welcome({
    required this.greeting,
    required this.instructions,
  });

  factory Welcome.fromRawJson(String str) => Welcome.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    greeting: json["greeting"],
    instructions: List<Instruction>.from(json["instructions"].map((x) => Instruction.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "greeting": greeting,
    "instructions": List<dynamic>.from(instructions.map((x) => x.toJson())),
  };
}

class Instruction {
  int geschwindigkeit;
  int drehzahl;
  int kmStand;
  double tankfuellstand;
  double motorTemperatur;
  double oeldruck;
  double spritVerbrauch;
  double ladedruck;
  String fahrgestellnummer;
  String name;

  Instruction({
    required this.geschwindigkeit,
    required this.drehzahl,
    required this.kmStand,
    required this.tankfuellstand,
    required this.motorTemperatur,
    required this.oeldruck,
    required this.spritVerbrauch,
    required this.ladedruck,
    required this.fahrgestellnummer,
    required this.name,
  });

  factory Instruction.fromRawJson(String str) => Instruction.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Instruction.fromJson(Map<String, dynamic> json) => Instruction(
    geschwindigkeit: json["geschwindigkeit"],
    drehzahl: json["drehzahl"],
    kmStand: json["kmStand"],
    tankfuellstand: json["tankfuellstand"],
    motorTemperatur: json["motorTemperatur"],
    oeldruck: json["oeldruck"]?.toDouble(),
    spritVerbrauch: json["spritVerbrauch"]?.toDouble(),
    ladedruck: json["ladedruck"]?.toDouble(),
    fahrgestellnummer: json["fahrgestellnummer"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "geschwindigkeit": geschwindigkeit,
    "drehzahl": drehzahl,
    "kmStand": kmStand,
    "tankfuellstand": tankfuellstand,
    "motorTemperatur": motorTemperatur,
    "oeldruck": oeldruck,
    "spritVerbrauch": spritVerbrauch,
    "ladedruck": ladedruck,
    "fahrgestellnummer": fahrgestellnummer,
    "name": name,
  };
}
