class Explore {
  final String image;
  final String leagueName;

  Explore({
    required this.image,
    required this.leagueName,
  });
}

List<Explore> exploreContents = [
  Explore(
    image: "assets/images/explore1.png",
    leagueName: "Premier League",
  ),
  Explore(
    image: "assets/images/explore2.png",
    leagueName: "Serie A",
  ),
  Explore(
    image: "assets/images/explore3.png",
    leagueName: "Champions League",
  ),
  Explore(
    image: "assets/images/explore4.png",
    leagueName: "World Cup",
  ),
];
