import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kingdoms_kids/widgets/aboutUsPage.dart';
import 'package:kingdoms_kids/widgets/choiceLanguageForMusic.dart';
import 'package:kingdoms_kids/widgets/choiceLanguageForSongs.dart';
import 'package:kingdoms_kids/widgets/counsellingPage.dart';
import 'package:kingdoms_kids/widgets/curriculumPage.dart';
import 'package:kingdoms_kids/widgets/resourcesPage.dart';
import 'package:kingdoms_kids/widgets/storePage.dart';

//  Slider Section
var arrSliderHeading = [
  'Stay Connected...',
  'Songs...',
  "Get Resources...",
  'Stay Stress Free...',
  'Book Slots...'
];
var arrSliderBody = [
  'Get Out Best Curriculum\nand Stay Always Connected\nto GOD.',
  'Get Latest Video and\nMusic Songs along\nwith Lyrics, Chords\nand Many More.',
  "Get All Resources of\nOurs, Like Story Books,\nWork Books and Many\nMore.",
  'Get 1X1 Best Counsellors\nfor Any Life Challenging\nProblem.',
  "Book Slots for All\nUpcoming Offline Resource's\nin Just One Click."
];
var arrSliderImages = [
  'assets/images/praying_lady.png',
  'assets/images/songs_music.png',
  'assets/images/resources_sliding.png',
  'assets/images/book_a_slot.png',
  'assets/images/book_slot.png',
];
String getSliderHeading(int index) {
  return arrSliderHeading[index];
}

int getSliderHeadingCount() {
  return arrSliderHeading.length;
}

String getSliderBody(int index) {
  return arrSliderBody[index];
}

int getSliderBodyCount() {
  return arrSliderBody.length;
}

String getSliderImages(int index) {
  return arrSliderImages[index];
}

int getSliderImagesCount() {
  return arrSliderImages.length;
}

// Tail Section
var arrTailImages = [
  'assets/images/curriculum.png',
  'assets/images/resources_tail.png',
  'assets/images/music_tail.png',
  'assets/images/songs_tail.png',
  'assets/images/counsellor_tail.png',
  'assets/images/book_slot_tail.png',
  'assets/images/store_tail.png',
  'assets/images/about_us_tail.png',
  'assets/images/exit_tail.png'
];
var arrTailText = [
  'Curriculum',
  'Resources',
  'Music',
  'Songs',
  'Counselling',
  'Book Slot',
  'Store',
  'About Us',
  'Exit'
];
String getTailImage(int index) {
  return arrTailImages[index];
}

String getTailText(int index) {
  return arrTailText[index];
}

void getTailMethods(BuildContext context, int index) {
  var arr = [
    Curriculum,
    Resources,
    Music,
    Songs,
    Counselling,
    BookSlot,
    Store,
    AboutUs,
    Exit,
  ];
  arr[index](context);
}

int selectedLanguage = -1;

// Tail Methods
void Curriculum(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return CurriculumPage();
      },
    ),
  );
}

void Resources(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const ResourcesPage();
      },
    ),
  );
}

void Music(BuildContext context) {
  if (selectedLanguage == -1) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return ChoiceLanguageForMusic();
        },
      ),
    );
  } else {
    Navigator.pushNamed(
      context,
      'musicPlayer',
      arguments: passedArguments(index: selectedLanguage),
    );
  }
}

void Songs(BuildContext context) {
  if (selectedLanguage == -1) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) {
          return const ChoiceLanguageForSongs();
        },
      ),
    );
  } else {
    Navigator.pushNamed(
      context,
      'videoPlayer',
      arguments: passedArguments(index: selectedLanguage),
    );
  }
}

void Counselling(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return const CounsellingPage();
    },
  ));
}

void BookSlot(BuildContext context) {}
void Store(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return const StorePage();
    },
  ));
}

void AboutUs(BuildContext context) {
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) {
        return const AboutUsPage();
      },
    ),
  );
}

void Exit(BuildContext context) {
  exit(0);
}

// Curriculum Resources
// 3Years Curriculum

var arr3YearsCurriculum = <String, String>{
  'Validity Data':
      'https://www.ets.org/Media/Tests/GRE/pdf/gre_research_validity_data.pdf',
  'Sample PDF':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf1_12mb_6pages.pdf',
  'Sample PDF 1':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_1.73Mb_87_Page.pdf',
  'Sample PDF 2':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SAMPLE_42mb_76_Pages.pdf',
  'Sample PDF 3':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_477kb_1page.pdf',
  'Sample PDF 4':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_74kb_2_page.pdf',
  'Sample PDF 5':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_61kb_1page.pdf'
};
String get3YearsCurriculumLink(int index) {
  return arr3YearsCurriculum.values.toList()[index];
}

int get3yearsCurriculumCount() {
  return arr3YearsCurriculum.length;
}

String get3yearsCurriculumName(int index) {
  return arr3YearsCurriculum.keys.toList()[index];
}

var arrOutdoorCurriculum = <String, String>{
  'Validity Data':
      'https://www.ets.org/Media/Tests/GRE/pdf/gre_research_validity_data.pdf',
  'Sample PDF':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf1_12mb_6pages.pdf',
  'Sample PDF 1':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_1.73Mb_87_Page.pdf',
  'Sample PDF 2':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SAMPLE_42mb_76_Pages.pdf',
  'Sample PDF 3':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_477kb_1page.pdf',
  'Sample PDF 4':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_74kb_2_page.pdf',
  'Sample PDF 5':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_61kb_1page.pdf'
};
String getOutdoorCurriculumLink(int index) {
  return arrOutdoorCurriculum.values.toList()[index];
}

int getOutdoorCurriculumCount() {
  return arrOutdoorCurriculum.length;
}

String getOutdoorCurriculumName(int index) {
  return arrOutdoorCurriculum.keys.toList()[index];
}

var arrSeasonalCurriculum = <String, String>{
  'Validity Data':
      'https://www.ets.org/Media/Tests/GRE/pdf/gre_research_validity_data.pdf',
  'Sample 11 PDF':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf1_12mb_6pages.pdf',
  'Sample PDF 1':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_1.73Mb_87_Page.pdf',
  'Sample PDF 2':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SAMPLE_42mb_76_Pages.pdf',
  'Sample PDF 3':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_477kb_1page.pdf',
  'Sample PDF 4':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_74kb_2_page.pdf',
  'Sample PDF 5':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_61kb_1page.pdf'
};
String getSeasonalCurriculumLink(int index) {
  return arrSeasonalCurriculum.values.toList()[index];
}

int getSeasonalCurriculumCount() {
  return arrSeasonalCurriculum.length;
}

String getSeasonalCurriculumName(int index) {
  return arrSeasonalCurriculum.keys.toList()[index];
}

var arrVBSCurriculum = <String, String>{
  'Validity Data':
      'https://www.ets.org/Media/Tests/GRE/pdf/gre_research_validity_data.pdf',
  'Sample PDF':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf1_12mb_6pages.pdf',
  'Sample PDF 1':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_1.73Mb_87_Page.pdf',
  'Sample PDF 2':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SAMPLE_42mb_76_Pages.pdf',
  'Sample PDF 3':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_477kb_1page.pdf',
  'Sample PDF 4':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_74kb_2_page.pdf',
  'Sample PDF 5':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_61kb_1page.pdf'
};
String getVBSCurriculumLink(int index) {
  return arrVBSCurriculum.values.toList()[index];
}

int getVBSCurriculumCount() {
  return arrVBSCurriculum.length;
}

String getVBSCurriculumName(int index) {
  return arrVBSCurriculum.keys.toList()[index];
}

// Resource Section
// Objective Lessons
var arrObjectiveLesson = <String, String>{
  'Validity Data':
      'https://www.ets.org/Media/Tests/GRE/pdf/gre_research_validity_data.pdf',
  'Sample PDF':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf1_12mb_6pages.pdf',
  'Sample PDF 1':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_1.73Mb_87_Page.pdf',
  'Sample PDF 2':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SAMPLE_42mb_76_Pages.pdf',
  'Sample PDF 3':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_477kb_1page.pdf',
  'Sample PDF 4':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_74kb_2_page.pdf',
  'Sample PDF 5':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_61kb_1page.pdf'
};
// Craft
var arrCraft = <String, String>{
  'Validity Data':
      'https://www.ets.org/Media/Tests/GRE/pdf/gre_research_validity_data.pdf',
  'Sample PDF':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf1_12mb_6pages.pdf',
  'Sample PDF 1':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_1.73Mb_87_Page.pdf',
  'Sample PDF 2':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SAMPLE_42mb_76_Pages.pdf',
  'Sample PDF 3':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_477kb_1page.pdf',
  'Sample PDF 4':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_74kb_2_page.pdf',
  'Sample PDF 5':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_61kb_1page.pdf'
};
// Experiments
var arrExperiments = <String, String>{
  'Validity Data':
      'https://www.ets.org/Media/Tests/GRE/pdf/gre_research_validity_data.pdf',
  'Sample PDF':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf1_12mb_6pages.pdf',
  'Sample PDF 1':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_1.73Mb_87_Page.pdf',
  'Sample PDF 2':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SAMPLE_42mb_76_Pages.pdf',
  'Sample PDF 3':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_477kb_1page.pdf',
  'Sample PDF 4':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_74kb_2_page.pdf',
  'Sample PDF 5':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_61kb_1page.pdf'
};
// Games
var arrGames = <String, String>{
  'Validity Data':
      'https://www.ets.org/Media/Tests/GRE/pdf/gre_research_validity_data.pdf',
  'Sample PDF':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf1_12mb_6pages.pdf',
  'Sample PDF 1':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_1.73Mb_87_Page.pdf',
  'Sample PDF 2':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SAMPLE_42mb_76_Pages.pdf',
  'Sample PDF 3':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_477kb_1page.pdf',
  'Sample PDF 4':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_74kb_2_page.pdf',
  'Sample PDF 5':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_61kb_1page.pdf'
};
// Skit Script
var arrSkitScript = <String, String>{
  'Validity SS Data':
      'https://www.ets.org/Media/Tests/GRE/pdf/gre_research_validity_data.pdf',
  'Sample PDF':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf1_12mb_6pages.pdf',
  'Sample PDF 1':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_1.73Mb_87_Page.pdf',
  'Sample PDF 2':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SAMPLE_42mb_76_Pages.pdf',
  'Sample PDF 3':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_477kb_1page.pdf',
  'Sample PDF 4':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_74kb_2_page.pdf',
  'Sample PDF 5':
      'https://www.appsloveworld.com/wp-content/uploads/2020/01/SamplePdf_61kb_1page.pdf'
};

enum ResourceTypes {
  Objective_Lesson,
  Craft_Books,
  Experiments,
  Games,
  Skit_Script,
}

int getResourcesCount(ResourceTypes res) {
  switch (res) {
    case ResourceTypes.Objective_Lesson:
      return arrObjectiveLesson.length;
    case ResourceTypes.Craft_Books:
      return arrCraft.length;
    case ResourceTypes.Experiments:
      return arrExperiments.length;
    case ResourceTypes.Games:
      return arrGames.length;
    case ResourceTypes.Skit_Script:
      return arrSkitScript.length;
  }
}

String getResourcesName(ResourceTypes res, int index) {
  switch (res) {
    case ResourceTypes.Objective_Lesson:
      return arrObjectiveLesson.keys.toList()[index];
    case ResourceTypes.Craft_Books:
      return arrCraft.keys.toList()[index];
    case ResourceTypes.Experiments:
      return arrExperiments.keys.toList()[index];
    case ResourceTypes.Games:
      return arrGames.keys.toList()[index];
    case ResourceTypes.Skit_Script:
      return arrSkitScript.keys.toList()[index];
  }
}

Map<String, String> getResourcesMap(ResourceTypes res) {
  switch (res) {
    case ResourceTypes.Objective_Lesson:
      return arrObjectiveLesson;
    case ResourceTypes.Craft_Books:
      return arrCraft;
    case ResourceTypes.Experiments:
      return arrExperiments;
    case ResourceTypes.Games:
      return arrGames;
    case ResourceTypes.Skit_Script:
      return arrSkitScript;
  }
}

// Counselling Content
var CounsellingTypes = <String>[
  'Health',
  'Relationship',
  'Career',
  'Study',
  'Finance',
];

// Store Content
class StoreDetails {
  var name, address, imgPath, phoneNo;
  StoreDetails({
    required this.name,
    required this.address,
    required this.imgPath,
    required this.phoneNo,
  });
}

var arrStore = [
  StoreDetails(
    name: 'Om Sai',
    address: 'Bengaluru',
    imgPath:
        'https://cdn.pixabay.com/photo/2014/04/03/00/42/house-309156_960_720.png',
    phoneNo: "123456789",
  ),
  StoreDetails(
    name: 'Bhagwati Store',
    address: 'Kolkata',
    imgPath:
        'https://cdn.pixabay.com/photo/2014/04/03/00/42/house-309156_960_720.png',
    phoneNo: "9023119922",
  ),
  StoreDetails(
    name: 'Sonic Store',
    address: 'Maharashtra',
    imgPath:
        'https://cdn.pixabay.com/photo/2014/04/03/00/42/house-309156_960_720.png',
    phoneNo: "9089786756",
  ),
  StoreDetails(
    name: 'Maruti Store',
    address: 'Delhi',
    imgPath:
        'https://cdn.pixabay.com/photo/2014/04/03/00/42/house-309156_960_720.png',
    phoneNo: "9342689564",
  ),
  StoreDetails(
    name: 'Hello',
    address: 'Hi',
    imgPath:
        'https://cdn.pixabay.com/photo/2014/04/03/00/42/house-309156_960_720.png',
    phoneNo: "123456789",
  ),
  StoreDetails(
    name: 'Hello',
    address: 'Hi',
    imgPath:
        'https://cdn.pixabay.com/photo/2014/04/03/00/42/house-309156_960_720.png',
    phoneNo: "123456789",
  ),
  StoreDetails(
    name: 'Hello',
    address: 'Hi',
    imgPath:
        'https://cdn.pixabay.com/photo/2014/04/03/00/42/house-309156_960_720.png',
    phoneNo: "123456789",
  ),
  StoreDetails(
    name: 'Hello',
    address: 'Hi',
    imgPath:
        'https://cdn.pixabay.com/photo/2014/04/03/00/42/house-309156_960_720.png',
    phoneNo: "123456789",
  ),
  StoreDetails(
    name: 'Hello',
    address: 'Hi',
    imgPath:
        'https://cdn.pixabay.com/photo/2014/04/03/00/42/house-309156_960_720.png',
    phoneNo: "123456789",
  ),
  StoreDetails(
    name: 'Hello',
    address: 'Hi',
    imgPath:
        'https://cdn.pixabay.com/photo/2014/04/03/00/42/house-309156_960_720.png',
    phoneNo: "123456789",
  ),
  StoreDetails(
    name: 'Bakrey',
    address: 'Hi',
    imgPath:
        'https://cdn.pixabay.com/photo/2019/08/22/15/46/icon-4423853_960_720.png',
    phoneNo: "123456789",
  ),
  StoreDetails(
    name: 'Hello',
    address: 'Hi',
    imgPath:
        'https://cdn.pixabay.com/photo/2014/04/03/00/42/house-309156_960_720.png',
    phoneNo: "123456789",
  ),
];

// Choice Language
// Global
var LanguageTypes = <String>[
  'English',
  'Tamil',
  'Telugu',
  'Hindi',
  'Kannada',
  'Marathi',
];
var LanguageImage = <String>[
  'assets/images/English.png',
  'assets/images/Tamil.png',
  'assets/images/Telugu.png',
  'assets/images/Telugu.png',
  'assets/images/Hindi.png',
  'assets/images/Kannada.png',
  'assets/images/Marathi.png',
];

class passedArguments {
  late int index;
  passedArguments({required this.index});
}

// Music Player
class MusicNode {
  String name;
  String path;
  MusicNode(this.name, this.path);
}

Map<String, String> musicPlayerListByLanguage(int index) {
  List<Map<String, String>> arr = [
    EnglishMusic,
    TamilMusic,
    TeluguMusic,
    HindiMusic,
    KannadaMusic,
    MarathiMusic,
  ];
  return arr[index];
}

var EnglishMusic = {
  'Barish':
      'https://pwdown.com/12055/12%20Baarish%20-%20Atif%20Aslam%20(Half%20Girlfriend)%20190Kbps.mp3',
  'Ganpati Bappa': 'https://pwdown.com/11245/Sukh%20Karta%20Dukh%20Harta.mp3',
  'Shankar Ji ka Beta':
      "https://pwdown.com/11245/Shankar%20Ji%20Ka%20Beta%20Gaadi%20Me%20Baita.mp3",
};
var TamilMusic = {
  'Teri Deewani':
      'https://pwdown.com/12055/12%20Baarish%20-%20Atif%20Aslam%20(Half%20Girlfriend)%20190Kbps.mp3',
};
var TeluguMusic = {
  'Teri Deewani':
      'https://pwdown.com/12055/12%20Baarish%20-%20Atif%20Aslam%20(Half%20Girlfriend)%20190Kbps.mp3',
};
var HindiMusic = {
  'Teri Deewani':
      'https://pwdown.com/12055/12%20Baarish%20-%20Atif%20Aslam%20(Half%20Girlfriend)%20190Kbps.mp3',
};
var KannadaMusic = {
  'Teri Deewani':
      'https://pwdown.com/12055/12%20Baarish%20-%20Atif%20Aslam%20(Half%20Girlfriend)%20190Kbps.mp3',
};
var MarathiMusic = {
  'Teri Deewani':
      'https://pwdown.com/12055/12%20Baarish%20-%20Atif%20Aslam%20(Half%20Girlfriend)%20190Kbps.mp3',
};

int currentMusic = 0;

// Songs Section

Map<String, String> songsPlayerListByLanguage(int index) {
  List<Map<String, String>> arr = [
    EnglishSong,
    TamilSong,
    TeluguSong,
    HindiSong,
    KannadaSong,
    MarathiSong,
  ];
  return arr[index];
}

var EnglishSong = {
  'Oggy': 'jATN1dx1j4E',
  'Apple': 'FzcfZyEhOoI',
  'z': '',
  'a': '',
  'b': '',
  'c': '',
  'd': '',
};
var TamilSong = {'': ''};
var TeluguSong = {'': ''};
var HindiSong = {'': ''};
var KannadaSong = {'': ''};
var MarathiSong = {'': ''};
