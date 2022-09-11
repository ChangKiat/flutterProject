import 'package:dynamic_color/dynamic_color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'playback/bloc/bloc.dart';
import 'providers/theme.dart';
import 'router.dart';

class MyMusic extends StatefulWidget {
  const MyMusic({super.key});

  @override
  State<MyMusic> createState() => _MyMusicState();
}

class _MyMusicState extends State<MyMusic> {
  final settings = ValueNotifier(ThemeSettings(
    sourceColor: Colors.pink, // Replace this color
    themeMode: ThemeMode.system,
  ));
  @override
  Widget build(BuildContext context) {
    return BlocProvider<PlaybackBloc>(
      create: (context) => PlaybackBloc(),
      child: DynamicColorBuilder(
        builder: (lightDynamic, darkDynamic) => ThemeProvider(
            lightDynamic: lightDynamic,
            darkDynamic: darkDynamic,
            settings: settings,
            child: NotificationListener<ThemeSettingChange>(
              onNotification: (notification) {
                settings.value = notification.settings;
                return true;
              },
              child: ValueListenableBuilder<ThemeSettings>(
                valueListenable: settings,
                builder: (context, value, _) {
                  final theme = ThemeProvider.of(context); // Add this line
                  // Create theme instance
                  return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: 'Flutter Demo',
                    // Add theme
                    theme: theme
                        .light(settings.value.sourceColor), // Add this line

                    darkTheme:
                        theme.dark(settings.value.sourceColor), // Add this line
                    themeMode: theme.themeMode(), // Add this line
                    routeInformationParser: appRouter.routeInformationParser,
                    routerDelegate: appRouter.routerDelegate,
                  );
                },
              ),
            )),
      ),
    );
  }
}
