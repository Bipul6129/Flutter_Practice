import 'package:flutter/material.dart';

class TabMaterial extends StatelessWidget {
  const TabMaterial({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: DefaultTabController(length: 3, child: TabScaffold()),
    );
  }
}

class TabScaffold extends StatelessWidget {
  const TabScaffold({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: const TabBar(tabs: [
          Icon(Icons.bus_alert_outlined),
          Icon(Icons.table_bar_outlined),
          Icon(Icons.access_alarm_outlined)
        ]),
      ),
      body: const TabBarView(children: [
        Center(
          child: Text('BUS'),
        ),
        Center(
          child: Text('Table'),
        ),
        Center(
          child: Text('Alarm'),
        ),
      ]),
    );
  }
}
