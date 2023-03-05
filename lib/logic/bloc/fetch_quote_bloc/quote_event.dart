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
