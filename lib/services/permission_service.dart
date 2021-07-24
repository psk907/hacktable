import 'package:flutter/material.dart';
import 'package:hacktable/utils/enums.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PermissionService extends ChangeNotifier {
  PermissionState _permissionState = PermissionState.none;
  List<Permission> _neededPermissions = [
    Permission.sms,
    Permission.phone,
    Permission.locationWhenInUse,
  ];

  SharedPreferences _prefs;
  PermissionState get permissionState => _permissionState;

  PermissionService.instance() {
    _permissionState = PermissionState.none;

    checkForPermissions();
    notifyListeners();
  }

  Future checkForPermissions() async {
    bool _isAllGranted = true;
    _neededPermissions.forEach(
      (permission) async {
        _isAllGranted &= await permission.isGranted;
      },
    );
    if (_isAllGranted) {
      _permissionState = PermissionState.granted;
    } else {
      _permissionState = PermissionState.notGranted;
    }
    notifyListeners();
  }

  Future<bool> requestPermissions() async {
    await _neededPermissions.request();
    bool _isAllGranted = true;
    _neededPermissions.forEach(
      (permission) async {
        _isAllGranted &= await permission.isGranted;
      },
    );
    if (_isAllGranted) {
      _permissionState = PermissionState.granted;
      notifyListeners();
      return true;
    } else {
      _permissionState = PermissionState.notGranted;
      notifyListeners();
      return false;
    }
  }

  _initPrefs() async {
    if (_prefs == null) _prefs = await SharedPreferences.getInstance();
  }
}
