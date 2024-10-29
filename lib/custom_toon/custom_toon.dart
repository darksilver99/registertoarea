import 'package:flutter/foundation.dart';
import 'dart:html' as html;

bool isMobileBrowser() {
  if (kIsWeb) {
    final userAgent = html.window.navigator.userAgent.toLowerCase();
    return userAgent.contains('iphone') ||
        userAgent.contains('android') ||
        userAgent.contains('ipad');
  }
  return false;
}