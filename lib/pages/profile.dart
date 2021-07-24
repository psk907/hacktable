import 'package:flutter/material.dart';
import 'package:hacktable/models/contacts_model.dart';

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
      color: Colors.grey[200],
      height: height * 0.85,
      padding: EdgeInsets.fromLTRB(5, 8, 5, 8),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          CircleAvatar(
            radius: 45,
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            height: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0), color: Colors.grey),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12.0), color: Colors.grey),
            child: RawScrollbar(
                isAlwaysShown: true,
                thumbColor: Colors.red[600],
                radius: Radius.circular(30),
                child: ListView.builder(
                    itemCount: contactsModel.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.all(5),
                        height: 50,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.0),
                            color: Colors.grey[100]),
                        child: Row(
                          children: [
                            Padding(
                                padding: EdgeInsets.all(3),
                                child: CircleAvatar(
                                  backgroundColor:
                                      contactsModel[index]['type'] == 'Y'
                                          ? Colors.yellow[200]
                                          : Colors.red[400],
                                )),
                            Expanded(
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
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
    );
  }
}
