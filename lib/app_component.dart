import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import 'src/todo_list/todo_list_component.dart';

// AngularDart info: https://angulardart.dev
// Components info: https://angulardart.dev/components

@Component(
  selector: 'my-app',
  styleUrls: ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: [TodoListComponent, MaterialTooltipTargetDirective],
)
class AppComponent {
  // Nothing here yet. All logic is in TodoListComponent.
}
