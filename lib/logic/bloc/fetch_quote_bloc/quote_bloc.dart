import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes_code_challenge/data/models/quote_model.dart';
import 'package:quotes_code_challenge/data/repositories/quote_repositories.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc(this.quoteRepository)
      : super(const QuoteState(dynamicQuote: [], staticQuote: [])) {
    on<QuoteFetching>(_onQuoteFetching);
    on<QuoteDeleting>(_onQuoteDeleting);
    on<QuoteUpdating>(_onQuoteUpdating);
    on<QuoteOnChanged>(_onQuoteOnChanged);
  }
  final QuoteRepository quoteRepository;

  FutureOr<void> _onQuoteFetching(
      QuoteFetching event, Emitter<QuoteState> emit) async {
    try {
      final quoteFetchingResponse = await quoteRepository.fetchQuotes();
      emit(state.copywith(staticQuote: quoteFetchingResponse));
    } catch (e) {
      throw Exception(e);
    }
  }

  FutureOr<void> _onQuoteDeleting(
      QuoteDeleting event, Emitter<QuoteState> emit) async {
    try {
      final currentQuote = state.staticQuote?.toList();
      currentQuote?.remove(event.quote);

      emit(QuoteLoadedState(state: state.copywith(staticQuote: currentQuote)));
    } catch (e) {
      throw Exception(e);
    }
  }

  FutureOr<void> _onQuoteUpdating(
      QuoteUpdating event, Emitter<QuoteState> emit) {
    try {
      final currentQuote = state.staticQuote!.toList();
      for (var element in currentQuote) {
        if (element.id == event.quote.id) {
          element.content = event.newContent;
        }
      }
      emit(QuoteInitial());
      emit(QuoteUpdatedState(
          dynamicQuote: currentQuote, staticQuote: currentQuote));
    } catch (e) {
      throw Exception(e);
    }
  }

  FutureOr<void> _onQuoteOnChanged(
      QuoteOnChanged event, Emitter<QuoteState> emit) {
    final currentContent = event.content;
  }
}
