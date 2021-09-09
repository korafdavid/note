import 'package:flutter/material.dart';
import 'package:notes/services/shared_pref.dart';
import 'screens/home.dart';
import 'data/theme.dart';


void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeData theme = appThemeLight;
  @override
   initState()  {
    super.initState();
    updateThemeFromSharedPref();
 
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: theme,
      home: MyHomePage( changeTheme: setTheme),
    );
  }

  setTheme(Brightness brightness) {
    if (brightness == Brightness.dark) {
      setState(() {
        theme = appThemeDark;
      });
    } else {
      setState(() {
        theme = appThemeLight;
      });
    }
  }

  void updateThemeFromSharedPref() async {
    String? themeText = await getThemeFromSharedPref();
    if (themeText == 'light') {
      setTheme(Brightness.light);
    } else {
      setTheme(Brightness.dark);
    }
  }
}


// getDetails()async{
//      var details = await NotificationService()
//     .flutterLocalNotificationsPlugin
//     .getNotificationAppLaunchDetails();
// if (details.didNotificationLaunchApp) {
//     print(details.payload);
// }
// }