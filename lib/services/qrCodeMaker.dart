import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QRCodeGenerator extends StatefulWidget {
  @override
  _QRCodeGeneratorState createState() => _QRCodeGeneratorState();
}

class _QRCodeGeneratorState extends State<QRCodeGenerator> {
  final TextEditingController _textEditingController = TextEditingController();
  String _qrText = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Generate QR Code'),
      ),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            TextField(
              controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Enter text to encode',
              ),
            ),
            SizedBox(height: 20.0),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _qrText = _textEditingController.text;
                });
              },
              child: Text('Generate QR Code'),
            ),
            SizedBox(height: 20.0),
            Expanded(
              child: Center(
                child: _qrText.isNotEmpty
                    ? QrImage(
                        data: _qrText,
                        version: QrVersions.auto,
                        size: 200.0,
                      )
                    : const Text('No QR Code generated'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
