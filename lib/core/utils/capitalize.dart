String capitalize(String input) {
  if (input.isEmpty) {
    return input; // Return unchanged if the string is empty
  }

  return input[0].toUpperCase() + input.substring(1);
}
