import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:margdarshakapi/newmain.dart';
import 'package:margdarshakapi/osmonitor.dart';
import 'package:margdarshakapi/screentime.dart';
import 'package:margdarshakapi/skimmer_detection.dart';
import 'margdarshak.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SAVE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(

            // or from RGB

            primary: const Color(0xff000289)),
      ),
      home: MyHomePage(title: 'SAVE'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  final String title;
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // leading: new IconButton(
        //   icon: new Icon(Icons.menu, color: Colors.white),
        //   onPressed: () {},
        // ),
      ),
      drawer: const NavigationDrawer(),
      body:
          ListView(controller: ScrollController(), shrinkWrap: true, children: [
        Container(
          padding: EdgeInsets.all(7),
          child: SizedBox(
            height: 200.0,
            width: 400.0,
            child: CarouselSlider(
              items: [
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://marvel-b1-cdn.bc0a.com/f00000000100045/www.elmhurst.edu/wp-content/uploads/2020/03/cybersecurity-vs-information-security-illustration.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://cdn.nrf.com/sites/default/files/styles/crop_1440_700/public/2020-07/Cybersecurity.jpg?h=43bfdcaf&itok=_vIAGnlk"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(6.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    image: DecorationImage(
                      image: NetworkImage(
                          "https://www.bsebti.com/blog/wp-content/uploads/2022/04/PR0421-CyberSecurity.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
              options: CarouselOptions(
                enlargeCenterPage: true,
                autoPlay: true,
                // aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 2000),
                viewportFraction: 0.8,
              ),
            ),
          ),
        ),
        Container(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),
              child: Column(
                children: [
                  Text("About ICSS",
                      style: TextStyle(
                        color: Color(0xff000289),
                        fontSize: 20,
                      )),
                  Text(
                    "Indian Cyber Security Solutions is an organization which caters to the need of technology based risk management & cyber security solution across the globe. ICSS was established in 2013 & by this time it has gathered a good deal of momentum and has reached a distinguished position out of the leading firms in this domain in the country.",
                    textAlign: TextAlign.center,
                  ),
                ],
              )),
        ),
        Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: GridView(
              shrinkWrap: true,
              children: [
                InkWell(
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             SkimmerDet(title: "Skimmer Detection")));
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MyApp2()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff0b0ebc),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.phishing,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          "Skimmer",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                MargDarshak(title: "MargDarshak")));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff0b0ebc),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.search,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          "Marg Darshak",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context)=>HomePage()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Color(0xff0b0ebc)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.settings,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          "App Permissions",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>ScreenTime(title: "ScreenTime")));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff0b0ebc),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.screen_lock_landscape,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          "Screen Timer",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => OSM()));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xff0b0ebc),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.bar_chart,
                          size: 50,
                          color: Colors.white,
                        ),
                        Text(
                          "OS Monitor",
                          style: TextStyle(color: Colors.white, fontSize: 17),
                        )
                      ],
                    ),
                  ),
                ),
              ],
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 10, crossAxisSpacing: 10),
            ),
          ),
        ),
      ]),
    );
  }
}

class NavigationDrawer extends StatelessWidget {
  const NavigationDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Drawer(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              buildHeader(context),
              buildMenuItems(context),
            ],
          ),
        ),
      );
  Widget buildHeader(BuildContext context) => Container(
        color: Color(0xff000289),
        padding: EdgeInsets.all(15),
        child: Column(children: [
          CircleAvatar(
            radius: 52,
            backgroundImage: NetworkImage(
                "https://thumbs.dreamstime.com/b/unknown-man-profile-avatar-vector-male-office-icon-potrait-175425661.jpg"),
          ),
          SizedBox(height: 12),
          Text(
            "User Name",
            style: TextStyle(fontSize: 28, color: Colors.white),
          ),
          Text(
            "username@email.com",
            style: TextStyle(fontSize: 16, color: Colors.white),
          ),
        ]),
      );
  Widget buildMenuItems(BuildContext context) => Container(
      child: Container(
          padding: EdgeInsets.all(10),
          child: Wrap(
            runSpacing: 18,
            children: [
              ListTile(
                leading: const Icon(Icons.home_outlined),
                title: const Text("Home", style: TextStyle(fontSize: 16)),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const MyHomePage(
                          title: "SAVE",
                        ))),
              ),
              ListTile(
                leading: const Icon(Icons.person_outlined),
                title: const Text("My Info", style: TextStyle(fontSize: 16)),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.update),
                title: const Text("Update", style: TextStyle(fontSize: 16)),
                onTap: () {},
              ),
              ListTile(
                leading: const Icon(Icons.notifications_outlined),
                title:
                    const Text("Notifications", style: TextStyle(fontSize: 16)),
                onTap: () {},
              ),
            ],
          )));
}
