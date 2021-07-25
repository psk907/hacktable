import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hacktable/models/contacts_model.dart';
import 'package:hacktable/themeconfig.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key key}) : super(key: key);

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Palette.AppBarBackground,
        title: Text(
          "Profile",
          style: GoogleFonts.muktaTextTheme()
              .headline1
              .copyWith(color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Container(
        //color: Colors.grey[200],
        height: height * 0.85,
        padding: EdgeInsets.fromLTRB(8, 10, 8, 10),
        child: Stack(
          alignment: Alignment.bottomRight,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                SizedBox(
                  height: 15,
                ),
                CircleAvatar(
                  radius: 45,
                  backgroundColor: Palette.themeblue,
                  backgroundImage: AssetImage('assets/dummy_profile_pic.jpg'),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  'Priyanka Sharma',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  margin: const EdgeInsets.all(5.0),
                  padding: EdgeInsets.all(10),
                  height: 100,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Palette.dribble),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Safe words',
                            style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w600),
                          ),
                          Icon(
                            Icons.edit,
                            color: Colors.grey[100],
                          ),
                        ],
                      ),
                      Text(
                        'For Code Yellow: "Bumblebee"',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                      Text(
                        'For Code Red   : "Ridiculous"',
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      '  SOS contacts:',
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.grey[700],
                          fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                    child: Container(
                  margin: const EdgeInsets.all(5.0),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.grey[200]),
                  child: RawScrollbar(
                      isAlwaysShown: true,
                      thumbColor: Palette.darker,
                      radius: Radius.circular(30),
                      child: ListView.builder(
                          itemCount: contactsModel.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 8),
                              height: 55,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12.0),
                                  color: Colors.white),
                              child: Row(
                                children: [
                                  Padding(
                                      padding: EdgeInsets.fromLTRB(
                                          8.0, 2.0, 12.0, 2.0),
                                      child: CircleAvatar(
                                        backgroundColor:
                                            contactsModel[index]['type'] == 'Y'
                                                ? Colors.yellow[200]
                                                : Colors.red[400],
                                        child: Text(
                                            contactsModel[index]['type'] == 'Y'
                                                ? 'Y'
                                                : 'R'),
                                      )),
                                  Expanded(
                                    child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            contactsModel[index]['name'],
                                            style: TextStyle(fontSize: 20),
                                          ),
                                          Text(
                                            contactsModel[index]['contactNo'],
                                            style: TextStyle(fontSize: 11),
                                          ),
                                        ]),
                                  ),
                                  Icon(
                                    Icons.edit_rounded,
                                    color: Colors.grey,
                                    size: 23,
                                  ),
                                  SizedBox(width: 5),
                                  Icon(
                                    Icons.delete,
                                    color: Colors.grey,
                                    size: 25,
                                  ),
                                  SizedBox(width: 5),
                                ],
                              ),
                            );
                          })),
                )),
              ],
            ),
            FloatingActionButton(
              onPressed: () {},
              backgroundColor: Palette.themegreen,
              child: Icon(Icons.add),
            )
          ],
        ),
      ),
    );
  }
}
