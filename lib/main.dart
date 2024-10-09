import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:todo_app/pages/home/home_page.dart';
import 'package:todo_app/provider/task_group_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://dgdvlxhvrvyvyifvjbgk.supabase.com',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImRnZHZseGh2cnZ5dnlpZnZqYmdrIiwicm9sZSI6ImFub24iLCJpYXQiOjE3Mjg0MzQ2NjAsImV4cCI6MjA0NDAxMDY2MH0.NHEl9LCh8A5B2NzweKm0y3_JKfs0eOLJZCwAk3iAQHI',
  );

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context)=> TaskGroupProvider(),)]
       )
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Task APP',
      themeMode: ThemeMode.dark,
      theme: ThemeData.light(
        useMaterial3: false,
      ),
      darkTheme: ThemeData.dark(
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
