// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/actions/actions.dart' as action_blocks;
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom action code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:pdf/widgets.dart' as pw;
import 'package:widgets_to_image/widgets_to_image.dart';
import 'dart:html' as html;

Future sentDataToPrint(dynamic imageBytes) async {
  // Add your function code here!

  final bytes = await imageBytes.capture();

  // Create a PDF document
  final pdf = pw.Document();

  // Define ATM card size in points (85.6 mm x 54 mm approximately 242 x 153 points)
  const atmCardWidth = 242.0;
  const atmCardHeight = 153.0;

  // Add the image as a page to the PDF
  pdf.addPage(
    pw.Page(
      build: (pw.Context context) {
        return pw.Container(
          // Align the image to the top-left corner
          alignment: pw.Alignment.topLeft,
          child: pw.Image(
            pw.MemoryImage(bytes!),
            width: atmCardWidth,
            height: atmCardHeight,
          ),
        );
      },
    ),
  );

  // Convert PDF document to Uint8List
  final pdfBytes = await pdf.save();

  // Create a Blob from the PDF bytes
  final pdfBlob = html.Blob([pdfBytes], 'application/pdf');
  final pdfUrl = html.Url.createObjectUrlFromBlob(pdfBlob);

  // Open the PDF in a new browser tab
  html.window.open(pdfUrl, '_blank');

  // Optionally, revoke the URL after a delay
  Future.delayed(const Duration(seconds: 1), () {
    html.Url.revokeObjectUrl(pdfUrl);
  });
}
