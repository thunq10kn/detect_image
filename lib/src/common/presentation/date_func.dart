part of 'app_func.dart';

class DateFunc {
  factory DateFunc() => _instance;
  DateFunc._();
  static final _instance = DateFunc._();

  void printDate(DateTime date, {String format = 'yyyy/MM/dd'}) {
    print(date);
  }
}