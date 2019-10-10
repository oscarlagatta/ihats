import 'package:ihats/models/app_state.dart';
import 'package:ihats/models/user.dart';
import 'package:ihats/state/actions.dart';

AppState appReducer(AppState state, dynamic action) {
  return AppState(
    user: userReducer(state.user, action),
    products: productsReducer(state.products, action)
  );
}

User userReducer(User user,dynamic action) {

  if (action is GetUserAction) {
    return action.user;
  }
  
  return user;
}

productsReducer(products, action) {
  if (action is GetProductsAction ) {
    return action.products;
  }

  return products;
}