import 'package:adhan/adhan.dart';
import 'package:majmua/presentation/prayerTime/current_prayer_time_value.dart';
import 'package:majmua/presentation/prayerTime/prayer_parameters.dart';

class CurrentPrayerTimes {

  final DateTime _dateTime = DateTime.now();

  final PrayerParameters _prayerTime = PrayerParameters(
    latitude: 36.2134290492795,
    longitude: 36.521747813609586,
    calculationMethod: CalculationMethod.north_america,
  );

  int get getSecondNightValue => CurrentPrayerTimeValue(DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 00, 01)).getPrayerTimeValue;

  DateTime get getFajrTime => _prayerTime.getPrayerTimes.fajr;

  int get getFajrTimeValue => CurrentPrayerTimeValue(_prayerTime.getPrayerTimes.fajr).getPrayerTimeValue;

  DateTime get getSunriseTime => _prayerTime.getPrayerTimes.sunrise;

  int get getSunriseTimeValue => CurrentPrayerTimeValue(_prayerTime.getPrayerTimes.sunrise).getPrayerTimeValue;

  DateTime get getDhuhrTime => _prayerTime.getPrayerTimes.dhuhr;

  int get getDhuhrTimeValue => CurrentPrayerTimeValue(_prayerTime.getPrayerTimes.dhuhr).getPrayerTimeValue;

  DateTime get getAsrTime => _prayerTime.getPrayerTimes.asr;

  int get getAsrTimeValue => CurrentPrayerTimeValue(_prayerTime.getPrayerTimes.asr).getPrayerTimeValue;

  DateTime get getMaghribTime => _prayerTime.getPrayerTimes.maghrib;

  int get getMaghribTimeValue => CurrentPrayerTimeValue(_prayerTime.getPrayerTimes.maghrib).getPrayerTimeValue;

  DateTime get getIshaTime => _prayerTime.getPrayerTimes.isha;

  int get getIshaTimeValue => CurrentPrayerTimeValue(_prayerTime.getPrayerTimes.isha).getPrayerTimeValue;

  int get getFirstNightValue => CurrentPrayerTimeValue(DateTime(_dateTime.year, _dateTime.month, _dateTime.day, 00, 00)).getPrayerTimeValue;

  DateTime get getPastSecondNightTime => _fromTo(00, 01);

  DateTime get getPastFajrTime => _fromTo(_prayerTime.getPrayerTimes.fajr.hour, _prayerTime.getPrayerTimes.fajr.minute);

  DateTime get getRemainingFajrTime => _toTo(_prayerTime.getPrayerTimes.fajr.hour, _prayerTime.getPrayerTimes.fajr.minute);

  DateTime get getPastSunriseTime => _fromTo(_prayerTime.getPrayerTimes.sunrise.hour, _prayerTime.getPrayerTimes.sunrise.minute);

  DateTime get getRemainingSunriseTime => _toTo(_prayerTime.getPrayerTimes.sunrise.hour, _prayerTime.getPrayerTimes.sunrise.minute);

  DateTime get getPastDhuhrTime => _fromTo(_prayerTime.getPrayerTimes.dhuhr.hour, _prayerTime.getPrayerTimes.dhuhr.minute);

  DateTime get getRemainingDhuhrTime => _toTo(_prayerTime.getPrayerTimes.dhuhr.hour, _prayerTime.getPrayerTimes.dhuhr.minute);

  DateTime get getPastAsrTime => _fromTo(_prayerTime.getPrayerTimes.asr.hour, _prayerTime.getPrayerTimes.asr.minute);

  DateTime get getRemainingAsrTime => _toTo(_prayerTime.getPrayerTimes.asr.hour, _prayerTime.getPrayerTimes.asr.minute);

  DateTime get getPastMaghribTime => _fromTo(_prayerTime.getPrayerTimes.maghrib.hour, _prayerTime.getPrayerTimes.maghrib.minute);

  DateTime get getRemainingMaghribTime => _toTo(_prayerTime.getPrayerTimes.maghrib.hour, _prayerTime.getPrayerTimes.maghrib.minute);

  DateTime get getPastIshaTime => _fromTo(_prayerTime.getPrayerTimes.isha.hour, _prayerTime.getPrayerTimes.isha.minute);

  DateTime get getRemainingIshaTime => _toTo(_prayerTime.getPrayerTimes.isha.hour, _prayerTime.getPrayerTimes.isha.minute);

  DateTime _fromTo(final int hour, final int minute) {
    final DateTime fromPast = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute);
    final toPrayer = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, _dateTime.hour, _dateTime.minute);
    int value = toPrayer.difference(fromPast).inMinutes * 60;
    int getHour, getMinute;
    getHour = value ~/ 3600;
    getMinute = ((value - getHour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, getHour, getMinute);
    return result;
  }

  DateTime _toTo(final int hour, final int minute) {
    final DateTime fromPast = DateTime(_dateTime.year, _dateTime.month, _dateTime.day,  _dateTime.hour, _dateTime.minute);
    final toPrayer = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute);
    int value = toPrayer.difference(fromPast).inMinutes * 60;
    int getHour, getMinute;
    getHour = value ~/ 3600;
    getMinute = ((value - getHour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, getHour, getMinute);
    return result;
  }

  DateTime get getThirdNightPart {
    double valueThird =  ((1440 - getMaghribTimeValue + getFajrTimeValue) / 3) * 60;
    double value = (getFajrTimeValue.toDouble() * 60) - valueThird;
    int hour, minute;
    hour = value ~/ 3600;
    minute = ((value - hour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, hour, minute);

    return result;
  }

  DateTime get getLastHourFriday {
    int value = (CurrentPrayerTimeValue(_prayerTime.getPrayerTimes.maghrib).getPrayerTimeValue - 60) * 60;
    int getHour, getMinute;
    getHour = value ~/ 3600;
    getMinute = ((value - getHour * 3600)) ~/ 60;
    DateTime result = DateTime(_dateTime.year, _dateTime.month, _dateTime.day, getHour, getMinute);
    return result;
  }
}