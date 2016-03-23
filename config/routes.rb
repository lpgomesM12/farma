Rails.application.routes.draw do
  resources :dadosusers
  resources :situacaoorcamentos
  resources :prodorcarealizados
  resources :orcamentorealizados
  resources :orcamentos
  resources :produtos
  resources :tipoprodutos
  resources :telefones
  resources :empresas
  resources :enderecos
  resources :bairros
  resources :cidades
  resources :estados
  devise_for :users
  
  get 'static_pages/home'
  root 'static_pages#home'
  match '/listarCidade', to: 'cidades#get_cities', via: 'get'
  match '/listarBairro', to: 'bairros#get_bairros', via: 'get'

  get 'busca' => 'produtos#search'
  get 'criaOrcamento' => 'orcamentos#create_orcamento'

  match '/cadastrar_prodorcamento', to: 'produtos#cadastrar_produto_orcamento', via: 'get'
  match '/carregaOrcamentoProduto', to: 'produtos#carrega_produto_orcamento', via: 'get'
  match '/exclui_prodorcamento', to: 'produtos#exclui_produto_orcamento', via: 'get'

  
end
