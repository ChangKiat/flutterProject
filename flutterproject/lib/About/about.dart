import 'dart:io' show Platform;
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:flutterproject/SideNavigation/sideNav.dart';
import 'package:flutterproject/tutorial1/provider/theme_provider.dart';

class About extends StatelessWidget {
  const About({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final themePlatform = Theme.of(context).platform;

    return Scaffold(
      drawer: sideNav(),
      appBar: AppBar(
        iconTheme: Theme.of(context).iconTheme,
        backgroundColor: Colors.blue,
        title: const Text('Device About'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Window Properties',
                style: Theme.of(context).textTheme.headline5),
            const SizedBox(height: 8),
            SizedBox(
              width: 350,
              child: Table(
                textBaseline: TextBaseline.alphabetic,
                children: <TableRow>[
                  _fillTableRow(
                    context: context,
                    property: 'Window Size',
                    value: '${mediaQuery.size.width.toStringAsFixed(1)} x '
                        '${mediaQuery.size.height.toStringAsFixed(1)}',
                  ),
                  _fillTableRow(
                    context: context,
                    property: 'Device Pixel Ratio',
                    value: mediaQuery.devicePixelRatio.toStringAsFixed(2),
                  ),
                  _fillTableRow(
                    context: context,
                    property: 'Platform.isXXX',
                    value: platformDescription(),
                  ),
                  _fillTableRow(
                    context: context,
                    property: 'Theme.of(ctx).platform',
                    value: themePlatform.toString(),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  TableRow _fillTableRow(
      {required BuildContext context,
      required String property,
      required String value}) {
    return TableRow(
      children: [
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.baseline,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(property),
          ),
        ),
        TableCell(
          verticalAlignment: TableCellVerticalAlignment.baseline,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(value),
          ),
        ),
      ],
    );
  }

  String platformDescription() {
    if (kIsWeb) {
      return 'Web';
    } else if (Platform.isAndroid) {
      return 'Android';
    } else if (Platform.isIOS) {
      return 'iOS';
    } else if (Platform.isWindows) {
      return 'Windows';
    } else if (Platform.isMacOS) {
      return 'macOS';
    } else if (Platform.isLinux) {
      return 'Linux';
    } else if (Platform.isFuchsia) {
      return 'Fuchsia';
    } else {
      return 'Unknown';
    }
  }
}
