import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: "Calculate simple intrest by sohan ",
    home: SIForm(),
    theme: ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.indigo,
      accentColor: Colors.indigoAccent,
    ),
  ));
}

class SIForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return SIFormstate();
  }
}

class SIFormstate extends State<SIForm> {
  @override
  final minpadding = 5.0;
  var _currencies = [
    'Rupees',
    'Doller',
    'Pounds',
    'Others',
  ];
  String _currentItemSelected = "Rupees";

  Widget build(BuildContext context){
    // TODO: implement build
    TextStyle textStyle = Theme.of(context).textTheme.title;
    return Scaffold(
      //resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text("Simple Intrest Calculator"),
      ),
      body: Container(
        padding: EdgeInsets.all(minpadding),
        child: ListView(children: <Widget>[
          getImageAssest(),
          
          Padding(
              padding: EdgeInsets.only(top: minpadding, bottom: minpadding),
              child: TextField(
                keyboardType: TextInputType.number,
                style: textStyle,
                decoration: InputDecoration(
                    labelText: "Principal",
                    hintText: "Enter principal Eg. 1200",
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0))),
              )),
          
          Padding(
            padding: EdgeInsets.only(top: minpadding, bottom: minpadding),
            child: TextField(
              keyboardType: TextInputType.number,
              style: textStyle,
              decoration: InputDecoration(
                  labelText: "Rate of Interest",
                  hintText: "In percent",
                  labelStyle: textStyle,
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5.0))),
            ),
          ),
          
          Padding(
            padding: EdgeInsets.only(top: minpadding, bottom: minpadding),
            child: Row(
            children: <Widget>[
              Expanded(
                child: TextField(
                  keyboardType: TextInputType.number,
                  style: textStyle,
                  decoration: InputDecoration(
                      labelText: "Term",
                      hintText: "Time in year",
                      labelStyle: textStyle,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5.0))
                  ),
                ),
              ),
              Container(
                width: minpadding*3 ,
              ),
              Expanded(
                child: DropdownButton<String>(
                  items: _currencies.map((String DropdounStringItem) {
                    return DropdownMenuItem<String>(
                      value: DropdounStringItem,
                      child: Text(DropdounStringItem),
                    );
                  }).toList(),
                  onChanged: (String newSelectedvalue) {
                    _dropdownItemSelected(newSelectedvalue);
                  },
                  value: _currentItemSelected,
                ),
              ),
            ],
          ),
          ),
          
      Padding(
            padding: EdgeInsets.only(top: minpadding,bottom: minpadding),
            child:  Row(
            children: <Widget>[
              Expanded(
                child: RaisedButton(
                    child: Text("Calculate",),
                    onPressed: (){

                    },
                ),
              ),
              Expanded(
                child: RaisedButton(
                  child: Text("Calculate" , style: textStyle,),
                  onPressed: (){

                  },
                ),
              )
            ],
          ),
          ),
         
        Padding(
           padding: EdgeInsets.all(minpadding),
           child: Text("Your Data" , style: textStyle,),
         ),
          
       
        ]),
      ),
    );
  }

  void _dropdownItemSelected(String newSelectedvalue){
    setState(() {
      this._currentItemSelected = newSelectedvalue;
    });
  }

  Widget getImageAssest(){
    AssetImage assetImage = AssetImage("images/mony.png");
    Image image = Image(
      image: assetImage,
      width: 125.0,
      height: 125.0,
    );
    return Container(
      child: image,
      margin: EdgeInsets.all(minpadding*10),
    );
  }

}
