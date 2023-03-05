import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_code_challenge/data/models/quote_model.dart';
import 'package:quotes_code_challenge/data/repositories/quote_repositories.dart';
import 'package:quotes_code_challenge/logic/bloc/fetch_quote_bloc/quote_bloc.dart';

class QuotePage extends StatelessWidget {
  const QuotePage({
    super.key,
    required this.quote,
  });
  final Quote quote;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => QuoteBloc(context.read<QuoteRepository>()),
      child: BlocListener<QuoteBloc, QuoteState>(
        listener: (context, state) {},
        child: Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: const Text(
              "Edit Quote",
              style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          body: Padding(
            padding: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.05,
                vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  quote.author,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold),
                ),
                Flexible(
                  child: TextFormField(
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                    maxLines: null,
                    initialValue: quote.content,
                    decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(5),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () {
                      context
                          .read<QuoteBloc>()
                          .add(QuoteDeleting(quote: quote));

                      Navigator.pop(context);
                    },
                    child: const Text("Delete"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
