import 'dart:io';

import 'dart:convert';

class Docker {
  Future<void> listContainers() async {
    var result =
        await Process.run('docker', ['ps', '--format', 'json', '--no-trunc']);

    var data =
        result.stdout.toString().split("\n").map((line) => jsonDecode(line));

    var a = 1 + 1;
  }
}
