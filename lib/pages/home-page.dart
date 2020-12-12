import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:resume/models/firestore/rg-section-entry.dart';
import 'package:resume/models/firestore/rg-section.dart';
import 'package:resume/utils/rg-constants.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Widget buildSocial(String image) {
    return Container(
      child: IconButton(
        icon: SvgPicture.asset(
          'assets/${image}',
        ),
        padding: EdgeInsets.only(
          right: kHorizontalPadding / 2.0,
          top: hVerticalPadding / 2.0,
        ),
        constraints: BoxConstraints(),
        iconSize: 32.0,
        alignment: Alignment.centerLeft,
        onPressed: null,
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
        padding: EdgeInsets.only(
          left: kHorizontalPadding,
        ),
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
          top: hVerticalPadding * 4.0,
          left: kHorizontalPadding,
          right: kHorizontalPadding,
          bottom: hVerticalPadding * 5.0 / 4.0,
        ),
        child: Row(
          children: [
            buildAvatarImage(),
            buildInformation(),
          ],
        ),
      ),
    );
  }

  // #endregion "header"

  // #region "buildSection"

  final url = 'https://drept.unibuc.ro/';

  Widget _buildSectionEntry(RGSectionEntry section) {
    return Padding(
      padding: EdgeInsets.only(
        bottom: hVerticalPadding * 3.0 / 4.0,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: kHorizontalPadding,
              right: kHorizontalPadding * 4.0 / 10.0,
              bottom: hVerticalPadding * 3.0 / 4.0,
            ),
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    4.0,
                  ),
                  child: Image(
                    image: NetworkImage(
                      'https://i0.wp.com/unibuc.ro/wp-content/uploads/2018/12/Logo-UB-vertical-COLOR-limba-romana-e1544633678557.jpg?fit=1200%2C1071&ssl=1',
                    ),
                    height: 48.0,
                    width: 48.0,
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                    left: kHorizontalPadding * 4.0 / 10.0,
                  ),
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
                        section.interval,
                        style: TextStyle(
                          fontSize: 12.0,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.only(
              left: kHorizontalPadding,
              right: kHorizontalPadding,
              bottom: hVerticalPadding / 3,
            ),
            child: Text(
              section.title,
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: kHorizontalPadding,
            ),
            // child: Text(
            //   section.description,
            //   style: TextStyle(
            //     fontSize: 12.0,
            //   ),

            // child: FutureBuilder(
            //     future: rootBundle.loadString(section.description),
            //     builder:
            //         (BuildContext context, AsyncSnapshot<String> snapshot) {
            //       if (snapshot.hasData) {
            //         return Markdown(
            //           data: snapshot.data,
            //           shrinkWrap: true,
            //           onTapLink: null,
            //         );
            //       }

            //       return Center(
            //         child: CircularProgressIndicator(),
            //       );
            //     }),
            child: Markdown(
              data: section.description,
              shrinkWrap: true,
              onTapLink: null,
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
        bottom: hVerticalPadding,
        top: hVerticalPadding * 5.0 / 4.0,
        left: kHorizontalPadding,
        right: kHorizontalPadding,
      ),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline2,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sections = [
      RGSection(
        name: 'Education',
        entries: [
          RGSectionEntry(
            name: 'University of Bucharest',
            description:
                'assets/description.md [link](https://www.google.com) # Title',
            title: 'BA Law',
            fromDate: DateTime(2017, 07),
            toDate: DateTime(2020, 10),
          ),
          RGSectionEntry(
            name: 'University of Bucharest',
            description: 'assets/description.md',
            title: 'BA Law',
            fromDate: DateTime(2017, 07),
            toDate: DateTime(2020, 10),
          ),
        ],
      ),
      RGSection(
        name: 'Experience',
        entries: [
          RGSectionEntry(
            name: 'Chup chopa',
            fromDate: DateTime(2015, 03),
            toDate: DateTime(2016, 04),
            description: 'Blah blah blah blah',
            title: 'Orc Work!',
          ),
          RGSectionEntry(
            name: 'Chup chopa',
            fromDate: DateTime(2015, 03),
            toDate: DateTime(2016, 04),
            description: 'Blah blah blah blah',
            title: 'Orc Work!',
          ),
        ],
      ),
    ];

    return Container(
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            _buildHeader(),
            ...sections
                .map(
                  (section) => [
                    Divider(),
                    _buildSectionTitle(section.name),
                    ...section.entries.map(
                        (sectionEntry) => _buildSectionEntry(sectionEntry)),
                  ],
                )
                .expand((element) => element),
          ],
        ),
      ),
    );
  }
}
