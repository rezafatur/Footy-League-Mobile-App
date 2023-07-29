class International {
  final String image;
  final String name;
  final String code;

  International({
    required this.image,
    required this.name,
    required this.code,
  });
}

List<International> internationalContents = [
  International(
    image: "assets/images/internationalWC.png",
    name: "FIFA World Cup",
    code: "WC",
  ),
  International(
    image: "assets/images/internationalEC.png",
    name: "European Championship",
    code: "EC",
  ),
];
