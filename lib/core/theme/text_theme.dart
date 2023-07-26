import 'package:flutter/material.dart';
import 'package:footy_league/core/theme/colors.dart';
import '../utils/size_configs.dart';

// Ukuran Font

// < 3.5 = Very Small
// 3.5 = Small
// 4 = Medium
// 4.5 = Medium Large
// 5 = Large
// 7 & 10 = Extra or Super Large

// Text with White Color (Large, Medium, and Small)
final textVerySmall300White = TextStyle(
  color: Colors.white,
  fontSize: SizeConfig.blockV! * 2,
  fontWeight: FontWeight.w300,
);

final textVerySmallBoldWhite = TextStyle(
  color: Colors.white,
  fontSize: SizeConfig.blockV! * 2,
  fontWeight: FontWeight.bold,
);

final textVerySmallBoldWhite5 = TextStyle(
  color: Colors.white,
  fontSize: SizeConfig.blockV! * 2.5,
  fontWeight: FontWeight.bold,
);

final textLargeBoldWhite = TextStyle(
  color: Colors.white,
  fontSize: SizeConfig.blockV! * 5,
  fontWeight: FontWeight.bold,
);

// Text with Dark Jungle Green Color (Large, Medium, and Small)
final textVerySmallDarkJGreen = TextStyle(
  color: darkJungleGreen,
  fontSize: SizeConfig.blockV! * 2,
  fontWeight: FontWeight.bold,
);

// Text with Green (RYB) Color (Large, Medium, and Small)
final textVerySmallGreenRYB = TextStyle(
  color: greenRYB,
  fontSize: SizeConfig.blockV! * 2,
  fontWeight: FontWeight.bold,
);
