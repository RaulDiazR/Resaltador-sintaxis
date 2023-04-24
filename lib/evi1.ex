defmodule Evi1 do

  def exec() do
    contenido = (
      File.read("prueba.js")
      |> elem(1)
      |> to_charlist()
      |> :scanner.string()
      |> elem(1)
      |> IO.inspect()
      |> Enum.map(fn {token, cl} ->
        case token do
          :keyword -> "<code style=\"color:#0047AB\">#{to_string(cl)}</code>"
          :identifier -> "<code style=\"color:lightblue\">#{to_string(cl)}</code>"
          :operadores -> "<code style=\"color:white\">#{to_string(cl)}</code>"
          :puntuacion -> "<code style=\"color:white\">#{to_string(cl)}</code>"
          :string -> "<code style=\"color:#E5AA70\">#{to_string(cl)}</code>"
          :number -> "<code style=\"color:lightgreen\">#{to_string(cl)}</code>"
          :comment -> "<code style=\"color:green\">#{to_string(cl)}</code>"
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
