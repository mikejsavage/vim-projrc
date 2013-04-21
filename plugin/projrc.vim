if exists( "g:projrc_loaded" )
	finish
endif

let g:projrc_loaded = 1

lua << EOF

require( "lfs" )

local dir = lfs.currentdir()
local _, n = dir:gsub( "[^/]+", "" )

for i = 0, n do
	local parent = dir .. ( "/.." ):rep( i )
	local rc = parent .. "/.vimprojrc"

	local file = io.open( rc, "r" )

	if file then
		file:close()

		vim.command( "source " .. vim.eval( ( "fnameescape( %q )" ):format( rc ) ) )
	end
end

EOF
