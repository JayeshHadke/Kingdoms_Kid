import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kingdoms_kids/utilities/colors.dart';
import 'package:kingdoms_kids/utilities/referenceIndexPage..dart';
import 'package:kingdoms_kids/widgets/pdfViewerPage.dart';

class ResourcesPage extends StatefulWidget {
  const ResourcesPage({Key? key}) : super(key: key);

  @override
  State<ResourcesPage> createState() => _ResourcesPageState();
}

class _ResourcesPageState extends State<ResourcesPage> {
  ResourceTypes res = ResourceTypes.Objective_Lesson;

  @override
  Widget build(BuildContext context) {
    WidgetsFlutterBinding.ensureInitialized();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        return Future.delayed(Duration.zero);
      },
      child: SafeArea(
        child: Scaffold(
          endDrawer: Drawer(
            elevation: 1,
            width: MediaQuery.of(context).size.width * 0.5,
            child: ListView(
              children: [
                ListTile(
                  tileColor: mainColor,
                  title: Text(
                    'Types',
                    style: TextStyle(
                        fontFamily: 'Dosis',
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.height * 0.025),
                  ),
                ),
                ListTile(
                  leading: Icon(Icons.play_lesson_rounded,
                      size: MediaQuery.of(context).size.height * 0.03),
                  title: Text(
                    'Objective Lesson',
                    style: TextStyle(
                        fontFamily: 'Dosis',
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.022),
                  ),
                  onTap: () {
                    setState(
                      () {
                        res = ResourceTypes.Objective_Lesson;
                      },
                    );
                    Navigator.of(context).pop();
                  },
                  selected:
                      res == ResourceTypes.Objective_Lesson ? true : false,
                ),
                ListTile(
                  leading: Icon(Icons.add_chart_rounded,
                      size: MediaQuery.of(context).size.height * 0.03),
                  title: Text(
                    'Craft Books',
                    style: TextStyle(
                        fontFamily: 'Dosis',
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.022),
                  ),
                  onTap: () {
                    setState(
                      () {
                        res = ResourceTypes.Craft_Books;
                      },
                    );
                    Navigator.of(context).pop();
                  },
                  selected: res == ResourceTypes.Craft_Books ? true : false,
                ),
                ListTile(
                  leading: Icon(Icons.explore_rounded,
                      size: MediaQuery.of(context).size.height * 0.03),
                  title: Text(
                    'Experiments',
                    style: TextStyle(
                        fontFamily: 'Dosis',
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.022),
                  ),
                  onTap: () {
                    setState(
                      () {
                        res = ResourceTypes.Experiments;
                      },
                    );
                    Navigator.of(context).pop();
                  },
                  selected: res == ResourceTypes.Experiments ? true : false,
                ),
                ListTile(
                  leading: Icon(Icons.gamepad_rounded,
                      size: MediaQuery.of(context).size.height * 0.03),
                  title: Text(
                    'Games',
                    style: TextStyle(
                        fontFamily: 'Dosis',
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.022),
                  ),
                  onTap: () {
                    setState(
                      () {
                        res = ResourceTypes.Games;
                      },
                    );
                    Navigator.of(context).pop();
                  },
                  selected: res == ResourceTypes.Games ? true : false,
                ),
                ListTile(
                  leading: Icon(Icons.description_rounded,
                      size: MediaQuery.of(context).size.height * 0.03),
                  title: Text(
                    'Skit Script',
                    style: TextStyle(
                        fontFamily: 'Dosis',
                        color: Colors.black,
                        fontSize: MediaQuery.of(context).size.height * 0.022),
                  ),
                  onTap: () {
                    setState(
                      () {
                        res = ResourceTypes.Skit_Script;
                      },
                    );
                    Navigator.of(context).pop();
                  },
                  selected: res == ResourceTypes.Skit_Script ? true : false,
                ),
              ],
            ),
          ),
          appBar: AppBar(
            leading: BackButton(
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            centerTitle: true,
            backgroundColor: mainColor,
            title: ListTile(
              title: Text(
                'Resource',
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Dosis',
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.035),
              ),
              subtitle: Text(
                res.name.replaceAll("_", " "),
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Dosis',
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.height * 0.022),
              ),
            ),
          ),
          body: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.02,
                vertical: MediaQuery.of(context).size.height * 0.01),
            child: _generate(res),
          ),
        ),
      ),
    );
  }

  Widget _generate(ResourceTypes res) {
    return ListView.builder(
      itemCount: getResourcesCount(res),
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.symmetric(
              vertical: MediaQuery.of(context).size.height * 0.005),
          decoration: const BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 0.5,
                offset: Offset(0, 1),
              ),
              BoxShadow(
                color: Colors.white,
                blurRadius: 0.5,
                offset: Offset(0, 0),
              ),
            ],
          ),
          child: ListTile(
            tileColor: Colors.grey,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(
                    MediaQuery.of(context).size.width * 0.015)),
            title: Text(getResourcesName(res, index)),
            trailing: ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.resolveWith(
                  (states) {
                    if (states.contains(MaterialState.pressed)) {
                      return subColor;
                    } else {
                      return mainColor;
                    }
                  },
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return PDFViewerPage(
                          map: getResourcesMap(res), index: index);
                    },
                  ),
                );
              },
              child: Icon(
                Icons.open_in_browser_rounded,
                size: MediaQuery.of(context).size.height * 0.03,
              ),
            ),
          ),
        );
      },
    );
  }
}
