import 'dart:convert';

import 'package:restaurant_system/models/all_data/employee_model.dart';
import 'package:restaurant_system/models/cart_model.dart';
import 'package:restaurant_system/models/dine_in_model.dart';
import 'package:restaurant_system/utils/sorting_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MySharedPreferences {
  static late SharedPreferences _sharedPreferences;

  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  clearData() {
    isLogin = false;
    employee = null;
    allData = '';
    baseUrl = '';
    inVocNo = 1;
    payInOutNo = 1;
    posNo = 0;
    cashNo = 0;
    storeNo = 0;
  }

  String get language => _sharedPreferences.getString(keyLanguage) ?? "";

  set language(String value) {
    _sharedPreferences.setString(keyLanguage, value);
  }

  String get deviceToken => _sharedPreferences.getString(keyDeviceToken) ?? "";

  set deviceToken(String value) {
    _sharedPreferences.setString(keyDeviceToken, value);
  }

  String get accessToken => _sharedPreferences.getString(keyAccessToken) ?? "";

  set accessToken(String value) {
    _sharedPreferences.setString(keyAccessToken, value);
  }

  bool get isLogin => _sharedPreferences.getBool(keyIsLogin) ?? false;

  set isLogin(bool value) {
    _sharedPreferences.setBool(keyIsLogin, value);
  }

  bool get isGMS => _sharedPreferences.getBool(keyIsGMS) ?? true;

  set isGMS(bool value) {
    _sharedPreferences.setBool(keyIsGMS, value);
  }

  EmployeeModel get employee => EmployeeModel.fromJson(jsonDecode(_sharedPreferences.getString(keyEmployee) ?? "{}"));

  set employee(EmployeeModel? value) {
    _sharedPreferences.setString(keyEmployee, value == null ? "{}" : jsonEncode(value.toJson()));
  }

  SortingModel get sorting => SortingModel.fromJson(jsonDecode(_sharedPreferences.getString(keySorting) ?? "{}"));

  set sorting(SortingModel? value) {
    _sharedPreferences.setString(keySorting, value == null ? "{}" : jsonEncode(value.toJson()));
  }

  String get allData => _sharedPreferences.getString(keyAllData) ?? "";

  set allData(String value) {
    _sharedPreferences.setString(keyAllData, value);
  }

  // List<DineInModel> get dineIn => List<DineInModel>.from(jsonDecode(_sharedPreferences.getString(keyDineIn) ?? "[]").map((e) => DineInModel.fromJson(e)));
  //
  // set dineIn(List<DineInModel> value) {
  //   _sharedPreferences.setString(keyDineIn, jsonEncode(List<dynamic>.from(value.map((e) => e.toJson()))));
  // }

  List<CartModel> get park => List<CartModel>.from(jsonDecode(_sharedPreferences.getString(keyPark) ?? "[]").map((e) => CartModel.fromJson(e)));

  set park(List<CartModel> value) {
    _sharedPreferences.setString(keyPark, jsonEncode(List<dynamic>.from(value.map((e) => e.toJson()))));
  }

  DateTime get dailyClose => DateTime.parse(_sharedPreferences.getString(keyDailyClose) ?? "0000-00-00T00:00:00.000");

  set dailyClose(DateTime value) {
    _sharedPreferences.setString(keyDailyClose, value.toIso8601String());
  }

  String get baseUrl => _sharedPreferences.getString(keyBaseUrl) ?? "";

  set baseUrl(String value) {
    _sharedPreferences.setString(keyBaseUrl, value);
  }

  int get orderNo => _sharedPreferences.getInt(keyOrderNo) ?? 1;

  set orderNo(int value) {
    _sharedPreferences.setInt(keyOrderNo, value);
  }

  int get inVocNo => _sharedPreferences.getInt(keyInVocNo) ?? 1;

  set inVocNo(int value) {
    _sharedPreferences.setInt(keyInVocNo, value);
  }

  int get payInOutNo => _sharedPreferences.getInt(keyPayInOutNoNo) ?? 1;

  set payInOutNo(int value) {
    _sharedPreferences.setInt(keyPayInOutNoNo, value);
  }

  int get posNo => _sharedPreferences.getInt(keyPosNo) ?? 0;

  set posNo(int value) {
    _sharedPreferences.setInt(keyPosNo, value);
  }

  int get cashNo => _sharedPreferences.getInt(keyCashNo) ?? 0;

  set cashNo(int value) {
    _sharedPreferences.setInt(keyCashNo, value);
  }

  int get storeNo => _sharedPreferences.getInt(keyStoreNo) ?? 0;

  set storeNo(int value) {
    _sharedPreferences.setInt(keyStoreNo, value);
  }

  int get bookingNo => _sharedPreferences.getInt(keyBookingNo) ?? 0;

  set bookingNo(int value) {
    _sharedPreferences.setInt(keyBookingNo, value);
  }

  int get printerWidth => _sharedPreferences.getInt(keyPrinterWidth) ?? 450;

  set printerWidth(int value) {
    _sharedPreferences.setInt(keyPrinterWidth, value);
  }

  int get sizeDataPrinter => _sharedPreferences.getInt(keySizeDataPrinter) ?? 23;

  set sizeDataPrinter(int value) {
    _sharedPreferences.setInt(keySizeDataPrinter, value);
  }

  int get sizeTitlePrinter => _sharedPreferences.getInt(keySizeTitlePrinter) ?? 27;

  set sizeTitlePrinter(int value) {
    _sharedPreferences.setInt(keySizeTitlePrinter, value);
  }

  int get sizeLargePrinter => _sharedPreferences.getInt(keySizeLargePrinter) ?? 34;

  set sizeLargePrinter(int value) {
    _sharedPreferences.setInt(keySizeLargePrinter, value);
  }

  bool get enablePaymentNetwork => _sharedPreferences.getBool(keyEnablePaymentNetwork) ?? false;

  set enablePaymentNetwork(bool value) {
    _sharedPreferences.setBool(keyEnablePaymentNetwork, value);
  }

  bool get enableDineIn => _sharedPreferences.getBool(keyEnableDineIn) ?? true;

  set enableDineIn(bool value) {
    _sharedPreferences.setBool(keyEnableDineIn, value);
  }
  bool get enableTakeAway => _sharedPreferences.getBool(keyEnableTakeAway) ?? true;

  set enableTakeAway(bool value) {
    _sharedPreferences.setBool(keyEnableTakeAway, value);
  }
}

final mySharedPreferences = MySharedPreferences();

const String keyDeviceToken = "key_device_token";
const String keyAccessToken = "key_access_token";
const String keyLanguage = "key_language";
const String keyIsLogin = "key_is_login";
const String keyIsGMS = "key_is_gms";
const String keyEmployee = "key_employee";
const String keySorting = "key_sorting";
const String keyAllData = "key_all_data";
const String keyDineIn = "key_dine_in";
const String keyPark = "key_park";
const String keyDailyClose = "key_daily_close";
const String keyBaseUrl = "key_base_url";
const String keyInVocNo = "key_in_voc_no";
const String keyOrderNo = "key_order_no";
const String keyPayInOutNoNo = "key_pay_in_out_no";
const String keyPosNo = "key_pos_no";
const String keyCashNo = "key_cash_no";
const String keyStoreNo = "key_store_no";
const String keyPrinterBluetooth = "key_printer_bluetooth";
const String keyPrinterWidth = "key_printer_width";
const String keySizeDataPrinter = "key_size_data_printer";
const String keySizeTitlePrinter = "key_size_title_printer";
const String keySizeLargePrinter = "key_size_large_printer";
const String keyEnablePaymentNetwork = "key_enable_payment_network";
const String keyEnableDineIn = "key_enable_dine_in";
const String keyEnableTakeAway = "key_enable_take_away";
const String keyBookingNo = "key_booking_no";
