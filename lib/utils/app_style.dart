import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

const Color kBrown = Color(0xff292526);
const Color kDrakBrown = Color(0xff1b2028);
const Color kGrey = Color(0xffa4aaad);
const Color kDarkGrey = Color(0xff878787);


const double KBoderRadius = 12.0;
const double kPaddingHorizontal = 24.0;

final kInputBoder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(KBoderRadius),
  borderSide: const BorderSide(
    color: kDarkGrey
  )
);

final  kEncodeSansBold = GoogleFonts.encodeSans(
  fontWeight: FontWeight.w700
);

final  kEncodeSansSemiBold = GoogleFonts.encodeSans(
    fontWeight: FontWeight.w600
);

final  kEncodeSansMedium = GoogleFonts.encodeSans(
    fontWeight: FontWeight.w500
);

final  kEncodeSansRagular = GoogleFonts.encodeSans(
    fontWeight: FontWeight.w400
);