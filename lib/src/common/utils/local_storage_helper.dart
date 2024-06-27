import 'package:intl/intl.dart';
import 'package:rem_admin/src/common/utils/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferencesHelper {
  static const _prefix = '10kn_veltoria';

  Future<bool> setString(String key, String value) async {
    logger.i('AppPreferencesHelper: Save $key as $value');
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setString('${_prefix}_$key', value);
  }

  Future<bool> setBool(String key, bool value) async {
    logger.i('AppPreferencesHelper: Save $key as $value');
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setBool('${_prefix}_$key', value);
  }

  Future<bool> setInt(String key, int value) async {
    logger.i('AppPreferencesHelper: Save $key as $value');
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setInt('${_prefix}_$key', value);
  }

  Future<bool> setDouble(String key, double value) async {
    logger.i('AppPreferencesHelper: Save $key as $value');
    final prefs = await SharedPreferences.getInstance();
    return await prefs.setDouble('${_prefix}_$key', value);
  }

  Future<String?> getString(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getString('${_prefix}_$key');
    logger.i('AppPreferencesHelper: Get $key is $value');
    return value;
  }

  Future<bool?> getBool(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getBool('${_prefix}_$key');
    logger.i('AppPreferencesHelper: Get $key is $value');
    return value;
  }

  Future<int?> getInt(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getInt('${_prefix}_$key');
    logger.i('AppPreferencesHelper: Get $key is $value');
    return value;
  }

  Future<double?> getDouble(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final value = prefs.getDouble('${_prefix}_$key');
    logger.i('AppPreferencesHelper: Get $key is $value');
    return value;
  }

  Future<bool> setDateOffline(DateTime? date) {
    return setString('date_offline', date.toString());
  }

  Future<DateTime?> getDateOffline() async {
    try {
      final dateStr = await getString('date_offline');
      if (dateStr != null) {
        return DateFormat('yyyy-MM-dd HH:mm:ss.SSS').parse(dateStr);
      }
    } catch (e) {
      logger.d(e);
    }
    return null;
  }

  Future<bool> setStayLogin(bool stayLogin) {
    return setBool('stay_login', stayLogin);
  }

  Future<bool?> getStayLogin(){
    return getBool('stay_login');
  }
 }
