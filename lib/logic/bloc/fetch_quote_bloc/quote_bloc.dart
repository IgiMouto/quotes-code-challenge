import 'dart:async';
import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:quotes_code_challenge/data/models/quote_model.dart';
import 'package:quotes_code_challenge/data/repositories/quote_repositories.dart';

part 'quote_event.dart';
part 'quote_state.dart';

class QuoteBloc extends Bloc<QuoteEvent, QuoteState> {
  QuoteBloc(this.quoteRepository) : super(QuoteInitial()) {
    on<QuoteFetching>(_onQuoteFetching);
  }
  final QuoteRepository quoteRepository;

  FutureOr<void> _onQuoteFetching(
      QuoteFetching event, Emitter<QuoteState> emit) async {
    try {
      emit(QuoteLoadingState());

      final quoteFetchingResponse = await quoteRepository.fetchQuotes();

      if (quoteFetchingResponse != null) {
        emit(QuoteLoadedState(quote: quoteFetchingResponse));
      }
    } on SocketException {
      emit(const QuoteLoadingFailedState("Connection Problem"));
    } catch (e) {
      throw Exception(e);
    }
  }
}
