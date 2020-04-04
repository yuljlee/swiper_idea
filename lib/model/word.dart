
class Word {
  String category;
  String engName;
  String korName;

  List<String> korWord = [
    "사과",
    "바나나",
    "포도",
    "배",
    "자두",
    '수박'
  ];

  List<String> engWord = [
    "APPLE",
    "BANANA",
    "GRAPE",
    "PEAR",
    "PLUM",
    'WATER MELON'
  ];

  String getKorWord(int index) {
    return korWord[index];
  }

}