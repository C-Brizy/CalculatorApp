import 'package:flutter/material.dart';
import 'package:math _expressions/math _expressions.dart';

main() {
  runApp(RootWidget());
}

class RootWidget extends StatelessWidget {
  //stless
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Calculator', home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String equation = '0';
  String result = '0';
  String expression = '0';

buttonPressed(buttonText) {
  setState((){
   if (buttonText == 'c'){
     equation = '0';
     result = '0';
   }else if (buttonText == '⌦'){
  expression = equation;
  expression = expression.replaceAll('x', '*');

  // try{
  //   Parser p = Parser ();
  //   Expression exp = p. parse (expression);

  //   ContextModel cm = ContextModel();
  //   result = '$';
  // }catch (e) {
  //   result = 'Error';
  // }
  

  var oldEquation = equation;
  print(oldEquation.length);
  equation = oldEquation.substring(0,oldEquation.length - 1);

  if(oldEquation == ''){
    equation ='0';
  }
}else{
var newEquation = equation + buttonText;
equation = newEquation;
}
 });
}

 

  Widget keyPadButton(buttontext, buttonColor) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.all(15),
        backgroundColor: buttonColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
      ),
      onPressed: () {
        buttonPressed(buttontext);
      },
      child: Text(
        buttontext,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget operatorButton(buttontext) {
    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.all(15),
          backgroundColor: Colors.blue,
          shape: CircleBorder()),
      onPressed: () {},
      child: Text(
        buttontext,
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget deleteButton(buttonText) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.35,
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.all(15),
          backgroundColor: Colors.cyan,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        ),
        onPressed: () {
          buttonPressed(buttonText);
        },
        child: Text(
          buttonText,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(30, 38, 53, 1),
      body: SafeArea(
        //right-click here to rearrange (format document)
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  result,
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  equation,
                  style: TextStyle(color: Colors.grey, fontSize: 18),
                ),
                Spacer(),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        keyPadButton('7', Colors.cyan),
                        keyPadButton('c', Colors.cyan),
                        deleteButton('⌦'),
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          keyPadButton('7', Color.fromRGBO(40, 53, 73, 1)),
                          keyPadButton('8', Color.fromRGBO(40, 53, 73, 1)),
                          keyPadButton('9', Color.fromRGBO(40, 53, 73, 1)),
                          operatorButton('+'),
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          keyPadButton('0', Color.fromRGBO(40, 53, 73, 1)),
                          keyPadButton('.', Color.fromRGBO(40, 53, 73, 1)),
                          keyPadButton('=', Colors.cyan),
                          operatorButton('/'),
                        ]),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                         keyPadButton('4', Color.fromRGBO(40, 53, 73, 1)),
                          keyPadButton('5', Color.fromRGBO(40, 53, 73, 1)),
                          keyPadButton('6', Colors.cyan),
                          operatorButton('*'),
                       
                        
                        
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
