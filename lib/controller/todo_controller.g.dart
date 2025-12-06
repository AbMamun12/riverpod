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
    extends $NotifierProvider<TodoController, List<TodoModel>> {
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

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<TodoModel> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<TodoModel>>(value),
    );
  }
}

String _$todoControllerHash() => r'bfc528b6068f74bfd355eae7443a445f7c207c21';

abstract class _$TodoController extends $Notifier<List<TodoModel>> {
  List<TodoModel> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<TodoModel>, List<TodoModel>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<TodoModel>, List<TodoModel>>,
              List<TodoModel>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
