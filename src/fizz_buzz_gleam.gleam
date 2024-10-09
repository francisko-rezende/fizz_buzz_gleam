import gleam/io
import simplifile

pub fn main() {
  // relative to the projects root
  let numbers_filepath = "./numbers.txt"

  case simplifile.read(from: numbers_filepath) {
    Ok(numbers) -> io.println(numbers)
    Error(error) -> simplifile.describe_error(error) |> io.println_error()
  }
}
