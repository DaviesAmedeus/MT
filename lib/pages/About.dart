import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({Key? key}) : super(key: key);

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[800],
      appBar: AppBar(
        backgroundColor: Colors.blueGrey[900],

        title: Text('Kuhuhsu'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(25,30,20,30),
          child: Column(
            children: <Widget>[
              Text('Mripoti tapeli ni App inayokuwezesha kuripoti ujumbe wa kitapeli '
                  'ukiwa mahali popote nchini Tanzania. App hii inasaidia mamlaka ya '
                  'serikali mtandao (e-GA) kupata taarifa sahihi za matukio ya kitapeli.'
                  '\n \n'
                  'Taarifa zinazochakatwa na app hii ni pamoja na namba ambazo hazijahifadhiwa'
                  ' kwenye simu, ujumbe unaohisiwa ni wa kitapeli na namba ya anayejaribu '
                  'kutapeliwa.'
                  '\n \n'
                  'Angalizo. Kwasasa App hii haitahusisha kufungia kwa namba yeyote '
                  'itakayo ripotiwa bali kukusanya taarifa na kuzifanyia tathimini '
                  'taarifa hizo kisha kuuridisha mrejesho kwa aliyeripoti na kusaidia '
                  'mamlaka ya mawasiliano TCRA kuchukua hatua sahihi kwa zile namba '
                  'zitazokutwa na hatia.'
                  '\n \n'
                  'App hii ipo chini ya mamlaka ya serikali mtandao (e-Governement)'
                  '\n \n'
                  'Haki zote zimehifadhiwa, hivyo hairuhusiwi kudukua au kuchambua '
                  'App hii bila ruhusa yeyote kutoka kwenye mamlaka. ',
              // textAlign: TextAlign.justify,


              style: TextStyle(
                fontSize: 17,
                color: Colors.white70,
                letterSpacing: 1,


              ),),




            ],
          ),
        ),
      ),



    );
  }
}
