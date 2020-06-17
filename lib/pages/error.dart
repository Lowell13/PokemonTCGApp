import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pokemontcgviewer/widget/custom_button.dart';

class Error extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
              'Raaaaah ça y était presque !',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Text(
              'Vérifie ta connexion et réessaie !',
              style: Theme.of(context).textTheme.bodyText1,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                CustomButton(
                  title: 'Réessayer',
                  onPressed: () {
                    Navigator.popAndPushNamed(context, '/splashscreen');
                  },
                ),
                CustomButton(
                  title: 'Quitter',
                  onPressed: () {
                    SystemNavigator.pop();
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
