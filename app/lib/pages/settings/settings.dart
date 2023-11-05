import 'package:app/components/notificationsBlock/NotificationsBlock.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Настройки'),
      ),
      body: const SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              NotificationsBlock(title: 'Уведомления', subtitle: 'Уведомления работают только при автообновлении расписаний', icon: Icons.notification_add),
            ],
          ),
        ),
      ),
    );
  }
}
