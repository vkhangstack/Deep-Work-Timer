import 'package:flutter/material.dart';

class PageNotFound extends StatelessWidget {
  const PageNotFound({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            children: [
              SizedBox(height: 80),
              Text(
                "Thiết bị chưa được hỗ trợ",
                style: TextStyle(color: Colors.red, fontSize: 23),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
