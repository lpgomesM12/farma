# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160328220900) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "bairros", force: :cascade do |t|
    t.string   "nome"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "cidade_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "bairros", ["cidade_id"], name: "index_bairros_on_cidade_id", using: :btree

  create_table "cidades", force: :cascade do |t|
    t.string   "nome_cidade"
    t.boolean  "flag_ativo"
    t.integer  "estado_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "cidades", ["estado_id"], name: "index_cidades_on_estado_id", using: :btree

  create_table "dadosusers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "endereco_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "dadosusers", ["endereco_id"], name: "index_dadosusers_on_endereco_id", using: :btree
  add_index "dadosusers", ["user_id"], name: "index_dadosusers_on_user_id", using: :btree

  create_table "empresas", force: :cascade do |t|
    t.string   "nome"
    t.string   "razaosocial"
    t.string   "cnpj"
    t.string   "informacao"
    t.integer  "endereco_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  add_index "empresas", ["endereco_id"], name: "index_empresas_on_endereco_id", using: :btree

  create_table "enderecos", force: :cascade do |t|
    t.string   "endereco"
    t.string   "numero"
    t.string   "cep"
    t.string   "complemento"
    t.integer  "bairro_id"
    t.integer  "cidade_id"
    t.string   "latitude"
    t.string   "longitude"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.boolean  "flag_localexato"
  end

  add_index "enderecos", ["bairro_id"], name: "index_enderecos_on_bairro_id", using: :btree
  add_index "enderecos", ["cidade_id"], name: "index_enderecos_on_cidade_id", using: :btree

  create_table "estados", force: :cascade do |t|
    t.string   "nome_estado"
    t.string   "sigl_estado"
    t.boolean  "flag_ativo"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "fotoorcamentos", force: :cascade do |t|
    t.integer  "orcamento_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "foto_file_name"
    t.string   "foto_content_type"
    t.integer  "foto_file_size"
    t.datetime "foto_updated_at"
  end

  add_index "fotoorcamentos", ["orcamento_id"], name: "index_fotoorcamentos_on_orcamento_id", using: :btree

  create_table "grupopermissaos", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "grupopermissaousers", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "grupopermissao_id"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
  end

  add_index "grupopermissaousers", ["grupopermissao_id"], name: "index_grupopermissaousers_on_grupopermissao_id", using: :btree
  add_index "grupopermissaousers", ["user_id"], name: "index_grupopermissaousers_on_user_id", using: :btree

  create_table "orcamentoempresas", force: :cascade do |t|
    t.integer  "orcamento_id"
    t.integer  "empresa_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "orcamentoempresas", ["empresa_id"], name: "index_orcamentoempresas_on_empresa_id", using: :btree
  add_index "orcamentoempresas", ["orcamento_id"], name: "index_orcamentoempresas_on_orcamento_id", using: :btree

  create_table "orcamentorealizados", force: :cascade do |t|
    t.decimal  "valor_orcamento"
    t.decimal  "valor_desconto"
    t.integer  "porcentagemdesconto"
    t.decimal  "valor_total"
    t.integer  "situacaoorcamento_id"
    t.integer  "orcamentoempresa_id"
    t.text     "mensagem"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
  end

  add_index "orcamentorealizados", ["orcamentoempresa_id"], name: "index_orcamentorealizados_on_orcamentoempresa_id", using: :btree
  add_index "orcamentorealizados", ["situacaoorcamento_id"], name: "index_orcamentorealizados_on_situacaoorcamento_id", using: :btree

  create_table "orcamentos", force: :cascade do |t|
    t.string   "nome"
    t.text     "descricao"
    t.string   "situacao"
    t.integer  "codigoorcamento"
    t.integer  "user_id"
    t.datetime "created_at",           null: false
    t.datetime "updated_at",           null: false
    t.integer  "situacaoorcamento_id"
    t.string   "latitude"
    t.string   "longitude"
    t.integer  "bairro_id"
  end

  add_index "orcamentos", ["bairro_id"], name: "index_orcamentos_on_bairro_id", using: :btree
  add_index "orcamentos", ["situacaoorcamento_id"], name: "index_orcamentos_on_situacaoorcamento_id", using: :btree
  add_index "orcamentos", ["user_id"], name: "index_orcamentos_on_user_id", using: :btree

  create_table "prodorcarealizados", force: :cascade do |t|
    t.decimal  "valor_produto"
    t.decimal  "valor_desconto"
    t.decimal  "valor_total"
    t.integer  "porcentagemdesconto"
    t.boolean  "flag_produtoemfalta"
    t.integer  "orcamentorealizado_id"
    t.integer  "produto_id"
    t.datetime "created_at",            null: false
    t.datetime "updated_at",            null: false
  end

  add_index "prodorcarealizados", ["orcamentorealizado_id"], name: "index_prodorcarealizados_on_orcamentorealizado_id", using: :btree
  add_index "prodorcarealizados", ["produto_id"], name: "index_prodorcarealizados_on_produto_id", using: :btree

  create_table "produtoorcamentos", force: :cascade do |t|
    t.integer  "orcamento_id"
    t.integer  "produto_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
  end

  add_index "produtoorcamentos", ["orcamento_id"], name: "index_produtoorcamentos_on_orcamento_id", using: :btree
  add_index "produtoorcamentos", ["produto_id"], name: "index_produtoorcamentos_on_produto_id", using: :btree

  create_table "produtos", force: :cascade do |t|
    t.string   "nome"
    t.string   "principioativo"
    t.string   "cnpj"
    t.string   "laboratorio"
    t.string   "codigoggrem"
    t.string   "registro"
    t.string   "codigobarra"
    t.string   "apresentacao"
    t.string   "classefarmaceutica"
    t.string   "restrihospitalar"
    t.integer  "tipoproduto_id"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "produtos", ["tipoproduto_id"], name: "index_produtos_on_tipoproduto_id", using: :btree

  create_table "situacaoorcamentos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "telefones", force: :cascade do |t|
    t.string   "tipo"
    t.string   "numero"
    t.integer  "empresa_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "telefones", ["empresa_id"], name: "index_telefones_on_empresa_id", using: :btree

  create_table "tipoprodutos", force: :cascade do |t|
    t.string   "nome"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "nome"
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "empresa_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["empresa_id"], name: "index_users_on_empresa_id", using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "bairros", "cidades"
  add_foreign_key "cidades", "estados"
  add_foreign_key "dadosusers", "enderecos"
  add_foreign_key "dadosusers", "users"
  add_foreign_key "empresas", "enderecos"
  add_foreign_key "enderecos", "bairros"
  add_foreign_key "enderecos", "cidades"
  add_foreign_key "fotoorcamentos", "orcamentos"
  add_foreign_key "grupopermissaousers", "grupopermissaos"
  add_foreign_key "grupopermissaousers", "users"
  add_foreign_key "orcamentoempresas", "empresas"
  add_foreign_key "orcamentoempresas", "orcamentos"
  add_foreign_key "orcamentorealizados", "orcamentoempresas"
  add_foreign_key "orcamentorealizados", "situacaoorcamentos"
  add_foreign_key "orcamentos", "bairros"
  add_foreign_key "orcamentos", "situacaoorcamentos"
  add_foreign_key "orcamentos", "users"
  add_foreign_key "prodorcarealizados", "orcamentorealizados"
  add_foreign_key "prodorcarealizados", "produtos"
  add_foreign_key "produtoorcamentos", "orcamentos"
  add_foreign_key "produtoorcamentos", "produtos"
  add_foreign_key "produtos", "tipoprodutos"
  add_foreign_key "telefones", "empresas"
  add_foreign_key "users", "empresas"
end
