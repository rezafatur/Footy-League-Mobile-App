class Continental {
  final String image;
  final String name;
  final String code;

  Continental({
    required this.image,
    required this.name,
    required this.code,
  });
}

List<Continental> continentalContents = [
  Continental(
    image: "assets/images/continentalUCL.png",
    name: "UEFA Champions Leagues",
    code: "CL",
  ),
  Continental(
    image: "assets/images/continentalLibertadores.png",
    name: "CONMEBOL Copa Libertadores",
    code: "CLI",
  ),
];
