import 'dart:math';

import 'package:flutter/material.dart';
import 'package:secret_talk/config/constant.dart';
import 'package:secret_talk/routes.dart';

class SecretTalkApp extends StatelessWidget {
  const SecretTalkApp({super.key});

  @override
  Widget build(BuildContext context){

    return MaterialApp(
      color : Colors.white,
      navigatorKey: AppNavigator.navigatorKey,
      onGenerateRoute: AppNavigator.onGenerateRoute,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      title : AppConstant.name,
      builder: (context, child) {
        if(child == null) return const SizedBox.shrink();

        final data = MediaQuery.of(context);
        final smallestSize = min(data.size.width, data.size.height);
        final textScaleFactor = min(smallestSize / const Size(375, 754).width, 1.0);
        return MediaQuery(data: data.copyWith(textScaleFactor: textScaleFactor), child: child);
      },
    );
  }
}