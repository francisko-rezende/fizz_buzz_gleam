import gleam/io
import simplifile

pub fn main() {
  let numbers_filepath = "./numbers.txt"
  // relative to the projects root

  case simplifile.read(from: numbers_filepath) {
    Ok(numbers) -> io.println(numbers)
    Error(error) -> simplifile.describe_error(error) |> io.println_error()
  }
}
