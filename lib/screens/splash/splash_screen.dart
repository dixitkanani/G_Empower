import 'package:empower_her/screens/home.dart';
import 'package:empower_her/screens/home/home_screen.dart';
import 'package:flutter/material.dart';

import '../../size_config.dart';
import '../login_success/components/body.dart';


class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    
    SizeConfig().init(context);
    return Scaffold(
      body: HomePage(),
    );
  }
}
