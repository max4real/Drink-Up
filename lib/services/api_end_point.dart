class ApiEndPoint {
  String baseUrl = "https://www.thecocktaildb.com/api/json/v1/1";
  String ingredientImageBaseUrl="https://www.thecocktaildb.com/images/ingredients";// '/gin-Medium.png'

  String getAllIngredientsUrl = "/list.php?i=list";
  String getDrinkByIngredientsUrl ="/filter.php?i="; //voka
  String getDrinkDetailUrl ="/lookup.php?i="; //id
}
