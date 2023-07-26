class International {
  final String image;
  final String code;

  International({
    required this.image,
    required this.code,
  });
}

List<International> internationalContents = [
  International(
    image: "assets/images/InternationalWorldCup.png",
    code: "WC",
  ),
  International(
    image: "assets/images/InternationalEURO.png",
    code: "EC",
  ),
];
