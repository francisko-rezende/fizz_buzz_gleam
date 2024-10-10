import gleam/int
import gleam/io
import gleam/list
import gleam/result
import gleam/string
import simplifile

pub fn main() {
  // relative to the projects root
  let numbers_filepath = "./numbers.txt"

  let evaluate_numbers = fn(number: Int) -> String {
    case number % 3, number % 5 {
      0, 0 -> "fizzbuzz"
      0, _ -> "fizz"
      _, 0 -> "buzz"
      _, _ -> int.to_string(number)
    }
  }

  let handle_file_read = fn(numbers_string: String) -> Nil {
    numbers_string
    |> string.split(",")
    |> list.map(fn(string) { int.parse(string) })
    |> list.map(fn(item) { result.unwrap(item, 0) })
    |> list.map(evaluate_numbers)
    |> io.debug()
    Nil
  }

  case simplifile.read(from: numbers_filepath) {
    Ok(numbers) -> handle_file_read(numbers)
    Error(error) -> simplifile.describe_error(error) |> io.println_error()
  }
}
