import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('GeoStories App', () {
    final ingresarAnonimoFinder = find.byValueKey('Ingresar como Anon');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    /*
    test('el texto de ingresar anónimo existe', () async {
      final textoIngresarAnonimoFinder = find.descendant(of: ingresarAnonimoFinder, matching: find.descendant(of: find.byType('FlatButton'), matching: find.byType('Text')));

      expect(await driver.getText(textoIngresarAnonimoFinder), "Ingresar como Anónimo");
    });

    test('se llega al botón de crear marker por medio de ingresar anónimo', () async {
      await driver.tap(ingresarAnonimoFinder);

      final crearMarkerFinder = find.byValueKey('boton-crear-marker');
      expect(crearMarkerFinder, isNotNull);
    });


     */
    test('Se logeo con un usuario y se crea un marker', () async {

      // WelcomePage, Login
      print("Inicia sesión");
      await driver.tap(find.byValueKey("Iniciar Sesion"));

      print("Toca Mail y ingreso el Mail");
      final textMail = find.byValueKey('Mail');
      await driver.tap(textMail);
      await driver.enterText("test@geostories.com");

      print("Toca password y ingreso la password");
      final textPass = find.byValueKey('PW');
      await driver.tap(textPass);
      await driver.enterText("password");

      print("Toca Iniciar sesion");
      await driver.tap(find.byValueKey("Iniciar Sesion"));

      print("Toca en el boton para crear el marcador");
      await driver.tap(find.byValueKey("boton-crear-marker"));

      print("Toca el mapa para seleccionar el lugar");
      await driver.tap(find.byType("FlutterMap"));

      print("Toco y completo el campo nombre");
      final textField1 = find.byValueKey('field1');
      await driver.tap(textField1);
      await driver.enterText("Prueba");

      print("Toco y completo el campo descripcion");
      final textField2 = find.byValueKey('field2');
      await driver.tap(textField2);
      await driver.enterText("Prueba2");

      print("Toco crear el marcador");
      await driver.tap(find.byType('RaisedButton'));

      print("Regreso al mapPage");
      final map = find.byType("MapPage");
      expect(map, isNotNull);

    });

  });
}