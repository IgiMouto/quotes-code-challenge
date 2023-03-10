import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_code_challenge/logic/bloc/fetch_quote_bloc/quote_bloc.dart';
import 'package:quotes_code_challenge/presentation/pages/quote_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Quotes",
          style: TextStyle(
              fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<QuoteBloc, QuoteState>(
            builder: (context, state) {
              if (state.staticQuote != null) {
                return Expanded(
                  child: ListView.builder(
                    itemCount: state.staticQuote?.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => QuotePage(
                                quote: state.staticQuote![index],
                              ),
                            ),
                          );
                        },
                        child: Card(
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                                vertical: 10, horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Flexible(
                                  child: Text(
                                    state.staticQuote![index].author!,
                                    style: const TextStyle(
                                        fontSize: 30,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Flexible(
                                  child: Text(
                                    state.staticQuote![index].content!,
                                    style: const TextStyle(
                                        color: Colors.blue,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              }
              return Container();
            },
          )
        ],
      ),
    );
  }
}
