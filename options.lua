-- defines the options that can be selected in the game

OPTIONS = {}

table.insert(
    OPTIONS, 
    {
        name = "Alan Turing",
        path = "images/alan_turing.jpg",
        texts = {
            "text1",
            "text2",
            "text3"
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Ada Lovelace",
        path = "images/ada_lovelace.jpg",
        texts = {
            "text1",
            "text2",
            "text3"
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Margaret Hamilton",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "text1",
            "text2",
            "text3"
        }
    }
)


-- stores size of table
n_options = 0
for _ in pairs(OPTIONS) do n_options = n_options + 1 end

-- getting all texts in only one
for key, option in pairs(OPTIONS) do
    OPTIONS[key].total_text = ""
    for _, text in pairs(option.texts) do
        OPTIONS[key].total_text = OPTIONS[key].total_text .. "- " .. text .. "\n\n"
    end
end