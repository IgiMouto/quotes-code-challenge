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
      final currentQuote = state.staticQuote.toList();
      currentQuote.remove(event.quote);

      emit(QuoteLoadedState(state: state.copywith(staticQuote: currentQuote)));
    } catch (e) {
      throw Exception(e);
    }
  }
}
