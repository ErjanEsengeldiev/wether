class ConvertWeek {
  static String convertWeekDay(int dayInt) {
    if (dayInt == 1) {
      return 'Понидельник';
    } else if (dayInt == 2) {
      return 'Вторник';
    } else if (dayInt == 3) {
      return 'Среда';
    } else if (dayInt == 4) {
      return 'Четверг';
    } else if (dayInt == 5) {
      return 'Пятница';
    } else if (dayInt == 6) {
      return 'Суббота';
    } else if (dayInt == 7) {
      return 'Воскресенье';
    } else {
      return 'такого нет';
    }
  }
}
