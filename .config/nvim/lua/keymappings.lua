local wk = require("which-key")
wk.register({
    h = {
        name = "harpoon",
        x = { function() require("harpoon.mark").add_file() end, "mark file" },
        m = { function() require("harpoon.ui").toggle_quick_menu() end, "toggle menu" },
        n = { function() require("harpoon.ui").nav_next() end, "next file" },
        p = { function() require("harpoon.ui").nav_prev() end, "prev file" },
        ["#"] = { "file #" },
        ["1"] = { function() require("harpoon.ui").nav_file(1) end, "which_key_ignore" },
        ["2"] = { function() require("harpoon.ui").nav_file(2) end, "which_key_ignore" },
        ["3"] = { function() require("harpoon.ui").nav_file(3) end, "which_key_ignore" },
        ["4"] = { function() require("harpoon.ui").nav_file(4) end, "which_key_ignore" },
        ["5"] = { function() require("harpoon.ui").nav_file(5) end, "which_key_ignore" },
        ["6"] = { function() require("harpoon.ui").nav_file(6) end, "which_key_ignore" },
        ["7"] = { function() require("harpoon.ui").nav_file(7) end, "which_key_ignore" },
        ["8"] = { function() require("harpoon.ui").nav_file(8) end, "which_key_ignore" },
        ["9"] = { function() require("harpoon.ui").nav_file(9) end, "which_key_ignore" },
        ["0"] = { function() require("harpoon.ui").nav_file(0) end, "which_key_ignore" },
    },
    f = {
        name = "find",
        f = { "<cmd>Telescope find_files<cr>", "files" },
        r = { "<cmd>Telescope oldfiles<cr>", "recent" },
        a = { "<cmd>Telescope find_files hidden=true<cr>", "all" },
        g = { "<cmd>Telescope live_grep<cr>", "grep" },
        s = { "<cmd>Telescope grep_string<cr>", "grep_string" },
    },
}, { prefix = "<leader>" })
