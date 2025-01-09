import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailMovieController extends GetxController {
  // Method to launch a URL
  Future<void> openUrl(String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      Get.snackbar('Error', 'Could not launch URL',
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // Method to copy the URL to clipboard
  void copyToClipboard(String url) {
    Clipboard.setData(ClipboardData(text: url));
    Get.snackbar('Copied', 'URL copied to clipboard',
        snackPosition: SnackPosition.BOTTOM);
  }
}
