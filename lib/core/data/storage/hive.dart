import 'package:filestore/core/controller/xcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:filestore/theme.dart';
import 'dart:io';

import 'package:path_provider/path_provider.dart';

class HiveLifecycleManager extends StatefulWidget {
  final Widget? child;

  const HiveLifecycleManager({Key? key, required this.child}) : super(key: key);

  @override
  HiveLifecycleManagerState createState() => HiveLifecycleManagerState();
}

class HiveLifecycleManagerState extends State<HiveLifecycleManager>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    switch (state) {
      case AppLifecycleState.resumed:
        try {
          HiveBoxProvider.close().then((value) async {
            try {
              debugPrint("HiveProvider, close re-init()");
              final Box box =
                  await HiveBoxProvider().openBox(MyTheme.hiveBoxName);
              Get.lazyPut<Box>(() => box);
              Get.lazyPut<XController>(() => XController());
              final XController x = XController.to;
              x.setBox(box);
            } catch (e) {
              debugPrint("HiveProvider, error Hive close re-init()");
            }
          });
        } catch (e) {
          debugPrint(e.toString());
        }

        break;
      case AppLifecycleState.inactive:
      case AppLifecycleState.paused:
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child!;
  }
}

class HiveBoxProvider {
  static Future<dynamic>? _initFlutterFuture;

  static Future initHive() async {
    try {
      if (_initFlutterFuture == null) {
        _initFlutterFuture = Hive.initFlutter();
        registerAdapters();
      }
      await _initFlutterFuture;
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  static Future close() async {
    _initFlutterFuture = null;
    await Hive.close();
  }

  Future<Box<TValue>> openBox<TValue>(String name) async {
    try {
      await initHive();
      return await Hive.openBox<TValue>(name);
    } catch (e) {
      await deleteBox(MyTheme.hiveBoxName);
      await restoreHiveBox(MyTheme.hiveBoxName);
      return await reOpenBox();
    }
  }

  Future deleteBox(String name) async {
    return await Hive.deleteBoxFromDisk(name);
  }

  static void registerAdapters() {
    // ... add adapters here
    //_registerAdapter(MyAdapter());
  }

  static void registerAdapter<T>(TypeAdapter<T> adapter) {
    if (!Hive.isAdapterRegistered(adapter.typeId)) {
      Hive.registerAdapter<T>(adapter);
    }
  }

  Future<void> backupHiveBox<T>(String boxName) async {
    final Directory directory = await getApplicationDocumentsDirectory();
    final String backupPath = '${directory.path}/$boxName}';
    final box = await Hive.openBox<T>(boxName);
    final boxPath = box.path;
    await box.close();

    try {
      File(boxPath!).copy(backupPath);
      debugPrint("backup Hive DB saved");
    } finally {
      //await Hive.openBox<T>(boxName);
      await restoreHiveBox(MyTheme.hiveBoxName);
    }
  }

  reOpenBox() async {
    final Box box = await HiveBoxProvider().openBox(MyTheme.hiveBoxName);
    Get.lazyPut<Box>(() => box);
    Get.lazyPut<XController>(() => XController());
    final XController x = XController.to;
    x.setBox(box);

    return box;
  }

  Future<void> restoreHiveBox<T>(String boxName) async {
    //String boxName = "${MyTheme.hiveBoxName}";
    final Directory directory = await getApplicationDocumentsDirectory();
    final String backupPath = '${directory.path}/$boxName';

    final box = await Hive.openBox<T>(boxName);
    final boxPath = box.path;
    await box.close();

    try {
      File(backupPath).copy(boxPath!);
      debugPrint("Hive DB restored");
    } finally {
      //await Hive.openBox<T>(boxName);
      await reOpenBox();
    }
  }
}
