class Explore {
  final String image;
  final String name;
  final String code;

  Explore({
    required this.image,
    required this.name,
    required this.code,
  });
}

List<Explore> exploreContents = [
  Explore(
    image: "assets/images/explore1.png",
    name: "English Premier League",
    code: "PL",
  ),
  Explore(
    image: "assets/images/explore2.png",
    name: "Serie A",
    code: "SA",
  ),
  Explore(
    image: "assets/images/explore3.png",
    name: "UEFA Champions League",
    code: "CL",
  ),
  Explore(
    image: "assets/images/explore4.png",
    name: "FIFA World Cup",
    code: "WC",
  ),
];
