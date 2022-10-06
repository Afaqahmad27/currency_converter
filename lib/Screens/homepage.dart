import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'dashboard.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: DashBoard(
      currencyVal: 0.0,
      convertedCurrency: 0.0,
      currencyOne: 'USD',
      currencyTwo: 'RUB',
      isWhite: false,
    ));
  }
}
