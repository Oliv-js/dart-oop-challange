import 'dart:io';

// Define an interface
abstract class Readable {
  String read(String filename);
}

// Implement a class that implements the interface
class FileReader implements Readable {
  @override
  String read(String filename) {
    var file = File(filename);
    return file.readAsStringSync();
  }
}

// Define a base class
class BaseClass {
  String data;

  BaseClass(this.data);

  // Method that demonstrates the use of a loop
  String processData() {
    var result = '';
    for (var char in data.runes) {
      if (String.fromCharCode(char).contains(RegExp(r'[a-zA-Z]'))) {
        result += String.fromCharCode(char).toUpperCase();
      } else {
        result += String.fromCharCode(char);
      }
    }
    return result;
  }
}

// Subclass that overrides an inherited method
class SubClass extends BaseClass {
  SubClass(String data) : super(data);

  @override
  String processData() {
    var result = super.processData(); // Call base class method
    return result.split('').reversed.join(); // Reverse the processed data
  }
}

// Create an instance of a class initialized with data from a file
void main() {
  var fileReader = FileReader();
  var filename = 'data.txt';
  var data = fileReader.read(filename);

  // Demonstrate inheritance and method override
  var baseInstance = BaseClass(data);
  var reversedInstance = SubClass(data);

  print("Original Data: ${baseInstance.processData()}");
  print("Reversed Data: ${reversedInstance.processData()}");
}
