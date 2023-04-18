// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:interview_task_app/core/routes/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Posts app',
      routerConfig: router,
    );
  }
}
