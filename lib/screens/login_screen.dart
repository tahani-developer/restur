import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:restaurant_system/networks/rest_api.dart';
import 'package:restaurant_system/screens/config_screen.dart';
import 'package:restaurant_system/screens/home_screen.dart';
import 'package:restaurant_system/screens/widgets/custom_button.dart';
import 'package:restaurant_system/screens/widgets/custom_single_child_scroll_view.dart';
import 'package:restaurant_system/screens/widgets/custom_text_field.dart';
import 'package:restaurant_system/utils/global_variable.dart';
import 'package:restaurant_system/utils/my_shared_preferences.dart';
import 'package:restaurant_system/utils/validation.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    SchedulerBinding.instance!.addPostFrameCallback((_) => RestApi.getData());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomSingleChildScrollView(
        child: Row(
          children: [
            Expanded(
                child: Image.asset(
              'assets/images/lock.png',
              height: 300.h,
            )),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Form(
                  key: _keyForm,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomTextField(
                        controller: _controllerUsername,
                        label: Text('Username'.tr),
                        maxLines: 1,
                        validator: (value) {
                          return Validation.isRequired(value);
                        },
                      ),
                      CustomTextField(
                        controller: _controllerPassword,
                        label: Text('Password'.tr),
                        obscureText: true,
                        isPass: true,
                        maxLines: 1,
                        validator: (value) {
                          return Validation.isRequired(value);
                        },
                      ),
                      CustomButton(
                        child: Text('Sign In'.tr),
                        onPressed: () {
                          FocusScope.of(context).requestFocus(FocusNode());
                          if (_controllerUsername.text.isEmpty && _controllerPassword.text == "Falcons@admin") {
                            _controllerPassword.text = '';
                            Get.to(()=> const ConfigScreen())!.then((value) {
                              RestApi.restDio.options.baseUrl = mySharedPreferences.baseUrl;
                              RestApi.getData();
                            });
                          } else if (_keyForm.currentState!.validate()) {
                            var indexEmployee = allDataModel.employees.indexWhere((element) => element.username == _controllerUsername.text && element.password == _controllerPassword.text);
                            if (indexEmployee != -1) {
                              mySharedPreferences.userId = allDataModel.employees[indexEmployee].id;
                              mySharedPreferences.fullName = allDataModel.employees[indexEmployee].empName;
                              mySharedPreferences.phoneNumber = allDataModel.employees[indexEmployee].mobileNo;
                              Get.offAll(() => const HomeScreen());
                            } else {
                              Fluttertoast.showToast(msg: 'Incorrect username or password'.tr, timeInSecForIosWeb: 3);
                            }
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
