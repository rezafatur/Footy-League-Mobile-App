class Onboarding {
  final String title;
  final String description;
  final String image;

  Onboarding({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<Onboarding> onboardingContents = [
  Onboarding(
    title: "Welcome".toUpperCase(),
    description:
        "Step into the world of football excitement with up-to-date league fixtures.",
    image: "assets/images/onboarding1.png",
  ),
  Onboarding(
    title: "Scoreboard".toUpperCase(),
    description:
        "Get real time updates on the latest football league matches and scores.",
    image: "assets/images/onboarding2.png",
  ),
  Onboarding(
    title: "Matchday".toUpperCase(),
    description:
        "Discover the thrill of the game with up-to-date football league news and stats.",
    image: "assets/images/onboarding3.png",
  ),
  Onboarding(
    title: "Alerts".toUpperCase(),
    description:
        "Never miss a match and experience football like never before with our up-to-date league information and updates.",
    image: "assets/images/onboarding4.png",
  ),
];
