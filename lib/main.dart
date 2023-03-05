import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_code_challenge/data/repositories/quote_repositories.dart';
import 'package:quotes_code_challenge/logic/bloc/fetch_quote_bloc/quote_bloc.dart';
import 'package:quotes_code_challenge/presentation/pages/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => QuoteRepository(),
      child: BlocProvider(
        create: (context) => QuoteBloc(context.read<QuoteRepository>()),
        child: MaterialApp(
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const HomePage(),
        ),
      ),
    );
  }
}
