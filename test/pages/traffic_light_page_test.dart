import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests_flutter/pages/traffic_light_page.dart';
import 'package:widget_tests_flutter/viewmodel/traffic_light_viewmodel.dart';
import 'package:widget_tests_flutter/widgets/light_widget.dart';

Widget createTrafficLightScreen() =>
    ChangeNotifierProvider<TrafficLightViewmodel>(
      create: (_) => TrafficLightViewmodel(),
      child: const MaterialApp(home: TrafficLightPage()),
    );

void main() {
  group('Traffic Light Home Page Tests | ', () {
    testWidgets('Check if everything is in the right place', (tester) async {
      await tester.pumpWidget(createTrafficLightScreen());

      expect(find.text('Traffic Light Test'), findsOneWidget);
      expect(find.byKey(Key('red_light')), findsOneWidget);
      expect(find.byKey(Key('yellow_light')), findsOneWidget);
      expect(find.byKey(Key('green_light')), findsOneWidget);

      final green = tester.widget<LightWidget>(
        find.byKey(const Key('green_light')),
      );
      final red = tester.widget<LightWidget>(
        find.byKey(const Key('red_light')),
      );
      final yellow = tester.widget<LightWidget>(
        find.byKey(const Key('yellow_light')),
      );

      expect(green.lightColor, equals(Colors.green));
      expect(red.lightColor, equals(Colors.red));
      expect(yellow.lightColor, equals(Colors.yellow));
    });

    testWidgets('Function for red traffic light', (tester) async {
      await tester.pumpWidget(createTrafficLightScreen());

      await tester.tap(find.byKey(Key('stop_btn')));
      await tester.pumpAndSettle();

      final red = tester.widget<LightWidget>(find.byKey(Key('red_light')));
      expect(red.lightColor, equals(Colors.red));
    });
    testWidgets('Function for green traffic light', (tester) async {
      await tester.pumpWidget(createTrafficLightScreen());

      await tester.tap(find.byKey(Key('continue_btn')));
      await tester.pump();

      final green = tester.widget<LightWidget>(find.byKey(Key('green_light')));
      expect(green.lightColor, equals(Colors.green));
    });
  });
}
