void main() async {
   Stream<int> stream =  generateDataToStream();
   int result = await consumeData(stream);
   print('The sum is $result');
}

Stream<int> generateDataToStream() async* {
  int k = 0;
  for (int i = 0; i < 100; i++) {
    k = i ;
    print('The value of item = $k has been produced');
    yield k;
  }
}

Future<int> consumeData(Stream<int> stream) async {
  int sum = 0;
  await for (int i in stream) {
    sum += i;
    print('The value of item = $i has been consumed');
  }
  return sum;
}
