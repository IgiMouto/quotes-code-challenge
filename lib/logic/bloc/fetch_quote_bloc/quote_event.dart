part of 'quote_bloc.dart';

abstract class QuoteEvent extends Equatable {
  const QuoteEvent();

  @override
  List<Object> get props => [];
}

class QuoteFetching extends QuoteEvent {}

class QuoteDeleting extends QuoteEvent {
  final Quote quote;
  const QuoteDeleting({required this.quote});
}

class QuoteUpdating extends QuoteEvent {
  final Quote quote;
  final String newContent;

  const QuoteUpdating({required this.quote, required this.newContent});
}

class QuoteOnChanged extends QuoteEvent {
  final String content;

  QuoteOnChanged(this.content);
}
