# News Aggregator - Desafio de Código Ruby on Rails

Esta é uma pequena aplicação web construída com Ruby on Rails que funciona como um agregador de notícias.

## Funcionalidades

* Autenticação de usuários (cadastro, login, logout) com a gem Devise.
* Busca de notícias em tempo real utilizando a [NewsAPI.org](https://newsapi.org/).
* Lista de "Ler Mais Tarde" individual para cada usuário.
* Usuários podem salvar e remover artigos de sua lista.

## Tech Stack

* **Ruby on Rails 8.0.2**
* **Ruby 3.3.4** (ou a versão que você usou)
* **Devise** para autenticação
* **HTTParty** para integração com a API externa
* **SQLite3** como banco de dados de desenvolvimento
* **ERB** para as views

## Instruções para Setup Local

1.  **Pré-requisitos:**
    * Ruby (versão X.X.X)
    * Bundler
    * Node.js e Yarn

2.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git](https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git)
    cd news_aggregator
    ```

3.  **Instale as dependências:**
    ```bash
    bundle install
    yarn install
    ```

4.  **Configure a Chave de API:**
    * Obtenha uma chave gratuita em [NewsAPI.org](https://newsapi.org/).
    * Crie um arquivo `.env` na raiz do projeto:
    ```
    NEWS_API_KEY="SUA_CHAVE_AQUI"
    ```

5.  **Crie e migre o banco de dados:**
    ```bash
    rails db:create
    rails db:migrate
    ```

6.  **Inicie o servidor:**
    ```bash
    bin/dev
    ```
    A aplicação estará disponível em `http://localhost:3000`.

## Decisões de Design

* **Service Object (`NewsApiService`)**: A lógica de comunicação com a API externa foi encapsulada em um Service Object. Isso mantém o controller "enxuto" (thin), melhora a organização do código e facilita a realização de testes futuros.
* **Devise para Autenticação**: Optei por usar a gem Devise por ser o padrão da comunidade Rails. Ela fornece uma solução de autenticação robusta e segura, permitindo focar na lógica de negócio principal da aplicação.
* **Uso de Variáveis de Ambiente**: A chave da API é gerenciada através de variáveis de ambiente (`dotenv-rails`) para seguir as melhores práticas de segurança e não expor credenciais no código-fonte.