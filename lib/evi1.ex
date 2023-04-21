defmodule Evi1 do

  def exec(str) do
    contenido = (
      str
      |> to_charlist()
      |> :scanner.string()
      |> elem(1)
      |> Enum.map(fn {token, cl} ->
        case token do
          :keyword -> "<code style=\"color:blue\">#{to_string(cl)}</code>"
          :identifier -> "<code style=\"color:lightblue\">#{to_string(cl)}</code>"
          :normal -> "<code style=\"color:white\">#{to_string(cl)}</code>"
          :string -> "<code style=\"color:purple\">#{to_string(cl)}</code>"
          :integer -> "<code style=\"color:lightgreen\">#{to_string(cl)}</code>"
          :float -> "<code style=\"color:lightgreen\">#{to_string(cl)}</code>"
          :comment -> "<code style=\"color:green\">#{to_string(cl)}</code>"
          :breakLine -> "\n"
          _ -> "<code style=\"color:red\">#{to_string(cl)}</code>"
        end

      end)
      |> Enum.join()
    )

    htmlIni = """
      <!DOCTYPE html>
      <html lang="en">
      <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Document</title>
      </head>
      <body>
        <pre style="background-color:black; font-size:20px">
      """
    htmlFin = """
      \n</pre>
      </body>
      </html>
      """


    File.write("resultado.html", htmlIni <> contenido <> htmlFin )

  end




end
