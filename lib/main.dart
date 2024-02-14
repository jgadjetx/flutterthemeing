import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  final config = await loadConfig();

  runApp(MyApp(config));
}

Future<Map<String, dynamic>> loadConfig() async {

  final configString = await rootBundle.loadString('assets/config.json');
  final config = jsonDecode(configString) as Map<String, dynamic>;
  return config;

}

class MyApp extends StatefulWidget {
  const MyApp(this.config,{super.key});

  final Map<String, dynamic> config;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  PackageInfo _packageInfo = PackageInfo(
    appName: 'Unknown',
    packageName: 'Unknown',
    version: 'Unknown',
    buildNumber: 'Unknown',
    buildSignature: 'Unknown',
    installerStore: 'Unknown',
  );

  @override
  void initState() {
    super.initState();
    _initPackageInfo();
  }

  Future<void> _initPackageInfo() async {
    final info = await PackageInfo.fromPlatform();
    setState(() {
      _packageInfo = info;
    });
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("White Label"),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset(widget.config['APP_LOGO']),
              Text(
                widget.config['APP_NAME'],
                style: Theme.of(context).textTheme.headlineMedium,
              ),
              const Spacer(),
              Text(
                _packageInfo.packageName,
              ),
            ],
          ),
        ),
      ),
    )
      
    );
  }
}
