import 'package:flutter/material.dart';
import 'package:geo_stories/Screens/Login/login_screen.dart';
import 'package:geo_stories/Screens/Signup/signup_screen.dart';
import 'package:geo_stories/Screens/Welcome/components/background.dart';
import 'package:geo_stories/components/rounded_button.dart';
import 'package:geo_stories/constants.dart';
import 'package:flutter_svg/svg.dart';

import '../../map_page.dart';

class Body extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    // This size provide us total height and width of our screen
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              "GeoStories",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.05),
            SvgPicture.asset(
              "assets/icons/geostories-logo.svg",
              height: size.height * 0.45,
            ),
            SizedBox(height: size.height * 0.05),
            RoundedButton(
              text: "Iniciar sesión",
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return LoginScreen();
                    },
                  ),
                );
              },
            ),
            RoundedButton(
              text: "Anónimo",
              color: Colors.black,
              textColor: Colors.white,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return MapPage();
                    },
                  ),
                );
              },
            ),
            /*
            RoundedButton(
              text: "Regístrate",
              color: kPrimaryLightColor,
              textColor: Colors.black,
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen();
                    },
                  ),
                );
              },
            ),
            */
          ],
        ),
      ),
    );
  }
}
