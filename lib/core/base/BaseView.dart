import 'package:provider/provider.dart';


class BaseView<Content extends Widget, TState, ViewModel extends BaseViewModel<TState>> 
    extends StatelessWidget {
  final ViewModel Function() create;
  final Builder<Content, TState, ViewModel> builder;
  final bool navigationBarHidden;
  final bool navigationBarBackButtonHidden;

  const BaseView({
    super.key,
    required this.create,
    required this.builder,
    this.navigationBarHidden = true,
    this.navigationBarBackButtonHidden = true,
  });

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ViewModel>(
      create: (_) => create(),
      child: Consumer<ViewModel>(
        builder: (context, viewModel, child) {
          return Layout(
            child: builder(viewModel, viewModel.state),
          );
        },
      ),
    );
  }
}