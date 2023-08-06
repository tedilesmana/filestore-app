import 'package:flutter/material.dart';

class MyTheme {
  static const String appName = "FileStore";
  static const String appVersion = "v. 1.2.1";

  static String hiveBoxName = "fileStoreSBox";
  static String fcmTopicName = "fileStoreTopic";
  static String serverKeyFCM =
      'AAAAInjYsHU:APA91bEirGDQHM1Vdp64CH45KCIEzPXh871At1mOibQpE4hB3uXXWwq7iWPDg-fC9RcKSq0d52LnYH9reILWokvDsqzjL6dFEuzm7MTOgFJ-movuUgcp1p3pQbzTUaKnx9hf3X_xEOg-';

  static String urlTermService = 'https://termify.io/privacy-policy-generator';
  static String urlPolicy = 'https://termify.io/privacy-policy-generator';
  static const String webSite = "https://erhacorp.id/";

  // ----------------- preference box hive -------------
  static String prefDarkName = "darkmode";
  static String prefLangName = "langname";
  static String prefFirstTime = "firsttime";
  static String prefLogin = "loginkey";
  static String prefUuid = "uuidkey";
  static String prefInstall = "installkey";

  static String prefLatitude = "latitudekey";
  static String prefLocation = "locationkey";
  static String prefCountry = "countrykey";

  static String prefTokenFCM = "tokenFCMkey";
  static String prefMember = "memberkey";
  static String prefHome = "homekey";
  static String prefMyhobb = "myhobbkey";

  static String prefOnChat = "onchatkey";
  static String prefOnChatScreen = "onchatscreenkey";
  // ----------------- preference box hive -------------

  // file uploaded reference
  static String image1 = "Image";
  static String image2 = "Image2";
  static String image3 = "Image3";

  // max comment on post data view
  static int maxViewComment = 5;
  static int pagePaging = 50; // 30 row per page
  static String pageLimit = "0,50"; // limit paging push

  // ----------------- color style -------------
  static Color background = const Color(0xfffbfbfb);
  static Color accent = const Color(0xff2776d2);
  static Color lightBlue = const Color.fromRGBO(143, 148, 251, 1);
  static Color gradient1 = const Color(0xfff6f6f6);
  static Color gradient2 = const Color(0xfff0f0f0);
  static Color gradient3 = const Color(0xffeeeeee);
  static Color gradient4 = const Color(0xffe0e0e0);

  static Color backgroundWidget = const Color(0xffffffff);
  static Color grey = const Color(0xfff5f5f5);
  static Color greyText = const Color(0xffe0e0e0);
  static Color greyText2 = const Color(0xffacacac);
  // ----------------- color style -------------
}

// ------------ other style ------------------

const EdgeInsets paddingHome =
    EdgeInsets.symmetric(horizontal: 25, vertical: 10);
const EdgeInsets paddingList =
    EdgeInsets.symmetric(horizontal: 20, vertical: 10);
const EdgeInsets padding20 = EdgeInsets.symmetric(horizontal: 20, vertical: 20);
const EdgeInsets padding10 = EdgeInsets.symmetric(horizontal: 10, vertical: 10);
const EdgeInsets padding15 = EdgeInsets.symmetric(horizontal: 15, vertical: 10);
const EdgeInsets padding205 = EdgeInsets.only(left: 20, right: 15);
const EdgeInsets padding200 =
    EdgeInsets.symmetric(horizontal: 20, vertical: 10);
const EdgeInsets paddingAll =
    EdgeInsets.symmetric(horizontal: 10, vertical: 10);
const EdgeInsets padding20Only =
    EdgeInsets.symmetric(horizontal: 20, vertical: 0);
const EdgeInsets paddingHr10 = EdgeInsets.symmetric(horizontal: 10);
const EdgeInsets paddingRo10 = EdgeInsets.only(left: 10, right: 5);
const EdgeInsets padding5 = EdgeInsets.all(5);
const EdgeInsets padding8 = EdgeInsets.all(8);

const TextStyle textBold = TextStyle(fontWeight: FontWeight.bold);
const TextStyle textSmall = TextStyle(fontSize: 11);
const TextStyle textSmallGrey = TextStyle(fontSize: 12, color: Colors.grey);
const TextStyle styleBlackBold = TextStyle(
  height: 1.5,
  fontSize: 14,
  color: Colors.black,
  fontWeight: FontWeight.w800,
);

const TextStyle styleBlackSmall = TextStyle(
  height: 1.5,
  fontSize: 9,
  color: Colors.black,
);

const TextStyle styleWhiteSmall = TextStyle(
  height: 1.5,
  fontSize: 11,
  color: Colors.white,
  fontWeight: FontWeight.w800,
);

const TextStyle styleBlack = TextStyle(
  height: 1.5,
  fontSize: 14,
  color: Colors.black,
);

const TextStyle styleTitleBig = TextStyle(
  height: 1.5,
  fontSize: 18,
  fontWeight: FontWeight.w900,
);

const SizedBox spaceHeight5 = SizedBox(height: 5);
const SizedBox spaceHeight10 = SizedBox(height: 10);
const SizedBox spaceHeight15 = SizedBox(height: 15);
const SizedBox spaceHeight20 = SizedBox(height: 20);
const SizedBox spaceHeight50 = SizedBox(height: 50);

SizedBox spaceWidth5 = const SizedBox(width: 5);
SizedBox spaceWidth10 = const SizedBox(width: 10);
SizedBox spaceWidth15 = const SizedBox(width: 15);
SizedBox spaceWidth20 = const SizedBox(width: 20);
SizedBox spaceWidth50 = const SizedBox(width: 50);

BoxDecoration boxDecorationGradient = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      MyTheme.background,
      MyTheme.gradient1,
      MyTheme.gradient2,
    ],
  ),
);

BoxDecoration boxDecorationGradientDark = BoxDecoration(
  gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      MyTheme.gradient1,
      MyTheme.gradient2,
      MyTheme.gradient3,
    ],
  ),
);

BoxDecoration boxDecorationDefault = const BoxDecoration(
  borderRadius: BorderRadius.all(
    Radius.circular(10),
  ),
);
