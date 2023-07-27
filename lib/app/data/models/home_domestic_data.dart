class Domestic {
  final String image;
  final String name;
  final String code;

  Domestic({
    required this.image,
    required this.name,
    required this.code,
  });
}

List<Domestic> domesticContents = [
  Domestic(
    image: "assets/images/domesticPL.png",
    name: "English Premier League",
    code: "PL",
  ),
  Domestic(
    image: "assets/images/domesticLaLiga.png",
    name: "LaLiga EA Sports FC",
    code: "PD",
  ),
  Domestic(
    image: "assets/images/domesticSerieA.png",
    name: "Serie A",
    code: "SA",
  ),
  Domestic(
    image: "assets/images/domesticBundesliga.png",
    name: "Bundesliga",
    code: "BL1",
  ),
  Domestic(
    image: "assets/images/domesticEredivisie.png",
    name: "Eredivisie",
    code: "DED",
  ),
  Domestic(
    image: "assets/images/domesticLigue1.png",
    name: "Ligue 1",
    code: "FL1",
  ),
  Domestic(
    image: "assets/images/domesticLigaPortugal.png",
    name: "Liga Portugal BWIN",
    code: "PPL",
  ),
  Domestic(
    image: "assets/images/domesticChampionship.png",
    name: "Sky Bet Championship",
    code: "ELC",
  ),
  Domestic(
    image: "assets/images/domesticBrasileiroSérieA.png",
    name: "Campeonato Brasileiro Serie A",
    code: "BSA",
  ),
];
