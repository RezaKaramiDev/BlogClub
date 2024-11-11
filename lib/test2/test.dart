void main() async {
  await function1();
  print('F1 is Done!');
  await function2();
  print('F2 is Done!');

  function3().then((value) => print('F3 is Done!'));
  print('All is Done');
}

Future<void> function1() {
  print('function1');
  return Future.delayed(Duration(seconds: 4));
}

Future<void> function2() {
  print('function2');
  return Future.delayed(Duration(seconds: 2));
}

Future<void> function3() {
  print('function3');
  return Future.delayed(Duration(seconds: 3));
}
