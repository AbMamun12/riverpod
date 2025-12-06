// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo_controller.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(TodoController)
const todoControllerProvider = TodoControllerProvider._();

final class TodoControllerProvider
    extends $AsyncNotifierProvider<TodoController, List<TodoModel>> {
  const TodoControllerProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'todoControllerProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$todoControllerHash();

  @$internal
  @override
  TodoController create() => TodoController();
}

String _$todoControllerHash() => r'e3ac329713ea3fd889e38fd6b8e0ae7179fc94e0';

abstract class _$TodoController extends $AsyncNotifier<List<TodoModel>> {
  FutureOr<List<TodoModel>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<List<TodoModel>>, List<TodoModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<TodoModel>>, List<TodoModel>>,
              AsyncValue<List<TodoModel>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
