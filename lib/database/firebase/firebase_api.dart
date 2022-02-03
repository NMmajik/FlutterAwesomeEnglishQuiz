import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_toeic_quiz/database/firebase/firebase_file.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class FirebaseApi {
  static Future<List<FirebaseFile>> listAllFile(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    final urls = await _getDownloadLinks(result.items);
    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);
          return MapEntry(index, file);
        })
        .values
        .toList();
  }

  static Future<String> getMainFileItemList() async {
    final path = "/resource_files/toeic_book/items_summary.json";
    final ref = FirebaseStorage.instance.ref(path);
    final Uint8List? downloadedData = await ref.getData();
    return utf8.decode(downloadedData!);
  }

  static Future<String> getDownloadUrl(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    return await ref.getDownloadURL();
  }

  static Future<FirebaseFile> getDownloadFileFromUrl(String filePath) async {
    final ref = FirebaseStorage.instance.ref(filePath);
    String url = await ref.getDownloadURL();
    print('getDownloadFileFromUrl: url: $url');
    return FirebaseFile(name: ref.name, url: url, ref: ref);
  }

  static Future<List<FirebaseFile>> listAllFolder(String path) async {
    final ref = FirebaseStorage.instance.ref(path);
    final result = await ref.listAll();
    result.prefixes.forEach((Reference ref) {
      print('Found directory: $ref');
    });
    final urls = await _getDownloadLinks(result.prefixes);
    return urls
        .asMap()
        .map((index, url) {
          final ref = result.items[index];
          final name = ref.name;
          final file = FirebaseFile(ref: ref, name: name, url: url);
          return MapEntry(index, file);
        })
        .values
        .toList();
  }

  static Future<List<String>> _getDownloadLinks(List<Reference> refs) {
    return Future.wait(refs.map((e) => e.getDownloadURL()).toList());
  }

  static Future downloadFile(Reference ref) async {
    final dir = await getApplicationDocumentsDirectory();
    String urlFile = dir.path + '/' + ref.fullPath;
    print('downloadFile() save local url: $urlFile');
    print('downloadFile() full path: ${ref.fullPath}');
    final file = File(urlFile);
    if (await File(urlFile).exists()) {
      print('downloadFile file already exits: $urlFile');
      return;
    }
    await _createFolder(urlFile.replaceAll(ref.name, ''));
    try {
      await ref.writeToFile(file);
    } on FirebaseException catch (e) {
      // e.g, e.code == 'canceled'
      print('downloadFile exception ${e.code}');
    }
  }

  static Future _createFolder(String pathStr) async {
    final path = Directory(pathStr);
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
    if (await Permission.storage.isPermanentlyDenied) {
      openAppSettings();
    }
    if ((await path.exists())) {
      // TODO:
      print("_createFolder exist");
    } else {
      // TODO:
      print("_createFolder not exist , create path");
      path.create(recursive: true);
    }
  }
}
