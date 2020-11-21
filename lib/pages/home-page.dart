import 'package:Resume/models/firestore/rg-section-entry.dart';
import 'package:Resume/utils/rg-constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../rg-localizations.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget buildSocial(elem) {
    return Container(
      child: Padding(
        padding: EdgeInsets.only(
          top: verticalPadding / 2.0,
          right: horizontalPadding / 2.0,
        ),
        child: CircleAvatar(
          radius: 16.0,
          child: SvgPicture.asset('assets/${elem}'),
        ),
      ),
    );
  }
  // #region "header"

  Widget _buildHeader() {
    final socialImages = [
      'facebook.svg',
      'instagram.svg',
      'github.svg',
      'linkedin.svg',
    ];

    Widget buildInformation() {
      return Padding(
        padding: EdgeInsets.only(left: horizontalPadding),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            'John Doe',
            style: Theme.of(context).textTheme.headline1,
          ),
          Text(
            'Student',
            style: TextStyle(fontSize: 18.0),
          ),
          Row(
            children:
                socialImages.map((social) => buildSocial(social)).toList(),
          ),
        ]),
      );
    }

    Widget buildAvatarImage() {
      return CircleAvatar(
        radius: 64.0,
      );
    }

    return Container(
      child: Padding(
        padding: EdgeInsets.only(
            top: verticalPadding * 4.0,
            left: horizontalPadding,
            right: horizontalPadding,
            bottom: verticalPadding * 5.0 / 4.0),
        child: Row(
          children: [
            buildAvatarImage(),
            buildInformation(),
          ],
        ),
      ),
    );
  }

  // #endregion header"

  // #region "buildSection"

  Widget buildSectionEntry(RGSectionEntry section) {
    return Padding(
      padding: EdgeInsets.only(bottom: verticalPadding * 3.0 / 4.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: horizontalPadding,
                right: horizontalPadding * 4.0 / 10.0,
                bottom: verticalPadding * 3.0 / 4.0),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(4.0),
                  child: Image(
                    image: NetworkImage(
                        'https://i0.wp.com/unibuc.ro/wp-content/uploads/2018/12/Logo-UB-vertical-COLOR-limba-romana-e1544633678557.jpg?fit=1200%2C1071&ssl=1'),
                    height: 48.0,
                    width: 48.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding:
                      EdgeInsets.only(left: horizontalPadding * 4.0 / 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        section.name,
                        style: TextStyle(
                          fontSize: 18.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        section.interval(),
                        style: TextStyle(fontSize: 12.0),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
                left: horizontalPadding,
                right: horizontalPadding,
                bottom: verticalPadding / 3),
            child: Text(
              section.title,
              style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Text(
              section.description,
              style: TextStyle(fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }

  // #endregion "buildSection"

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: verticalPadding,
          top: verticalPadding * 5.0 / 4.0,
          left: horizontalPadding,
          right: horizontalPadding),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sectionEntriesEducation = [
      RGSectionEntry(
        name: 'University of Bucharest',
        description: 'Very very nice!',
        title: 'BA Law',
        fromDate: DateTime(2017, 07),
        toDate: DateTime(2020, 10),
      ),
      RGSectionEntry(
        name: 'University of Bucharest',
        description: 'Very very nice!',
        title: 'BA Law',
        fromDate: DateTime(2017, 07),
        toDate: DateTime(2020, 10),
      ),
    ];

    final sectionEntriesExperience = [
      RGSectionEntry(
          name: 'Chup chopa',
          fromDate: DateTime(2015, 03),
          toDate: DateTime(2016, 04),
          description: 'Blah blah blah blah',
          title: 'Orc Work!'),
      RGSectionEntry(
          name: 'Chup chopa',
          fromDate: DateTime(2015, 03),
          toDate: DateTime(2016, 04),
          description: 'Blah blah blah blah',
          title: 'Orc Work!'),
    ];

    return Container(
        child: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _buildHeader(),
          Divider(),
          _buildSectionTitle(RGLocalizations.of(context).education),
          ...(sectionEntriesEducation.map((entry) => buildSectionEntry(entry))),
          _buildSectionTitle(RGLocalizations.of(context).experience),
          ...(sectionEntriesExperience
              .map((entry) => buildSectionEntry(entry))),
        ],
      ),
    ));
  }
}
