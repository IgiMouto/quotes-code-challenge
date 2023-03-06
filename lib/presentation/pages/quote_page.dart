import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:quotes_code_challenge/data/models/quote_model.dart';
import 'package:quotes_code_challenge/logic/bloc/fetch_quote_bloc/quote_bloc.dart';

class QuotePage extends StatefulWidget {
  const QuotePage({super.key, required this.quote});
  final Quote quote;

  @override
  State<QuotePage> createState() => _QuotePageState();
}

class _QuotePageState extends State<QuotePage> {
  String? newContent;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Edit Quote",
          style: TextStyle(
              fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.of(context).size.width * 0.05, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.quote.author!,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            Flexible(
              child: TextFormField(
                onChanged: (value) {
                  setState(() {
                    newContent = value;
                  });
                },
                style:
                    const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                maxLines: null,
                initialValue: widget.quote.content,
                decoration: const InputDecoration(
                  contentPadding: EdgeInsets.all(5),
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    onPressed: () async {
                      final result = await _buildDialog(context);
                      if (result) {
                        if (!mounted) return;
                        context
                            .read<QuoteBloc>()
                            .add(QuoteDeleting(quote: widget.quote));
                        Navigator.pop(context);
                      }
                    },
                    child: const Text("Delete")),
                const SizedBox(width: 30),
                ElevatedButton(
                    onPressed: () {
                      if (newContent != null) {
                        context.read<QuoteBloc>().add(QuoteUpdating(
                            quote: widget.quote, newContent: newContent!));
                      }

                      Navigator.pop(context);
                    },
                    child: const Text("Update")),
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<dynamic> _buildDialog(BuildContext context) {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text("Are you sure you want to delete?"),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, true);
                },
                child: const Text("Yes"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context, false);
                },
                child: const Text("No"),
              ),
            ],
          );
        });
  }
}
