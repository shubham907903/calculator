
import 'package:flutter/material.dart';

void main() {


  runApp(MaterialApp(

    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}
class HomePage extends StatefulWidget {
  _HomeState createState() => _HomeState();
}
class _HomeState extends State<HomePage>{


  String _displayString="0";
  String _numberString="0";
  double _result=0;
  String _operation="0";


  Widget createRow(String title1,String title2,String title3,String title4)
  {
    return Expanded(child:
    Row(
      children:<Widget>[
        createButton(title1),
        createButton(title2),
        createButton(title3),
        createButton(title4),
      ],
    ),
    );

  }
  calculate()
  {
    switch(_operation){
      case
      "+":
        _result= _result+=double.parse(_numberString);
        break;
      case
      "-":
        _result= _result-=double.parse(_numberString);
        break;
      case
      "*":
        _result= _result*=double.parse(_numberString);
        break;
      case
      "/":
        _result= _result/=double.parse(_numberString);
        break;
    }
    _numberString=_result.toString();
    _displayString=_numberString;


  }
  pressButton(String title){
    setState(() {
      if(title=='+'||title=='-'||title=='*'||title=="/") {
        _result=double.parse(_numberString)??0;
        _numberString="";
        _operation=title;
      }
      else if(title=="=")
      {
        calculate();
      }
      else if(title=="CE")
      {
        _numberString="";
        _displayString="0";
        _result=0;
      }

      else {
        if(_numberString=="0"||_numberString=="0.0")
        {
          _numberString="";
        }
        _numberString+=title;
        _displayString=_numberString;
      }
    });

  }
  Widget createButton(String title)
  {
    return Expanded(child: ButtonTheme(
      height:double.infinity,
      child: OutlinedButton(

        onPressed: (){
          pressButton(title);
        },
        child:  Text(title,style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color:  Colors.pink
        ),
        ),
      ),
    ),
    );
  }
  Widget build( BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculator Things"),backgroundColor: Colors.pink,
      ),
      body: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child:Container(
                color: Color.fromARGB(20, 10, 10, 10),
                child:Padding(
                  padding: const EdgeInsets.all(10.0),
                  child:Align(child: Text(_displayString,style: TextStyle(fontSize: 85),
                  ), alignment: FractionalOffset.bottomRight,),
                ),
              ),
            ),
            Expanded(
                child:
            Column(
                children:<Widget>[
                createRow("+", "-", "*", "/"),
            createRow("7", "8", "9", "0"),
            createRow("4", "5", "6", "CE"),
            createRow("3", "2", "1", "="),

          ],
        ),

      )
      ],
    ),
    ),
    );
  }
}
