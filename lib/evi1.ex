defmodule Evi1 do

  # def main(args) do
  #   IO.inspect(args)
  #   [inputfile, outputfile] = args
  # end

  def main(args) do
    [inputfile, outputfile] = args
    contenido = (
      File.read(inputfile)
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
          :regex -> "<code style=\"color:#FFD700\">#{to_string(cl)}</code>"
          _ -> to_string(cl)
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
      <pre style="background-color:black; font-size:20px; color:white">

      """
    htmlFin = """
      \n</pre>
      </body>
      </html>
      """


    File.write(outputfile, htmlIni <> contenido <> htmlFin )

  end




end
