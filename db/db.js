const { builtinModules } = require("module")
const session = require("express-session")
const mysqlSession = require("express-mysql-session")(session)

async function makeSession(app, opt) {

    const dia = 1000 * 60 * 60 * 24;
    const min15 = 1000 * 60 * 60 / 4;
    const conectado = await conecta()

    const sessionStore = new mysqlSession(opt, conectado)
    app.use(session({
        secret: "hrgfgrfrty84fwir767",
        saveUninitialized: false,
        store: sessionStore,
        cookie: { maxAge: dia },
        resave: false
    }))
}

async function conecta() {
    const mysql = require("mysql2/promise")
    const conn = await mysql.createConnection({
        host: "localhost",
        user: "root",
        password: "",
        database: "projeto_videos_new"
    })
    global.connection = conn
    return connection
}

async function selectFilmes() {
    const conectado = await conecta()
    const [rows] = await conectado.query("SELECT * FROM filmes")
    return rows
}

async function selectPromo() {
    const conectado = await conecta()
    const [rows] = await conectado.query("SELECT * FROM filmes where promo=1")
    return rows
}

async function updatePromo(promo, id) {
    const conectado = await conecta();
    const values = [promo, id]
    return await conectado.query("UPDATE filmes set promo=? Where filmes_id=?", values)
}

async function selectSingle(id) {
    const conectado = await conecta()
    const values = [id]
    const [rows] = await conectado.query("SELECT * FROM filmes WHERE filmes_id=?", values)
    return rows
}

async function selectUsers(email, senha) {
    const conectado = await conecta()
    const values = [email, senha]
    const [rows] = await conectado.query("SELECT * FROM usuarios Where email=? AND senha=?", values)
    return rows
}

async function insertContato(contato) {
    const conectado = await conecta()
    const values = [contato.nome, contato.sobrenome, contato.email, contato.mensagem]
    const [rows] =
        await conectado.query("INSERT INTO contato(nome,sobrenome,email,mensagem) VALUES (?,?,?,?)", values)
    return rows
}

async function insertUsuarios(usuarios) {
    const conectado = await conecta()
    const values = [usuarios.nome, usuarios.email, usuarios.telefone, usuarios.senha, usuarios.conf_senha, usuarios.adm]
    const [rows] =
        await conectado.query("INSERT INTO usuarios(nome,email,telefone,senha,conf_senha,adm) VALUES (?,?,?,?,?,0)", values)
    return rows
}

async function insertFilmes(filmes) {
    const conectado = await conecta()
    const values = [filmes.titulo, filmes.genero, filmes.Ano, filmes.sinopse, filmes.imagem, filmes.promo, filmes.valor]
    const [rows] =
        await conectado.query("INSERT INTO filmes(titulo,genero,Ano,sinopse,imagem,promo,valor) VALUES (?,?,?,?,?,?,?)", values)
    return rows
}

async function selectContato() {
    const conectado = await conecta()
    const [rows] = await conectado.query("SELECT * FROM contato order by contato_id DESC")
    return rows
}

async function selectProdutos() {
    const conectado = await conecta()
    const [rows] = await conectado.query("SELECT * FROM filmes order by filmes_id DESC")
    return rows
}

// ################################## CARRINHO ##################################
// ##############################################################################
async function insertCarrinho(servico, produto, usuarios) {
    const conectado = await conecta()
    const values = [servico, produto, usuarios]
    const [rows] = await conectado.query("INSERT INTO carrinho (servico,produto,usuarios) VALUES (?,?,?)", values)
    return rows
}

async function selectCarrinho() {
    const conectado = await conecta()
    const [rows] = await conectado.query("SELECT * FROM carrinho INNER JOIN filmes ON produto = filmes_id")
    return rows
}

async function deleteItemCarrinho(id) {
    const conectado = await conecta()
    const values = [id]
    return await conectado.query("DELETE FROM carrinho WHERE carrinho_id=?", values)
}

async function deleteAllCarrinho() {
    const conectado = await conecta()
    return await conectado.query("DELETE FROM carrinho")
}

// ################################## ADM ##################################
// #########################################################################
async function selectAdm(email, senha) {
    const conectado = await conecta()
    const values = [email, senha]
    const [rows] = await conectado.query("SELECT * FROM adm Where email=? AND senha=?", values)
    return rows
}

async function insertAdm(adm) {
    const conectado = await conecta()
    const values = [adm.nome, adm.email, adm.telefone, adm.senha, adm.confsenha]
    const [rows] =
        await conectado.query("INSERT INTO adm(nome,email,telefone,senha,confsenha) VALUES (?,?,?,?,?)", values)
    return rows
}

async function cadastroAdm(adm) {
    const conectado = await conecta()
    const values = [adm.nome, adm.email, adm.telefone, adm.senha, adm.conf_senha]
    const [rows] =
        await conectado.query("INSERT INTO adm(nome,email,telefone,senha,confsenha) VALUES (?,?,?,?,?)", values)
    return rows
}

async function selectUsuarios() {
    const conectado = await conecta()
    const [rows] = await conectado.query("SELECT * FROM usuarios order by usuarios_id DESC")
    return rows
}

async function updateProduto(titulo, genero, Ano, sinopse, imagem, promo, valor, trailer, id) {
    const conectado = await conecta();
    const values = [titulo, genero, Ano, sinopse, imagem, promo, valor, trailer, id]
    return await conectado.query("UPDATE filmes set titulo = ?,genero = ?,Ano = ?,sinopse = ?,imagem = ?,promo = ?,valor = ?,trailer = ?  Where filmes_id = ?", values)
}

async function deleteProduto(id) {
    const conectado = await conecta()
    const values = [id]
    return await conectado.query("DELETE FROM filmes WHERE filmes_id = ?", values)
}

module.exports = {
    selectFilmes,
    selectPromo,
    updatePromo,
    selectSingle,
    selectCarrinho,
    insertCarrinho,
    deleteItemCarrinho,
    deleteAllCarrinho,
    selectUsers,
    selectAdm,
    insertAdm,
    cadastroAdm,
    makeSession,
    insertContato,
    insertUsuarios,
    insertFilmes,
    selectContato,
    selectProdutos,
    selectUsuarios,
    updateProduto,
    deleteProduto
}