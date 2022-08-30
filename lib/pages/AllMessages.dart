import 'package:flutter/material.dart';
import 'package:sms_advanced/sms_advanced.dart';
import 'package:sms_and_contact/pages/FullConversationPage.dart';
import 'About.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final SmsQuery query = SmsQuery();
  List<SmsThread> threads = [];

  @override
  void initState() {
    super.initState();
    query.getAllThreads.then((value) {
      threads = value;
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    
    List sentensi = [];

    //VARIABLES
    var sideMenu = Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          height: 400,
          padding: const EdgeInsets.fromLTRB(0, 45, 5, 0),
          child: Drawer(
            child: Container(
              color: Colors.blueGrey[800],
              child: ListView(
                children: [
                  const ListTile(
                    visualDensity: VisualDensity(horizontal: 0, vertical: -4),
                    leading: Icon(
                      Icons.settings,
                      color: Colors.white,
                      size: 40,
                    ),
                    title: Text(
                      'Ziada',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const Divider(
                    color: Colors.black,
                  ),
                  ListTile(
                    leading: const Icon(
                      Icons.analytics_outlined,
                      color: Colors.white,
                      size: 40,
                    ),

                    title: const Text(
                      'Taarifa',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                    // onTap: (){
                    //   Navigator.push(context,  MaterialPageRoute(
                    //       builder: (context)=>  About()
                    //   ));

                    // },

                    onLongPress: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => About()));
                    },
                  ),
                  ListTile(
                    title: const Text(
                      'Kuhusu Mripoti Tapeli',
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white70,
                      ),
                    ),
                    leading: const Icon(
                      Icons.info_outline,
                      color: Colors.white,
                      size: 40,
                    ),
                    onTap: () {},
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            backgroundColor: Colors.blueGrey[800],
            appBar: AppBar(
              backgroundColor: Colors.blueGrey[900],
              title: const Center(
                child: Text(
                  "Mripoti Tapeli App",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            endDrawer: sideMenu,
            body: ListView.builder(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
              itemCount: threads.length,
              itemBuilder: (BuildContext context, int index) {
                //filters messages  with contacts not saved in the phone
                if (threads[index].contact?.fullName == null) {
                  if (threads[index].contact?.address?.startsWith("+255") ==
                          true ||
                      threads[index].contact?.address?.startsWith("255") ==
                          true ||
                      threads[index].contact?.address?.startsWith("07") ==
                          true ||
                      threads[index].contact?.address?.startsWith("06") ==
                          true) {
                    return Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                      child: Card(
                        color: Colors.blueGrey[700],
                        child: ListTile(
                          leading: const CircleAvatar(
                            child: Icon(
                              Icons.dangerous,
                              color: Colors.redAccent,
                              size: 40,
                            ),
                          ),
                          title: Text(
                            threads[index].contact?.fullName ??
                                'Hajahifadhiwa!',
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              letterSpacing: 3,
                            ),
                          ),
                          subtitle: Text(
                            threads[index].messages.last.body ?? 'empty',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white70,
                            ),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FullConversationPage(
                                          jina: threads[index]
                                                  .contact
                                                  ?.fullName ??
                                              toString(),
                                          ujumbe:
                                              threads[index].messages.toList(),
                                        )));
                          },
                        ),
                      ),
                    );
                  } else {
                    return const SizedBox();
                  }
                } else {
                  return const SizedBox();
                }
              },
            )));
  }
}
