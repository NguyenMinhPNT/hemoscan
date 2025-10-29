import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'scan_controller.dart';

class ScanScreen extends GetView<ScanController> {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan'), centerTitle: true),
      body: const Center(child: Text('Scan Screen - Coming Soon')),
    );
  }
}
