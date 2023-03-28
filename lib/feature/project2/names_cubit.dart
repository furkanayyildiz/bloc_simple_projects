import 'package:flutter_bloc/flutter_bloc.dart';
import "dart:math" as math show Random;

extension RandomElement<T> on Iterable<T> {
  T getRandomElement() => elementAt(math.Random().nextInt(length));
}

class NamesCubit extends Cubit<String?> {
  final Iterable<String> userList;
  NamesCubit({required this.userList}) : super(null);

  void getRandomName() => emit(userList.getRandomElement());
}
