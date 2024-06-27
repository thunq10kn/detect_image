Map<String, T> listToMap<T>(List<T> list) =>
    list.asMap().map((key, value) => MapEntry(key.toString(), value));
