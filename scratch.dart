import 'dart:io';

void main() {
  performTasks();
}

void performTasks() async {
  task1();
  String data=await task2();
  task3(data);
}

void task1() {
  String result = 'task 1 data';
  print('Task 1 complete');
}

Future<String>  task2() async {
  String result;
  Duration three=Duration(seconds:3);
  await Future.delayed(three,(){
     result = 'task 2 data';
    print('Task 2 complete');
  });
  //sleep(three);
  return result;
}

void task3(String data) {
  String result = 'task 3 data';
  print('Task 3 complete with $data');
}