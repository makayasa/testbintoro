import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:testbintoro/utils/global_binding.dart';
import 'package:timeago/timeago.dart' as timeago;

import 'app/routes/app_pages.dart';

void main() async {
  await GetStorage.init();
  timeago.setLocaleMessages('id', timeago.IdMessages());
  runApp(
    GetMaterialApp(
      title: "Application",
      debugShowCheckedModeBanner: false,
      initialBinding: GlobalBinding(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      supportedLocales: [
        Locale('id', 'ID'),
      ],
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        // GlobalWidgetsLocalizations.delegate,
        FormBuilderLocalizations.delegate,
      ],
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
    ),
  );
}
