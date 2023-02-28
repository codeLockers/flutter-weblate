import 'dart:io';
import 'package:analyzer/dart/analysis/results.dart';
import 'package:analyzer/dart/analysis/utilities.dart';
import 'package:analyzer/dart/ast/ast.dart';
import 'package:analyzer/dart/ast/visitor.dart';

main(List<String> args) {
  read(File("main.dart"));
}

read(File file) async {
//   Directory dir = Directory('.');
// // execute an action on each entry
//   dir.list(recursive: false).forEach((f) {
//     print(f);
//   });

  // print(file.readAsStringSync());
  String content = file.readAsStringSync();
  // final a = await file.readAsLines();

  // print("🐟🐟 count = ${a.length}");

  // a.forEach((element) {
  //   print("🐟🐟 element = ${element}");

  //   ParseStringResult result = parseString(content: element);

  //   CompilationUnit unit = result.unit;

  //   print("🐟🐟 unit = ${unit.lineInfo.lineCount}");
  //   unit.visitChildren(MyVisitor());
  // });

  // print("🐟🐟 content = ${content}");

  // RegExp regExp = RegExp("");
  ParseStringResult result = parseString(content: content);

  // print("🐟🐟 ParseStringResult = ${result}");

  CompilationUnit unit = result.unit;

  print("🐟🐟 unit = ${unit.lineInfo.lineCount}");
  unit.visitChildren(CokerVistor());
}

// class MyVisitor extends RecursiveAstVisitor {
//   @override
//   visitAnnotation(Annotation node) {
//     print("visitAnnotation");
//     return super.visitAnnotation(node);
//   }
// }

class CokerVistor extends GeneralizingAstVisitor {
  @override
  visitAdjacentStrings(AdjacentStrings node) {
    // print("🐟🐟 visitAdjacentStrings = ${node}");
    return super.visitAdjacentStrings(node);
  }

  @override
  visitNode(AstNode node) {
    // if (node.toString().startsWith("context.t(")) {

    if (node.beginToken.toString() == "context" &&
        node.childEntities.length > 3) {
      // print("🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟");
      // print("🐟🐟 childEntities = ${node.childEntities}");
      // print("0 = ${node.childEntities.first.toString()}");
      // print("1 = ${node.childEntities.toList()[1].toString()}");
      // print("2 = ${node.childEntities.last.toString()}");
      if (node.childEntities.first.toString() == "context" &&
          node.childEntities.toList()[1].toString() == "." &&
          node.childEntities.toList()[2].toString() == "t") {
        // print("🐟🐟 node = ${node.toString()}");
        final last = node.childEntities.last;
        // print("🐟🐟 last = ${last.end}");
        // print("🐟🐟 last = ${last.length}");
        // print("🐟🐟 last = ${last.offset}");
        // print("🐟🐟 last = ${last.runtimeType}");

        node.visitChildren(Coker2Vistor());
      }
    }

    // node.childEntities.forEach((element) {
    // });
    // print("🐟🐟 node = ${node.toString()}");
    // print("🐟🐟 beginToken = ${node.beginToken}");
    // print("🐟🐟 childEntities = ${node.childEntities}");
    // print("🐟🐟 end = ${node.end}");
    // print("🐟🐟 endToken = ${node.endToken}");
    // print("🐟🐟 isSynthetic = ${node.isSynthetic}");
    // print("🐟🐟 length = ${node.length}");
    // }
    return super.visitNode(node);
  }
}

class Coker2Vistor extends GeneralizingAstVisitor {
  @override
  visitAdjacentStrings(AdjacentStrings node) {
    return super.visitAdjacentStrings(node);
  }

  @override
  visitNode(AstNode node) {
    print("🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟🐟");
    print("🐟🐟 Coker2Vistor node = ${node}");
    print("🐟🐟 Coker2Vistor beginToken = ${node.beginToken}");
    print("🐟🐟 Coker2Vistor childEntities = ${node.childEntities}");
    return super.visitNode(node);
  }
}
