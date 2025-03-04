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
  static int count = 0;
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
          count += 1;
          print("✅ Hết giờ! Nghỉ ngơi đi nào!");
          print("Bạn đã thêm một quả cà chua rồi nè!");
          print("Bạn đã có ${count} quả");
        }
      });
      setState(() => isRunning = true);
    }
  }

  void startTimerQuick(int minutes) {
    remainingSeconds = minutes * 60;
    isRunning = true;
    startTimer();
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
      body: Center(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  "Bạn có ${count} 🍅",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Roboto',
                    letterSpacing: 0.5,
                    fontSize: 14,
                  ),
                ),
                Padding(padding: const EdgeInsets.fromLTRB(10, 30, 0, 10)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              spacing: 10,
              children: [
                ElevatedButton(
                  onPressed: isRunning ? null : () => startTimerQuick(15),
                  style: ButtonStyle(
                    backgroundColor:
                        isRunning
                            ? null
                            : WidgetStatePropertyAll<Color>(
                              const Color.fromARGB(255, 50, 238, 245),
                            ),
                  ),
                  child: Text("15 minutes", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: isRunning ? null : () => startTimerQuick(25),
                  style: ButtonStyle(
                    backgroundColor:
                        isRunning
                            ? null
                            : WidgetStatePropertyAll<Color>(
                              const Color.fromARGB(255, 231, 228, 29),
                            ),
                  ),
                  child: Text("25 minutes", style: TextStyle(color: Colors.white)),
                ),
                ElevatedButton(
                  onPressed: isRunning ? null : () => startTimerQuick(60),
                  style: ButtonStyle(
                    backgroundColor:
                        isRunning
                            ? null
                            : WidgetStatePropertyAll<Color>(
                              const Color.fromARGB(255, 128, 228, 13),
                            ),
                  ),
                  child: Text("60 minutes", style: TextStyle(color: Colors.white)),
                ),
              ],
            ),
            SizedBox(height: 20,),
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
                  style: ButtonStyle(
                    backgroundColor:
                        isRunning
                            ? null
                            : WidgetStatePropertyAll<Color>(
                              const Color.fromARGB(255, 93, 9, 228),
                            ),
                    shadowColor:
                        isRunning
                            ? null
                            : WidgetStatePropertyAll<Color>(
                              const Color.fromARGB(255, 153, 147, 163),
                            ),
                  ),
                  child: Text(
                    isRunning ? "Pause" : "Start",
                    style: TextStyle(color: Colors.white),
                  ),
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
