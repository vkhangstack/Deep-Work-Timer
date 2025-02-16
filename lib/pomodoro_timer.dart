import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(const PomodoroApp());
}

class PomodoroApp extends StatelessWidget {
  const PomodoroApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: PomodoroTimer(),
    );
  }
}

class PomodoroTimer extends StatefulWidget {
  @override
  _PomodoroTimerState createState() => _PomodoroTimerState();
}

class _PomodoroTimerState extends State<PomodoroTimer> {
  // static const int workTime = 15;
  static const int workTime = 25 * 60; // 25 phút
  int remainingSeconds = workTime;
  Timer? timer;
  bool isRunning = false;

  void startTimer() {
    if (timer == null || !timer!.isActive) {
      timer = Timer.periodic(Duration(seconds: 1), (timer) {
        if (remainingSeconds > 0) {
          setState(() => remainingSeconds--);
        } else {
          timer.cancel();
          lockScreen();
          print("✅ Hết giờ! Nghỉ ngơi đi nào!");
        }
      });
      setState(() => isRunning = true);
    }
  }

  void stopTimer() {
    timer?.cancel();
    setState(() => isRunning = false);
  }

  void resetTimer() {
    timer?.cancel();
    setState(() {
      remainingSeconds = workTime;
      isRunning = false;
    });
  }

  void lockScreen() {
    if (Platform.isWindows) {
      Process.run('rundll32.exe', ['user32.dll,LockWorkStation'])
          .then((result) {
            setState(() {
              remainingSeconds = workTime;
              isRunning = false;
            });
            print("🔒 Screen Locked!");
          })
          .catchError((e) {
            print("❌ Failed to lock screen: $e");
          });
    }

    if (Platform.isLinux) {
      Process.run('sh', [
            '-c',
            'gnome-screensaver-command -l || xdg-screensaver lock || loginctl lock-session',
          ])
          .then((result) {
            setState(() {
              remainingSeconds = workTime;
              isRunning = false;
            });
            print("🔒 Screen Locked!");
          })
          .catchError((e) {
            print("❌ Failed to lock screen: $e");
          });
    }
  }

  @override
  Widget build(BuildContext context) {
    int minutes = remainingSeconds ~/ 60;
    int seconds = remainingSeconds % 60;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "🍅 Deep Work Timer",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
        ),
        primary: true,
        toolbarHeight: 42,
      ),
      // floatingActionButton: BackButton(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}",
              style: TextStyle(
                fontSize: 48,
                fontFamily: 'BLock',
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 12),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: isRunning ? null : startTimer,
                  child: Text(isRunning ? "Pause" : "Start"),
                ),
                SizedBox(width: 10, height: 10),
                // ElevatedButton(onPressed: resetTimer, child: Text("Reset")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
