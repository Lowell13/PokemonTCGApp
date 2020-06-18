import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            width: 350,
            height: 350,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/open_pokeball.png'),
                  )),
                ),
                Text(
                  'Oh no! The POKéMON broke free!',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Text(
                  'Check your connection and try again !',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RaisedButton(
                      child: Text(
                        'Try again',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onPressed: () {
                        Navigator.popAndPushNamed(context, '/splashscreen');
                      },
                    ),
                    RaisedButton(
                      child: Text(
                        'Quit',
                        style: Theme.of(context).textTheme.bodyText2,
                      ),
                      onPressed: () {
                        SystemNavigator.pop();
                      },
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
