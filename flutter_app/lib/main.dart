import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'firebase_options.dart';
import 'theme.dart';
import 'pages/login_page.dart';
import 'services/auth_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  // Initialize AppConfigService first to load Google credentials
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;
  final AuthService _authService = AuthService();

  void _toggleTheme() {
    setState(() {
      _themeMode = _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BLifts',
      theme: GraniteOliveTheme.light,
      darkTheme: GraniteOliveTheme.dark,
      themeMode: _themeMode,
      home: StreamBuilder<User?>(
        stream: _authService.authStateChanges,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (snapshot.hasData) {
            // User is logged in
            return MyHomePage(
              title: 'BLifts',
              onToggleTheme: _toggleTheme,
            );
          } else {
            // User is not logged in
            return const LoginPage();
          }
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title, required this.onToggleTheme});

  final String title;
  final VoidCallback onToggleTheme;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  final AuthService _authService = AuthService();

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Future<void> _handleSignOut() async {
    await _authService.signOut();
    if (mounted) {
      Navigator.of(context).pushReplacementNamed('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final user = _authService.currentUser;
    final userName = _authService.getUserName() ?? 'User';
    final userEmail = _authService.getUserEmail() ?? '';
    final userPhotoUrl = _authService.getUserPhotoUrl();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
        actions: [
          IconButton(
            icon: Icon(
              Theme.of(context).brightness == Brightness.dark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: widget.onToggleTheme,
            tooltip: 'Toggle theme',
          ),
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'profile') {
                // Show user profile
              } else if (value == 'logout') {
                _handleSignOut();
              }
            },
            itemBuilder: (BuildContext context) => [
              PopupMenuItem<String>(
                enabled: false,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (userPhotoUrl != null)
                      CircleAvatar(
                        backgroundImage: NetworkImage(userPhotoUrl),
                        radius: 20,
                      )
                    else
                      const CircleAvatar(
                        radius: 20,
                        child: Icon(Icons.person),
                      ),
                    const SizedBox(height: 8),
                    Text(
                      userName,
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                    ),
                    Text(
                      userEmail,
                      style: Theme.of(context).textTheme.bodySmall,
                    ),
                  ],
                ),
              ),
              const PopupMenuDivider(),
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Sign Out'),
              ),
            ],
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
