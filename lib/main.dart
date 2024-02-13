import 'package:flutter/material.dart';
import 'package:get/get.dart';  
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shonish_assignment/app/modules/home_screen/views/home_screen_view.dart';
import 'package:shonish_assignment/app/utils/colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ScreenUtil.ensureScreenSize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return ScreenUtilInit(
       builder: (context, child) =>
     GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primaryColor: kPrimaryColor),
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    ),
    designSize: const Size(360, 690),
      minTextAdapt: true,
    );
  }
}
