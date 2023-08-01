import 'package:footy_league/app/modules/continentalAll/bindings/continental_all_binding.dart';
import 'package:footy_league/app/modules/continentalAll/views/continental_all_view.dart';
import 'package:footy_league/app/modules/domesticAll/bindings/domestic_all_binding.dart';
import 'package:footy_league/app/modules/domesticAll/views/domestic_all_view.dart';
import 'package:footy_league/app/modules/home/bindings/home_binding.dart';
import 'package:footy_league/app/modules/home/views/home_view.dart';
import 'package:footy_league/app/modules/information/bindings/information_binding.dart';
import 'package:footy_league/app/modules/information/views/information_view.dart';
import 'package:footy_league/app/modules/internationalAll/bindings/international_all_binding.dart';
import 'package:footy_league/app/modules/internationalAll/views/international_all_view.dart';
import 'package:footy_league/app/modules/onboarding/bindings/onboarding_binding.dart';
import 'package:footy_league/app/modules/onboarding/views/onboarding_view.dart';
import 'package:footy_league/app/modules/profile/bindings/profile_binding.dart';
import 'package:footy_league/app/modules/profile/views/profile_view.dart';
import 'package:footy_league/app/modules/searching/bindings/searching_binding.dart';
import 'package:footy_league/app/modules/searching/views/searching_view.dart';
import 'package:footy_league/app/modules/standings/bindings/standings_binding.dart';
import 'package:footy_league/app/modules/standings/views/standings_view.dart';
import 'package:get/get.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.ONBOARDING,
      page: () => const OnboardingView(),
      binding: OnboardingBinding(),
    ),
    GetPage(
      name: _Paths.INFORMATION,
      page: () => const InformationView(
        sourceRoute: "SOURCE ROUTE",
      ),
      binding: InformationBinding(),
    ),
    GetPage(
      name: _Paths.DOMESTIC_ALL,
      page: () => const DomesticAllView(
        sourceRoute: "SOURCE ROUTE",
      ),
      binding: DomesticAllBinding(),
    ),
    GetPage(
      name: _Paths.CONTINENTAL_ALL,
      page: () => const ContinentalAllView(
        sourceRoute: "Routes.HOME",
      ),
      binding: ContinentalAllBinding(),
    ),
    GetPage(
      name: _Paths.INTERNATIONAL_ALL,
      page: () => const InternationalAllView(
        sourceRoute: "Routes.HOME",
      ),
      binding: InternationalAllBinding(),
    ),
    GetPage(
      name: _Paths.SEARCHING,
      page: () => SearchingView(),
      binding: SearchingBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => ProfileView(),
      binding: ProfileBinding(),
      transition: Transition.fadeIn,
    ),
    GetPage(
      name: _Paths.STANDINGS,
      page: () => const StandingsView(
        code: "CODE",
        sourceRoute: "SOURCE ROUTE",
        backRoute: "BACK ROUTE",
      ),
      binding: StandingsBinding("CODE"),
    ),
  ];
}
