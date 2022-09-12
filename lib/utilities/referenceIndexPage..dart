import 'dart:io';

import 'package:flutter/material.dart';
import 'package:kingdoms_kids/widgets/aboutUsPage.dart';
import 'package:kingdoms_kids/widgets/bookSlotPage.dart';
import 'package:kingdoms_kids/widgets/choiceLanguageForMusic.dart';
import 'package:kingdoms_kids/widgets/choiceLanguageForSongs.dart';
import 'package:kingdoms_kids/widgets/counsellingPage.dart';
import 'package:kingdoms_kids/widgets/curriculumPage.dart';
import 'package:kingdoms_kids/widgets/resourcesPage.dart';
import 'package:kingdoms_kids/widgets/storePage.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

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

void BookSlot(BuildContext context) {
  Navigator.push(context, MaterialPageRoute(
    builder: (context) {
      return const BookSlotPage();
    },
  ));
}

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
      'https://doc-04-4c-docs.googleusercontent.com/docs/securesc/8ishjs7hooo8lkqt9fmvbs11fccgo47v/k2b8j5et3vuv9vtev8vg6n0n2jlfb3gm/1663013100000/17947130613844246520/10876445644114682409/1ITliMPH7Hsc3HVFSPRjr0GczwuYu7Mf0?e=download&ax=AI9vYm6sxXycq85VpYbVIFqshrlemr34Nhsc0N-jZkxDYVWA1vLdRbEf0xW4CqpnQ_NiWnStNezaPkznNfesszLUrcXwO4zEdWNd2R-1LDniLwrP7u_snyEb4QiZPGOjZ2RGECl_vl749Uh05Fk4R-MXFOGOtW-9tYaWWesw_dScRBTaV7pZX-41D6p6uqvTGEKo2SFnGU5DxzVwMSLsyBpQ5fP7t4CqMG1zdwbopD6dSikkXKGrjfUQFrAVzUl0DfFT8vKWd1UuTL8QieumYGGU46g0XamTKJx65o03caWLcD7mJYqA5hpzjjEVrAZzfIKRB97NqtWeyc8S6qTzMJ3Le_l0zZ3eQ-MUAYTE0a_LZTDKtErxpeuEafeA7pO-W6YZqQ5YWrJGPPFAyhVwXT0AOwy0wTkGX8gaTB0x_yWB_tcI-JwEDZUaHQqfkPqx3-jtKWq5mtyONyqKoFinmvJ562oE2rw9FF4UH7b93ktdnAdJdx9oFl4_rDP1K4S4pP7RLhoKb8_WLCjo-Y775dtGgHeLUo6n1GAaVuQkjgTRsl2WIxgsK8ZN0h6lo7cIa7LUZCdBiWWjAikfjbxXRzxJS1ayAtP7NNC87zsw9l2Q7F72gwKW544ipQx3Qv224yhvjI9h6kguUJRXggixJ8axuk4NmakXaBeebU4h7Y8qZjlPAOC0OfqWYh3Ym-f3ohv3W1njc3Bi_8ncwe6CmiWBtRsoSc0ThnmKNw8j_jqDmmO11l29dmp-ecnTHO4nvzgAPviQQ8cdggYnjS4rlWUODyuTmGUH7ubZGP4E10PoYnnjRRM64mvdyyb0AlSD&uuid=508d498b-162f-42d3-8733-49d958f2b29e&authuser=0&nonce=ht5k1r07vcf82&user=10876445644114682409&hash=3si8ofhgsgplig3m5u27ljfrjen1lgfh',
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
var CounsellingTypes = <CounsellingData>[
  CounsellingData(
      title: 'Studies',
      description: 'Failure in Exams/Inability to cope with Regular Studies'),
  CounsellingData(
      title: 'Relationship',
      description:
          'Relationship Anxiety/Infatuation/Direction to decide to express Love '),
  CounsellingData(title: 'Addiction', description: 'Drug Abuse/Over Eating'),
  CounsellingData(
      title: 'Gender Choice',
      description: 'Gender Choice and same Sex Attraction'),
  CounsellingData(
      title: 'Parental Abuse',
      description: 'Parental abuse(single parent/step-parent)'),
];

class CounsellingData {
  String? title;
  String? description;
  CounsellingData({required this.title, required this.description});
}

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
  'Oggy Returns': YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=C5UQIuStwVY')
      .toString(),
  'Alaska': 'CHSnz0bCaUk',
  'Lofi': YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=yndhGWbxd0w')
      .toString(),
  'Time Management': YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=vL2aMjFS3sI')
      .toString(),
  'Tree DS': YoutubePlayer.convertUrlToId(
          'https://www.youtube.com/watch?v=S2W3SXGPVyU')
      .toString(),
};
var TamilSong = {'': ''};
var TeluguSong = {'': ''};
var HindiSong = {'': ''};
var KannadaSong = {'': ''};
var MarathiSong = {'': ''};
