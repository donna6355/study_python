import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',

      // routes: {
      //   "/": (_) => HomePage(),
      //   "/profile": (_) => ProfilePage(),
      //   "/project": (_) => ProjetPage(),
      // },
      onGenerateRoute: (settings) {
        final Uri uri = Uri.parse(settings.name ?? "");
        final String path = uri.path;

        Widget page;
        switch (path) {
          case '/':
            page = const HomePage();
            break;
          case '/profile':
            page = const ProfilePage();
            break;
          case '/project':
            page = const ProjetPage();
            break;
          default:
            page = Scaffold(body: Center(child: Text('ERROR')));
            break;
        }

        return PageRouteBuilder(pageBuilder: (_, _, _) => page);
      },
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('HOME')));
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Profile')));
  }
}

class ProjetPage extends StatelessWidget {
  const ProjetPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('Project')));
  }
}
