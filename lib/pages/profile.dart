import 'package:flutter/material.dart';
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
    return Container(
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
              CircleAvatar(
                radius: 45,
                backgroundColor: Palette.themeblue,
                backgroundImage: AssetImage('dummy_profile_pic.jpg'),
              ),
              SizedBox(
                height: 6,
              ),
              Text(
                'Priyanka',
                style: TextStyle(fontSize: 22),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(8),
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
                          'Your safe words',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                        Icon(Icons.edit),
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
              Expanded(
                  child: Container(
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
                            margin: EdgeInsets.all(5),
                            height: 55,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12.0),
                                color: Colors.white),
                            child: Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(3),
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
                                Icon(Icons.edit),
                                Icon(Icons.delete),
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
    );
  }
}
