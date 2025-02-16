import 'dart:io';

import 'package:deep_work_timer/404.dart';
import 'package:deep_work_timer/pomodoro_timer.dart';
import 'package:flutter/material.dart';
import 'package:screen_retriever/screen_retriever.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await windowManager.ensureInitialized();

  WindowOptions windowOptions = const WindowOptions(
    alwaysOnTop: true,
    titleBarStyle: TitleBarStyle.normal,
  );

  windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.setAlwaysOnTop(true);
    Rect appSize = await windowManager.getBounds();

    // Lấy kích thước màn hình
    final display = await screenRetriever.getPrimaryDisplay();

    double screenWidth = display.size.width;
    double screenHeight = display.size.height;

    // Đặt vị trí góc dưới bên phải
    final double appWidth = appSize.width;
    final double appHeight = appSize.height;
    await windowManager.setBounds(
      Rect.fromLTWH(
        screenWidth - appWidth,
        screenHeight - appHeight,
        appWidth,
        appHeight,
      ),
    );

    await windowManager.show();
    await windowManager.focus();
  });

  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    runApp(PomodoroApp());
  } else {
    runApp(PageNotFound());
  }
}
