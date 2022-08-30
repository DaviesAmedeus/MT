import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_advanced/sms_advanced.dart';
import 'package:http/http.dart' as http;

class FullConversationPage extends StatefulWidget {

 final List<SmsMessage> ujumbe;

 final String jina;
   FullConversationPage(
      {
        Key? key,
        required this.ujumbe, required this.jina,

      }
      ) : super(key: key);


  @override
  State<FullConversationPage> createState() => _FullConversationPageState();
}


class _FullConversationPageState extends State<FullConversationPage> {
  final nambaYaMripoti =  TextEditingController();

  //final ScaffoldMessenger scaffoldMessenger = ScaffoldMessenger.of(context).showSnackBar(s)

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    nambaYaMripoti.dispose();
    super.dispose();
  }

  sendDataToApi(meseji, nambaYaTapeli, nambaYaMripoti) async {

    if(nambaYaTapeli.toString().startsWith("+255") || nambaYaTapeli.toString().startsWith("255") ||
    nambaYaTapeli.toString().startsWith("07") || nambaYaTapeli.toString().startsWith("06")){

      var response = await http
          .post(Uri.parse('http://172.17.17.85:8000/mripoti/'), headers: {
        'Accept': 'application/json',
        'content-type': 'application/json',

      },body :jsonEncode( {
        'reporter_number':nambaYaMripoti.text,
        'contained_text':meseji,
        'scammer_number':nambaYaTapeli.toString()
      }));
      var body = json.decode(response.body);
      print(body);

    }else{

     print("Not a valid number");

    }


  }



  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);

    return Scaffold(
      backgroundColor: Colors.blueGrey[800],

      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],
        title: Text(widget.ujumbe[0].sender.toString()),
      ),

        body: Container(
          padding: const EdgeInsets.fromLTRB(20, 20, 20, 67),

          child: ListView.builder(
            reverse: true,

            itemCount: widget.ujumbe.length,
            itemBuilder: (BuildContext context, int index){
              print(widget.ujumbe[index].sender);
              return Container(
                width: 150,
                child: Card(


                  color: Colors.blueGrey[900],

                  child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 7, 10, 7),
                    child: Text(
                      widget.ujumbe[index].body.toString(),
                      style: TextStyle(
                        color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold),

                    ),
                  ),
                ),
              );
            },
          ),
        ),

        floatingActionButton: FloatingActionButton.extended(
            onPressed: (){

              var nambaYaTapeli =  widget.ujumbe[0 ].sender.toString();
              var meseji = widget.ujumbe[0].body.toString();

              //Dialog function
              openDialog(context,meseji, nambaYaTapeli);
            },
            label: Text('Ripoti'),
        icon: Icon(Icons.warning),
          backgroundColor: Colors.red,
        ),
    );
  }


//Function inayoita sehemu ya kuthibitisha ujumbe wa kitapeli (Dialog)
  Future openDialog(BuildContext context, meseji, nambaYaTapeli ) async {
    showDialog(
        context:context,
        builder: (context)=> AlertDialog(
          contentPadding: const EdgeInsets.only(left: 25, right: 25),
          title: Center(child: Text("Thibitisha kuripoti")),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(20.0))),

          content: Container(
            height:  200,
            width: 450,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 20,),
                  Text("Ujumbe wa utapeli:",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),),
                  Text("${meseji} \n"),
                  Text("Namba ya utapeli:",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),),
                  Text("${nambaYaTapeli} \n"),
                  Text("Ingiza namba uliyopokelea ujunbe wa kitapeli:",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  TextField(
                    controller: nambaYaMripoti,
                    decoration: InputDecoration(
                    border: OutlineInputBorder(),
                      hintText: "Andika hapa"),)
                ],
              ),
            ),
          ),

          actions: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: TextButton(
                    onPressed: (){
                      Navigator.of(context).pop();
                    },
                    child: Text("USITUME"),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.30,
                  child: TextButton(
                    onPressed: (){
                      sendDataToApi(meseji, nambaYaTapeli, nambaYaMripoti);
                      print("=====> ${nambaYaMripoti.text}");
                     Navigator.of(context).pop();


                    },
                    child: Text("TUMA"),
                  ),
                )
              ],
            )
          ],
        )
    );
  }
}








