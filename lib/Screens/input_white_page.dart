import 'package:currency_app/Services/currency_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class InputWhitePage extends StatefulWidget {
  InputWhitePage({this.originalCurrency, this.convertedCurrency, Key? key})
      : super(key: key);
  final originalCurrency;
  final convertedCurrency;
  @override
  State<InputWhitePage> createState() => _InputWhitePageState();
}

class _InputWhitePageState extends State<InputWhitePage> {
  var currInput = 0;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          SizedBox(height: size.height * 0.07),
          InkWell(
            onTap: () {
              setState(() {
                currInput = 0;
              });
            },
            child: Text(
              'tap to delete',
              style: TextStyle(
                  color: Color(0xffffb6b6),
                  fontSize: size.width * 0.04,
                  fontFamily: 'Quicksand',
                  fontWeight: FontWeight.w500),
            ),
          ),
          Center(
            child: Text(
              currInput.toString().length <= 5
                  ? currInput.toString()
                  : 'length err',
              style: TextStyle(
                  fontFamily: 'Quicksand', fontSize: size.width * 0.18),
            ),
          ),
          SizedBox(
            height: size.height * 0.035,
          ),
          numberRow(1, 2, 3),
          SizedBox(
            height: size.height * 0.02,
          ),
          numberRow(4, 5, 6),
          SizedBox(
            height: size.height * 0.02,
          ),
          numberRow(7, 8, 9),
          SizedBox(
            height: size.height * 0.02,
          ),
          finalRow()
        ]),
      ),
    );
  }

  finalRow() {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            // calculateNum(num1);
          },
          child: Container(
            height: size.height * 0.14,
            width: size.width * 0.2,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffffb6b6)),
            child: Center(
                child: Text('.',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.09,
                        fontWeight: FontWeight.bold))),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNum(0);
          },
          child: Container(
            height: size.height * 0.14,
            width: size.width * 0.2,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffffb6b6)),
            child: Center(
                child: Text(
              '0',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.09,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        InkWell(
          onTap: () {
            CurrencyService().convertCurrency(widget.convertedCurrency,
                widget.originalCurrency, currInput, context);
          },
          child: Container(
            height: size.height * 0.14,
            width: size.width * 0.2,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xfffc1514)),
            child: Center(
                child: Icon(
              Icons.check,
              size: size.width * 0.09,
              color: Colors.white,
            )),
          ),
        )
      ],
    );
  }

  numberRow(int num1, int num2, int num3) {
    var size = MediaQuery.of(context).size;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
          onTap: () {
            calculateNum(num1);
          },
          child: Container(
            height: size.height * 0.14,
            width: size.width * 0.2,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffffb6b6)),
            child: Center(
                child: Text(num1.toString(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width * 0.09,
                        fontWeight: FontWeight.bold))),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNum(num2);
          },
          child: Container(
            height: size.height * 0.14,
            width: size.width * 0.2,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffffb6b6)),
            child: Center(
                child: Text(
              num2.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.09,
                  fontWeight: FontWeight.bold),
            )),
          ),
        ),
        InkWell(
          onTap: () {
            calculateNum(num3);
          },
          child: Container(
            height: size.height * 0.14,
            width: size.width * 0.2,
            decoration:
                BoxDecoration(shape: BoxShape.circle, color: Color(0xffffb6b6)),
            child: Center(
                child: Text(
              num3.toString(),
              style: TextStyle(
                  color: Colors.white,
                  fontSize: size.width * 0.09,
                  fontWeight: FontWeight.bold),
            )),
          ),
        )
      ],
    );
  }

  calculateNum(int num) {
    if (currInput == 0) {
      setState(() {
        currInput = num;
      });
    } else {
      setState(() {
        currInput = (currInput * 10) + num;
      });
    }
  }
}
