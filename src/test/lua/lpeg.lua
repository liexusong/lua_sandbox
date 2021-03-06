-- This Source Code Form is subject to the terms of the Mozilla Public
-- License, v. 2.0. If a copy of the MPL was not distributed with this
-- file, You can obtain one at http://mozilla.org/MPL/2.0/.

require("lpeg")

-- csv grammar
local field = '"' * lpeg.Cs(((lpeg.P(1) - '"') + lpeg.P'""' / '"')^0) * '"' +
                lpeg.C((1 - lpeg.S',\n"')^0)
local record = lpeg.Ct(field * (',' * field)^0) * (lpeg.P'\n' + -1)

function process ()
    output(lpeg.match(record, "1,string with spaces,\"quoted string, with comma and \"\"quoted\"\" text\""))
    write()
    return 0
end
