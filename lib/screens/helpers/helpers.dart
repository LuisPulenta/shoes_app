import 'package:flutter/services.dart' as services;

void camabiarStatusLight() {
  services.SystemChrome.setSystemUIOverlayStyle(
      services.SystemUiOverlayStyle.light);
}

void camabiarStatusDark() {
  services.SystemChrome.setSystemUIOverlayStyle(
      services.SystemUiOverlayStyle.dark);
}
