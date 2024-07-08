extension IterableSeparated<E> on Iterable<E> {
  Iterable<E> separated(E separator) {
    final iterator = this.iterator;
    if (!iterator.moveNext()) throw Exception();
    final value = [iterator.current];
    while (iterator.moveNext()) {
      value.add(separator);
      value.add(iterator.current);
    }
    return value;
  }
}
