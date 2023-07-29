import 'package:flutter/material.dart';
import 'package:footy_league/app/data/models/home_continental_data.dart';
import 'package:footy_league/app/data/models/home_domestic_data.dart';
import 'package:footy_league/app/data/models/home_explore_data.dart';
import 'package:footy_league/app/data/models/home_international_data.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final contentsExplore = <Explore>[];
  final contentsDomestic = <Domestic>[];
  final contentsContinental = <Continental>[];
  final contentsInternational = <International>[];

  HomeController() {
    contentsExplore.addAll(exploreContents);
    contentsDomestic.addAll(domesticContents);
    contentsContinental.addAll(continentalContents);
    contentsInternational.addAll(internationalContents);
  }

  List<Explore> get contentsE => contentsExplore;
  List<Domestic> get contentsD => contentsDomestic;
  List<Continental> get contentsC => contentsContinental;
  List<International> get contentsI => contentsInternational;

  final _currentExplorePage = 0.obs;
  int get currentExplorePage => _currentExplorePage.value;

  final _pageController = PageController();
  PageController get pageController => _pageController;

  void onPageChanged(int value) {
    _currentExplorePage.value = value;
  }
}
