import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:levy_core/core.dart';

const List<Size> screenSizes = [
  Size(360, 640),
  Size(411, 823),
  Size(443, 960),
  Size(768, 1280),
  Size(1080, 1920),
];

const String folder = 'golden_tests';

Future<void> runGoldenTestForDifferentScreenSizes({
  required WidgetTester tester,
  required Widget widget,
  required String testName,
}) async {
  for (var screenSize in screenSizes) {
    await tester.pumpWidget(
      ProviderScope(
        child: MaterialApp(
          theme: AppThemes.defaultTheme,
          home: widget,
        ),
      ),
    );

    tester.view.devicePixelRatio = 1.0;
    tester.view.physicalSize = screenSize;
    addTearDown(tester.view.resetPhysicalSize);

    await tester.pump(const Duration(milliseconds: 10000));

    await expectLater(
      find.byType(MaterialApp),
      matchesGoldenFile('$folder/${testName}_${screenSize.width}x${screenSize.height}.png'),
    );
  }
}
