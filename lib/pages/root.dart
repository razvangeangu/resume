import 'package:Resume/pages/homePage.dart';
import 'package:Resume/rg-localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RootPage extends StatefulWidget {
  RootPage({Key key}) : super(key: key);

  @override
  _RootPageState createState() => _RootPageState();
}

// ##############  <HEADER> #########################

RGSection section = RGSection(
  name: 'University of Bucharest',
  description: 'Very very nice!',
  title: 'BA Law',
  fromDate: DateTime(2017, 07),
  toDate: DateTime(2020, 10),
);

Widget header() {
  Widget _information() {
    return Padding(
      padding: EdgeInsets.only(left: 20.0),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        Text(
          'John Doe',
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.bold),
        ),
        Text(
          'Student',
          style: TextStyle(fontSize: 18.0),
        ),
        Row(children: [
          Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: CircleAvatar(
              radius: 16.0,
              child: SvgPicture.asset('assets/facebook.svg'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, top: 8.0),
            child: CircleAvatar(
              radius: 16.0,
              child: SvgPicture.asset('assets/github.svg'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, top: 8.0),
            child: CircleAvatar(
              radius: 16.0,
              child: SvgPicture.asset('assets/linkedin.svg'),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 12.0, top: 8.0),
            child: CircleAvatar(
              radius: 16.0,
              child: SvgPicture.asset('assets/instagram.svg'),
            ),
          ),
        ]),
      ]),
    );
  }

  Widget _avatarImage() {
    return CircleAvatar(
      radius: 64.0,
    );
  }

  return Container(
    child: Padding(
      padding:
          EdgeInsets.only(top: 64.0, left: 20.0, right: 20.0, bottom: 20.0),
      child: Row(children: [
        _avatarImage(),
        _information(),
      ]),
    ),
  );
}

// ############################  </HEADER> #######################

Widget sectionTitle(BuildContext context) {
  return Padding(
    padding: EdgeInsets.only(bottom: 16.0, top: 20.0, left: 20.0, right: 20.0),
    child: Text(
      RGLocalizations.of(context).education,
      style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
    ),
  );
}

Widget addSection(RGSection section) {
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
                height: 48.0,
                width: 48.0,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    section.name,
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
                  ),
                  Text(
                    section.period(),
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
          section.title,
          style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0),
        child: Text(
          section.description,
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
            header(),
            Divider(),
            sectionTitle(context),
            addSection(section),
          ],
        ),
      ),
    );
  }
}
