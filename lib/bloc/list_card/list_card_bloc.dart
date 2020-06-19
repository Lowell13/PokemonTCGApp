import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemontcgviewer/model/card_model.dart';
import 'package:pokemontcgviewer/repository/list_card/list_card_repository.dart';

class ListCardEvent {}

class ChangeListCardEvent extends ListCardEvent {
  final List<CardModel> list;

  ChangeListCardEvent(this.list);
}

class ResetListCardEvent extends ListCardEvent {}

class InitializeListCardEvent extends ListCardEvent {
  final List<CardModel> list;

  InitializeListCardEvent(this.list);
}

class ListCardState {}

class UninitializedListCardState extends ListCardState {}

class HasValueListCardState extends ListCardState {
  final List<CardModel> listCard;

  HasValueListCardState(this.listCard);
}

class ListCardBloc extends Bloc<ListCardEvent, ListCardState> {
  @override
  ListCardState get initialState => UninitializedListCardState();

  @override
  Stream<ListCardState> mapEventToState(ListCardEvent event) async* {
    if (event is InitializeListCardEvent) {
      ListCardRepository().cardList.addAll(event.list);
      ListCardRepository().duplicateCardList =
          List.unmodifiable(ListCardRepository().cardList);
    } else if (event is ResetListCardEvent) {
      ListCardRepository().cardList.clear();
      ListCardRepository()
          .cardList
          .addAll(ListCardRepository().duplicateCardList);
    } else if (event is ChangeListCardEvent) {
      ListCardRepository().cardList.clear();
      ListCardRepository().cardList.addAll(event.list);
    }
    List<CardModel> list = ListCardRepository().cardList;

    yield HasValueListCardState(list);
  }
}
