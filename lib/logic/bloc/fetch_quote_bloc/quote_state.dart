part of 'quote_bloc.dart';

class QuoteState extends Equatable {
  const QuoteState({this.dynamicQuote, this.staticQuote});

  final List<Quote>? staticQuote;
  final List<Quote>? dynamicQuote;

  QuoteState copywith({List<Quote>? staticQuote, List<Quote>? dynamicQuote}) {
    return QuoteState(
        staticQuote: staticQuote ?? this.staticQuote,
        dynamicQuote: dynamicQuote ?? this.dynamicQuote);
  }

  @override
  List<Object?> get props => [staticQuote, dynamicQuote];
}

class QuoteLoadedState extends QuoteState {
  QuoteLoadedState({required QuoteState state})
      : super(staticQuote: state.staticQuote, dynamicQuote: state.dynamicQuote);
}

class QuoteUpdatedState extends QuoteState {
  const QuoteUpdatedState(
      {required super.dynamicQuote, required super.staticQuote});
}

class QuoteInitial extends QuoteState {}
