defmodule Sample.Ported do
  defmacro __using__(with: imports) do
    imports = Macro.expand(imports, __CALLER__)

    Enum.map(imports, fn mod ->
      if Code.ensure_compiled?(mod) do
        smod = to_string(mod)
        upcased = Module.concat([String.upcase(smod)])
        capitalized = Module.concat([String.capitalize(smod)])

        quote do
          import unquote(upcased)
          alias unquote(mod), as: unquote(capitalized)
        end
      end
    end)
  end
end
