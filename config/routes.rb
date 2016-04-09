Rails.application.routes.draw do
  
  get 'usuario/perfil'

  resources :mensagemconversas
  resources :prodorcarealizados
  resources :orcamentoempresas
  resources :grupopermissaousers
  resources :grupopermissaos
  resources :dadosusers
  resources :situacaoorcamentos
  resources :produtos
  resources :tipoprodutos
  resources :telefones
  resources :empresas
  resources :enderecos
  resources :bairros
  resources :cidades
  resources :estados
  devise_for :users
    
  resources :orcamentorealizados do
    member do
      get :receber_orcamento   
    end
  end

  resources :orcamentos do
    member do 
      get :showorcamentorealizado
    end 
  end
  
 resources :conversas do
    member do 
      get :create_conversa
    end 
  end
  
  get 'static_pages/home'
  root 'static_pages#home'
  match '/listarCidade', to: 'cidades#get_cities', via: 'get'
  match '/listarBairro', to: 'bairros#get_bairros', via: 'get'

  get 'downloadapk'=> 'usuario#download_apk'

  get 'busca' => 'produtos#search'
  get 'criaOrcamento' => 'orcamentos#create_orcamento'
  get '/criaChaveAcesso' => 'usuario#gera_chaveacesso'
  match '/validaUsuario', to: 'usuario#valida_usuario', via: 'get'

  match '/cadastrar_prodorcamento', to: 'produtos#cadastrar_produto_orcamento', via: 'get'
  match '/carregaOrcamentoProduto', to: 'produtos#carrega_produto_orcamento', via: 'get'
  match '/exclui_prodorcamento', to: 'produtos#exclui_produto_orcamento', via: 'get'
  

  match '/cadastrar_prodorcarealizado', to: 'prodorcarealizados#cadastrar_produto_realizado', via: 'get'
  match '/carregaOrcamentoProdutoRealizado', to: 'prodorcarealizados#carrega_produto_realizado', via: 'get'
  match '/exclui_prodoreazado', to: 'prodorcarealizados#exclui_produto_realizado', via: 'get'

  match '/busca_produto', to: 'produtos#busca_produto', via: 'get'
  get 'buscaproduto' => 'produtos#busca'
  match '/carregaMensagens', to: 'conversas#carrega_mensagens', via: 'get'
  match '/envia_mensagem', to: 'conversas#envia_mensagem', via: 'get'

  match '/orcamentosrealizados', to: 'orcamentoempresas#orcamentorecebidos', via: 'get'
  
end
