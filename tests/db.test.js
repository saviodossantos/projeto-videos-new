const mockQuery = jest.fn()
const mockCreateConnection = jest.fn(async () => ({ query: mockQuery }))

jest.mock("mysql2/promise", () => ({
    createConnection: mockCreateConnection
}))

jest.mock("express-session", () => jest.fn())
jest.mock("express-mysql-session", () => jest.fn(() => jest.fn()))

const db = require("../db/db")

beforeEach(() => {
    mockQuery.mockReset()
    mockCreateConnection.mockClear()
})

describe("operações de filmes", () => {
    test("selectFilmes retorna todos os filmes", async () => {
        const filmes = [{ filmes_id: 1 }]
        mockQuery.mockResolvedValue([filmes])

        await expect(db.selectFilmes()).resolves.toEqual(filmes)
        expect(mockQuery).toHaveBeenCalledWith("SELECT * FROM filmes")
    })

    test("selectPromo filtra filmes em promoção", async () => {
        mockQuery.mockResolvedValue([[{ filmes_id: 2, promo: 1 }]])

        await db.selectPromo()

        expect(mockQuery).toHaveBeenCalledWith("SELECT * FROM filmes where promo=1")
    })

    test("selectSingle usa o id informado", async () => {
        mockQuery.mockResolvedValue([[]])

        await db.selectSingle(7)

        expect(mockQuery).toHaveBeenCalledWith(
            "SELECT * FROM filmes WHERE filmes_id=?",
            [7]
        )
    })

    test("updatePromo atualiza a promoção do filme", async () => {
        const result = { affectedRows: 1 }
        mockQuery.mockResolvedValue(result)

        await expect(db.updatePromo(1, 7)).resolves.toBe(result)
        expect(mockQuery).toHaveBeenCalledWith(
            "UPDATE filmes set promo=? Where filmes_id=?",
            [1, 7]
        )
    })

    test("insertFilmes envia os campos na ordem do INSERT", async () => {
        mockQuery.mockResolvedValue([{ insertId: 3 }])

        await db.insertFilmes({
            titulo: "Filme",
            genero: "Drama",
            Ano: 2024,
            sinopse: "Resumo",
            imagem: "filme",
            promo: 0,
            valor: 20
        })

        expect(mockQuery).toHaveBeenCalledWith(
            "INSERT INTO filmes(titulo,genero,Ano,sinopse,imagem,promo,valor) VALUES (?,?,?,?,?,?,?)",
            ["Filme", "Drama", 2024, "Resumo", "filme", 0, 20]
        )
    })

    test("updateProduto atualiza os dados e retorna o resultado", async () => {
        const result = { affectedRows: 1 }
        mockQuery.mockResolvedValue(result)

        await expect(db.updateProduto("Filme", "Drama", 2024, "Resumo", "capa", "trailer", 3))
            .resolves.toBe(result)
        expect(mockQuery).toHaveBeenCalledWith(
            "UPDATE filmes set titulo = ?,genero = ?,Ano = ?,sinopse = ?,imagem = ?,promo = ?,valor = ?,trailer = ?  Where filmes_id = ?",
            ["Filme", "Drama", 2024, "Resumo", "capa", "trailer", 3]
        )
    })

    test("deleteProduto remove pelo id", async () => {
        const result = { affectedRows: 1 }
        mockQuery.mockResolvedValue(result)

        await expect(db.deleteProduto(3)).resolves.toBe(result)
        expect(mockQuery).toHaveBeenCalledWith(
            "DELETE FROM filmes WHERE filmes_id = ?",
            [3]
        )
    })
})

describe("operações de usuários e contato", () => {
    test("selectUsers consulta email e senha", async () => {
        mockQuery.mockResolvedValue([[{ usuarios_id: 1 }]])

        await db.selectUsers("user@example.com", "senha")

        expect(mockQuery).toHaveBeenCalledWith(
            "SELECT * FROM usuarios Where email=? AND senha=?",
            ["user@example.com", "senha"]
        )
    })

    test("insertUsuarios cria um usuário", async () => {
        mockQuery.mockResolvedValue([{ insertId: 1 }])

        await db.insertUsuarios({
            nome: "Usuário",
            email: "user@example.com",
            telefone: "11999999999",
            senha: "senha",
            conf_senha: "senha",
            adm: 0
        })

        expect(mockQuery).toHaveBeenCalledWith(
            "INSERT INTO usuarios(nome,email,telefone,senha,conf_senha,adm) VALUES (?,?,?,?,?,0)",
            ["Usuário", "user@example.com", "11999999999", "senha", "senha", 0]
        )
    })

    test("insertContato cria uma mensagem", async () => {
        mockQuery.mockResolvedValue([{ insertId: 4 }])

        await db.insertContato({
            nome: "Ana",
            sobrenome: "Silva",
            email: "ana@example.com",
            mensagem: "Olá"
        })

        expect(mockQuery).toHaveBeenCalledWith(
            "INSERT INTO contato(nome,sobrenome,email,mensagem) VALUES (?,?,?,?)",
            ["Ana", "Silva", "ana@example.com", "Olá"]
        )
    })

    test("selectContato e selectUsuarios usam ordenação decrescente", async () => {
        mockQuery.mockResolvedValue([[]])

        await db.selectContato()
        await db.selectUsuarios()

        expect(mockQuery).toHaveBeenNthCalledWith(1, "SELECT * FROM contato order by contato_id DESC")
        expect(mockQuery).toHaveBeenNthCalledWith(2, "SELECT * FROM usuarios order by usuarios_id DESC")
    })
})

describe("operações administrativas", () => {
    test("selectAdm consulta credenciais administrativas", async () => {
        mockQuery.mockResolvedValue([[]])

        await db.selectAdm("admin@example.com", "senha")

        expect(mockQuery).toHaveBeenCalledWith(
            "SELECT * FROM adm Where email=? AND senha=?",
            ["admin@example.com", "senha"]
        )
    })

    test("insertAdm e cadastroAdm enviam os dados administrativos", async () => {
        mockQuery.mockResolvedValue([{ insertId: 1 }])
        const adm = {
            nome: "Admin",
            email: "admin@example.com",
            telefone: "11999999999",
            senha: "senha",
            confsenha: "senha",
            conf_senha: "senha"
        }

        await db.insertAdm(adm)
        await db.cadastroAdm(adm)

        const expected = ["Admin", "admin@example.com", "11999999999", "senha", "senha"]
        expect(mockQuery).toHaveBeenNthCalledWith(1,
            "INSERT INTO adm(nome,email,telefone,senha,confsenha) VALUES (?,?,?,?,?)",
            expected
        )
        expect(mockQuery).toHaveBeenNthCalledWith(2,
            "INSERT INTO adm(nome,email,telefone,senha,confsenha) VALUES (?,?,?,?,?)",
            expected
        )
    })
})

describe("operações do carrinho", () => {
    test("selectProdutos e selectCarrinho retornam os registros", async () => {
        mockQuery.mockResolvedValue([[]])

        await db.selectProdutos()
        await db.selectCarrinho()

        expect(mockQuery).toHaveBeenNthCalledWith(1, "SELECT * FROM filmes order by filmes_id DESC")
        expect(mockQuery).toHaveBeenNthCalledWith(2, "SELECT * FROM carrinho INNER JOIN filmes ON produto = filmes_id")
    })

    test("insertCarrinho envia serviço, produto e usuário", async () => {
        mockQuery.mockResolvedValue([{ insertId: 8 }])

        await db.insertCarrinho("mensal", 3, 2)

        expect(mockQuery).toHaveBeenCalledWith(
            "INSERT INTO carrinho (servico,produto,usuarios) VALUES (?,?,?)",
            ["mensal", 3, 2]
        )
    })

    test("deleteItemCarrinho e deleteAllCarrinho removem itens", async () => {
        mockQuery.mockResolvedValue({ affectedRows: 1 })

        await db.deleteItemCarrinho(8)
        await db.deleteAllCarrinho()

        expect(mockQuery).toHaveBeenNthCalledWith(1, "DELETE FROM carrinho WHERE carrinho_id=?", [8])
        expect(mockQuery).toHaveBeenNthCalledWith(2, "DELETE FROM carrinho")
    })
})

test("makeSession configura o middleware de sessão", async () => {
    const app = { use: jest.fn() }

    await db.makeSession(app, { tableName: "session_tbl" })

    expect(app.use).toHaveBeenCalledTimes(1)
    expect(mockCreateConnection).toHaveBeenCalledTimes(1)
})