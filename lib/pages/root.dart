import 'package:flutter/material.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

Widget addEducation(String institutionName, String timePeriod,
    String degreeType, String description) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 20.0, right: 8.0, bottom: 12.0),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(4.0),
              child: Image(
                image: NetworkImage(
                    'https://www.iconsdb.com/icons/preview/red/square-xxl.png'),
                height: 48,
                width: 48,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    institutionName,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    timePeriod,
                    style: TextStyle(fontSize: 12.0),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 6.0),
        child: Text(
          degreeType,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          description,
          style: TextStyle(fontSize: 12.0),
        ),
      ),
    ],
  );
}

class _RootPageState extends State<RootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(
                  top: 64.0, left: 20.0, right: 20.0, bottom: 20.0),
              child: Row(children: [
                CircleAvatar(
                  radius: 64.0,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 20.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'John Doe',
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'Student',
                          style: TextStyle(fontSize: 18),
                        ),
                        Row(children: [
                          Padding(
                            padding: EdgeInsets.only(top: 8.0),
                            child: CircleAvatar(
                              radius: 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.0, top: 8.0),
                            child: CircleAvatar(
                              radius: 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.0, top: 8.0),
                            child: CircleAvatar(
                              radius: 16,
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 12.0, top: 8.0),
                            child: CircleAvatar(
                              radius: 16,
                            ),
                          ),
                        ]),
                      ]),
                ),
              ]),
            ),
            Divider(),
            Padding(
              padding: EdgeInsets.only(
                  bottom: 16.0, top: 20.0, left: 20.0, right: 20.0),
              child: Text(
                'Education',
                style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
              ),
            ),
            addEducation('University of Bucharest', 'October 2017 - July 2021',
                'BA Law', 'very very very very very very very very very nice!'),
          ],
        ),
      ),
    );
  }
}
