import 'package:get/get.dart';
import '../modules/continentalAll/bindings/continental_all_binding.dart';
import '../modules/continentalAll/views/continental_all_view.dart';
import '../modules/domesticAll/bindings/domestic_all_binding.dart';
import '../modules/domesticAll/views/domestic_all_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/information/bindings/information_binding.dart';
import '../modules/information/views/information_view.dart';
import '../modules/internationalAll/bindings/international_all_binding.dart';
import '../modules/internationalAll/views/international_all_view.dart';
import '../modules/onboarding/bindings/onboarding_binding.dart';
import '../modules/onboarding/views/onboarding_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/searching/bindings/searching_binding.dart';
import '../modules/searching/views/searching_view.dart';

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
      page: () => const InformationView(),
      binding: InformationBinding(),
    ),
    GetPage(
      name: _Paths.DOMESTIC_ALL,
      page: () => const DomesticAllView(),
      binding: DomesticAllBinding(),
    ),
    GetPage(
      name: _Paths.CONTINENTAL_ALL,
      page: () => const ContinentalAllView(),
      binding: ContinentalAllBinding(),
    ),
    GetPage(
      name: _Paths.INTERNATIONAL_ALL,
      page: () => const InternationalAllView(),
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
  ];
}
