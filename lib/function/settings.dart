import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('의생명융합공학부'),
        backgroundColor: const Color.fromRGBO(10, 101, 83, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('알림설정', style: TextStyle(color: Colors.black, fontSize: 20)),
            ),
            const SizedBox(height: 15),
            const Divider(),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(8),
              child: const Text('글씨크기', style: TextStyle(color: Colors.black, fontSize: 20)),
            ),
          ],
        ),
      ),
    );
  }
}
