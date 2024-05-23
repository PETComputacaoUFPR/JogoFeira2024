-- defines the options that can be selected in the game

OPTIONS = {}

table.insert(
    OPTIONS, 
    {
        name = "Alan Turing",
        path = "images/alan_turing.jpg",
        texts = {
            "Pai da Ciência da Computação.",
            "Fez um trabalho essencial desvendando a máquina Enigma nazista.",
            "Sofreu perseguição por ser homossexual."
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Ada Lovelace",
        path = "images/ada_lovelace.jpg",
        texts = {
            "Primeira programadora da história.",
            "Fez o primeiro algoritmo para a máquina de Babbage.",
            "Filha do poeta Lord Byron."
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Margaret Hamilton",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Escreveu o código de bordo do Apollo 11.",
            "Cientista da computação formada em matemática.",
            "Levava sua filha para o trabalho ocasionalmente, tendo jornada dupla."
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Alexandra Elbakyan",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Criadora do site Sci-Hub, que dá acesso livre a milhões de artigos científicos.",
            "Conhecida como a mãe da pirataria científica.",
            "Sofreu perseguição de empresas e governos, mas é uma heroína para muitos."
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Charles Babbage",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Desenvolveu a máquina analítica, considerada o primeiro computador.",
            "Trabalhou junto de Ada Lovelace.",
            "Cientista, matemático, engenheiro e inventor."
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Bill Gates",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Criador da Microsoft.",
            "Segundo homem mais rico do mundo.",
            "Filantropo, doou bilhões de dólares para caridade."
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Linus Torvalds",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Criador do linux e do git.",
            "Mestre em Ciência da Computação e engenheiro de software.",
            "Nascido na Finlandia e graduado pela Universidade de Helsinki."
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Tim Berners-Lee",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Escreveu o código de bordo do Apollo 11.",
            "text2",
            "text3"
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Hedy Lamarr",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Escreveu o código de bordo do Apollo 11.",
            "text2",
            "text3"
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Mary Kenneth Keller",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Escreveu o código de bordo do Apollo 11.",
            "text2",
            "text3"
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Frances Allen",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Escreveu o código de bordo do Apollo 11.",
            "text2",
            "text3"
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Edith Ranzini",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Escreveu o código de bordo do Apollo 11.",
            "text2",
            "text3"
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Susan Kare",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Escreveu o código de bordo do Apollo 11.",
            "text2",
            "text3"
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "Grace Hopper",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Escreveu o código de bordo do Apollo 11.",
            "text2",
            "text3"
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "John Carmack",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Escreveu o código de bordo do Apollo 11.",
            "text2",
            "text3"
        }
    }
)

table.insert(
    OPTIONS,
    {
        name = "George Boole",
        path = "images/margaret_hamilton.jpg",
        texts = {
            "Escreveu o código de bordo do Apollo 11.",
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