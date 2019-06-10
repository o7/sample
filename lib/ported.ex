defmodule Sample.Ported do
  defmacro __using__(with: imports) do
    imports = Macro.expand(imports, __CALLER__)

    Enum.map(imports, fn mod ->
      if Code.ensure_compiled?(mod) do
        upcased = Module.concat([String.upcase(to_string(mod))])

        quote do
          import unquote(upcased)
          alias unquote(mod), as: unquote(upcased)
        end
      end
    end)
  end
end
