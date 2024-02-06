-- defines the options that can be selected in the game

OPTIONS = {}

table.insert(
    OPTIONS, 
    {
        name = "Alan Turing",
        image = "images/alanturing.png",
        text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse elementum placerat feugiat. Mauris eget pulvinar ante, a ultricies risus. Nunc condimentum id massa vitae facilisis. Ut iaculis tellus urna, ut maximus quam ultricies non. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer accumsan ornare dui, in tempor velit vestibulum et. Pellentesque viverra ligula in efficitur convallis. Etiam et quam vel est aliquam volutpat eget non leo. Maecenas at interdum nulla."
    }
)

table.insert(
    OPTIONS,
    {
        name = "Ada Lovelace",
        image = "images/adalovelace.png",
        text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse elementum placerat feugiat. Mauris eget pulvinar ante, a ultricies risus. Nunc condimentum id massa vitae facilisis. Ut iaculis tellus urna, ut maximus quam ultricies non. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer accumsan ornare dui, in tempor velit vestibulum et. Pellentesque viverra ligula in efficitur convallis. Etiam et quam vel est aliquam volutpat eget non leo. Maecenas at interdum nulla."
    }
)

table.insert(
    OPTIONS,
    {
        name = "Margaret Hamilton",
        image = "images/margarethamilton.png",
        text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Suspendisse elementum placerat feugiat. Mauris eget pulvinar ante, a ultricies risus. Nunc condimentum id massa vitae facilisis. Ut iaculis tellus urna, ut maximus quam ultricies non. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Integer accumsan ornare dui, in tempor velit vestibulum et. Pellentesque viverra ligula in efficitur convallis. Etiam et quam vel est aliquam volutpat eget non leo. Maecenas at interdum nulla."
    }
)

-- stores size of table
n_options = 0
for _ in pairs(OPTIONS) do n_options = n_options + 1 end