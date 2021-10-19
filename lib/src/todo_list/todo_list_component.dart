import 'dart:async';
import 'dart:html';

import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';
import 'package:angular_components/laminate/ruler/dom_ruler.dart';
import 'package:angular_components/utils/browser/dom_service/dom_service.dart';

import 'todo_list_service.dart';

@Component(
  selector: 'todo-list',
  styleUrls: ['todo_list_component.css'],
  templateUrl: 'todo_list_component.html',
  directives: [
    MaterialCheckboxComponent,
    MaterialFabComponent,
    MaterialIconComponent,
    materialInputDirectives,
		// MaterialTooltipDirective needs to be added!
    MaterialTooltipDirective,
    NgFor,
    NgIf,
  ],
  providers: [
    ClassProvider(TodoListService),
		// Problem below
		ClassProvider(DomPopupSourceFactory),
		ClassProvider(DomService),
		ClassProvider(DomRuler),
		ClassProvider(Document),
		// This will bring you error!
		ClassProvider(Window),
  ],
)
class TodoListComponent implements OnInit {
  final TodoListService todoListService;

  List<String> items = [];
  String newTodo = '';

  TodoListComponent(this.todoListService);

  @override
  Future<Null> ngOnInit() async {
    items = await todoListService.getTodoList();
  }

  void add() {
    items.add(newTodo);
    newTodo = '';
  }

  String remove(int index) => items.removeAt(index);
}
