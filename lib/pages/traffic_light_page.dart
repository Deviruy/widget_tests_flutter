import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:widget_tests_flutter/viewmodel/traffic_light_viewmodel.dart';

import '../widgets/light_widget.dart';

class TrafficLightPage extends StatelessWidget {
  const TrafficLightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TrafficLightViewmodel>(
      builder: (context, vm, _) {
        return Scaffold(
          appBar: AppBar(title: Text('Traffic Light Test')),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  LightWidget(
                    key: const Key('red_light'),
                    lightColor: Colors.red,
                    isActive: vm.isRed,
                  ),
                  LightWidget(
                    key: const Key('yellow_light'),
                    lightColor: Colors.yellow,
                    isActive: vm.isYellow,
                  ),
                  LightWidget(
                    key: const Key('green_light'),
                    lightColor: Colors.green,
                    isActive: vm.isGreen,
                  ),
                ],
              ),
              const SizedBox(height: 22),
              ElevatedButton(
                key: const Key('stop_btn'),
                onPressed: () {
                  vm.turnRed();
                },
                child: Text('Stop'),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                key: const Key('continue_btn'),
                onPressed: () {
                  vm.turnGreen();
                },
                child: Text('Continue'),
              ),
            ],
          ),
        );
      },
    );
  }
}
