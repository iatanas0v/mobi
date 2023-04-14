import 'package:flutter/material.dart';
import 'package:mobi/docker/docker.dart';
import 'package:mobi/ui/pages/containers.dart';

void main() {
  Docker().listContainers();
  runApp(const MyApp());
}

class AppColors {
  static Color actionBarBackground() {
    return const Color.fromRGBO(18, 39, 56, 1.0);
  }

  static Color background() {
    return const Color.fromRGBO(25, 53, 73, 1.0);
  }

  static Color foreground() {
    return const Color.fromRGBO(225, 239, 255, 1.0);
  }

  static Color actionBarForeground() {
    return const Color.fromRGBO(113, 125, 136, 1.0);
  }

  static Color actionBarActiveForeground() {
    return const Color.fromRGBO(255, 255, 255, 1.0);
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
        colorScheme: const ColorScheme.light(background: Colors.white),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

enum ApplicationScreens { containers, images }

class _HomePageState extends State<HomePage> {
  ApplicationScreens _currentScreen = ApplicationScreens.containers;

  void _setCurrentScreen(ApplicationScreens screen) {
    setState(() {
      _currentScreen = screen;
    });
  }

  Widget _currentScreenWidget() {
    switch (_currentScreen) {
      case ApplicationScreens.containers:
        return const ContainersScreen();
      case ApplicationScreens.images:
        return Text(
          'Under construction',
          style: TextStyle(color: AppColors.foreground()),
        );
      default:
        return Text(
          'Wrong',
          style: TextStyle(color: AppColors.foreground()),
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
            width: 55.0,
            color: AppColors.actionBarBackground(),
            child: Column(
              children: [
                const SizedBox(height: 10),
                IconButton(
                  onPressed: () {
                    _setCurrentScreen(ApplicationScreens.containers);
                  },
                  icon: const Icon(Icons.inventory_2),
                  color: _currentScreen == ApplicationScreens.containers
                      ? AppColors.actionBarActiveForeground()
                      : AppColors.actionBarForeground(),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  tooltip: 'Containers',
                ),
                const SizedBox(height: 20),
                IconButton(
                  onPressed: () {
                    _setCurrentScreen(ApplicationScreens.images);
                  },
                  icon: const Icon(Icons.image),
                  color: _currentScreen == ApplicationScreens.images
                      ? AppColors.actionBarActiveForeground()
                      : AppColors.actionBarForeground(),
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  hoverColor: Colors.transparent,
                  tooltip: 'Images',
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
          Expanded(
            child: Container(
              color: AppColors.background(),
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: _currentScreenWidget(),
              ),
            ),
          )
        ],
      ),
    );
  }
}
