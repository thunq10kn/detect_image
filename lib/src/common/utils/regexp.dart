final emailRegexp = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#\$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9._-]+.[a-zA-Z]+\$");

final uriRegexp = RegExp(
    r"^(?<schema>https?)://(?<host>[\w!\?/\+\-_~=;\.,\*&@#\$%\(\)'\[\]]+):?(?<port>\d*)$");
