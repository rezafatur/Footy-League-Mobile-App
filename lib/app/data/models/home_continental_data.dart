class Continental {
  final String image;
  final String code;

  Continental({
    required this.image,
    required this.code,
  });
}

List<Continental> continentalContents = [
  Continental(
    image: "assets/images/continentalUCL.png",
    code: "CL",
  ),
  Continental(
    image: "assets/images/continentalLibertadores.png",
    code: "CLI",
  ),
];
