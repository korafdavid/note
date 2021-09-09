import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/widgets.dart';
import 'package:notes/services/shared_pref.dart';

class SettingsPage extends StatefulWidget {
final   Function(Brightness brightness) changeTheme;
  SettingsPage({Key? key,  required this.changeTheme})
      : super(key: key) {
   // this.changeTheme = changeTheme;
  }
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late String selectedTheme;



 @override
  void didChangeDependencies() {
         setState(() {
      if (Theme.of(context).brightness == Brightness.dark) {
        selectedTheme = 'dark';
      } else {
        selectedTheme = 'light';
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
  

    return Scaffold(
      body: ListView(
        physics: const BouncingScrollPhysics(),
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
                padding:
                    const EdgeInsets.only(top: 24, left: 24, right: 24),
                child: const Icon(Icons.navigate_before)),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16, top: 36, right: 24),
            child: buildHeaderWidget(context),
          ),
          buildCardWidget(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              const Text('App Theme',
                  style: TextStyle(fontFamily: 'ZillaSlab', fontSize: 24)),
              Container(
                height: 20,
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 'light',
                    groupValue: selectedTheme,
                    onChanged: handleThemeSelection,
                  ),
                  const Text(
                    'Light theme',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
              Row(
                children: <Widget>[
                  Radio(
                    value: 'dark',
                    groupValue: selectedTheme,
                    onChanged: handleThemeSelection,
                  ),
                  const Text(
                    'Dark theme',
                    style: TextStyle(fontSize: 18),
                  )
                ],
              ),
            ],
          )),
          buildCardWidget(Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Text('About App',
                  style: TextStyle(
                      fontFamily: 'ZillaSlab',
                      fontSize: 24,
                      color: Theme.of(context).primaryColor)),
              Container(
                height: 40,
              ),
              Center(
                child: Text('Developed by'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1)),
              ),
              Center(
                child: Text(
                  'CHIKEZIE JOSEPH PRECIOUS, A Student of Computer Science at Micheal Okpara University, Umudike. MOUAU/CMP/16/92301',
                  style: TextStyle(
                    color: Colors.grey.shade600
                  ),
                )
              ),
              
             
              Container(
                height: 30,
              ),
              Center(
                child: Text('about app'.toUpperCase(),
                    style: TextStyle(
                        color: Colors.grey.shade600,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1)),
              ),
              Center(
                child: Text(
                  'Specifically made for Undergraduates to take note during lecture hours',
                  style: TextStyle(
                    color: Colors.grey.shade600
                  )
                )
              )
             
            ],
          ))
            ],
          )
        ],
      ),
    );
  }

  Widget buildCardWidget(Widget child) {
    return Container(
      decoration: BoxDecoration(
          color: Theme.of(context).dialogBackgroundColor,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                offset: const Offset(0, 8),
                color: Colors.black.withAlpha(20),
                blurRadius: 16)
          ]),
      margin: const EdgeInsets.all(24),
      padding: const EdgeInsets.all(16),
      child: child,
    );
  }

  Widget buildHeaderWidget(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8, bottom: 16, left: 8),
      child: Text(
        'Settings',
        style: TextStyle(
            fontFamily: 'ZillaSlab',
            fontWeight: FontWeight.w700,
            fontSize: 36,
            color: Theme.of(context).primaryColor),
      ),
    );
  }

  void handleThemeSelection(String? value) {
    setState(() {
      selectedTheme = value!;
    });
    if (value == 'light') {
      widget.changeTheme(Brightness.light);
    } else {
      widget.changeTheme(Brightness.dark);
    }
    setThemeinSharedPref(value!);
  }

 
}
