# 📰 News Aggregator - Desafio Ruby on Rails

![Ruby](https://img.shields.io/badge/Ruby-3.3.4-CC342D?style=for-the-badge&logo=ruby)
![Rails](https://img.shields.io/badge/Rails-8.0.2-D30001?style=for-the-badge&logo=rubyonrails)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-4169E1?style=for-the-badge&logo=postgresql)
![Render](https://img.shields.io/badge/Render-46E3B7?style=for-the-badge&logo=render)

Este projeto é uma aplicação web completa construída com Ruby on Rails como parte de um desafio de código. A aplicação permite que usuários busquem notícias de uma API externa, salvem artigos para ler mais tarde e organizem seus artigos salvos com tags.

---

## 🚀 Deploy & Demonstração Ao Vivo

A aplicação está disponível para acesso e teste no Render:

**URL:** [https://news-aggregator-bozc.onrender.com/](https://news-aggregator-bozc.onrender.com/)

*(Nota: O primeiro carregamento pode levar alguns segundos enquanto o servidor do plano gratuito do Render "acorda".)*

---

## ✅ Funcionalidades Principais

* **Autenticação Completa:** Sistema de cadastro, login e logout de usuários utilizando a gem **Devise**, com views customizadas e estilizadas.
* **Busca de Notícias:** Integração em tempo real com a [NewsAPI.org](https://newsapi.org/) para buscar artigos por palavra-chave.
* **Lista de Leitura Pessoal:** Cada usuário possui sua própria lista de "Ler Mais Tarde", onde pode salvar e remover artigos.
* **Paginação Eficiente:** Os resultados da busca são paginados utilizando a gem **Pagy**, garantindo uma experiência de usuário fluida e ótima performance ao não carregar todos os resultados de uma vez.
* **Sistema de Tags:** Usuários podem adicionar múltiplas tags aos seus artigos salvos para uma melhor organização (relação Muitos-para-Muitos).
* **Filtragem por Tags:** A lista de leitura pode ser filtrada dinamicamente ao clicar em uma tag, exibindo apenas os artigos associados a ela.
* **Interface Moderna:** Interface de usuário limpa e responsiva, construída com **TailwindCSS**.

---

## 🛠️ Tech Stack & Ferramentas

| Categoria      | Tecnologia/Ferramenta                                  |
| -------------- | ------------------------------------------------------ |
| **Backend** | Ruby 3.3.4, Ruby on Rails 8.0.2, Puma                  |
| **Autenticação** | Devise                                                 |
| **Banco de Dados** | PostgreSQL (Produção & Desenvolvimento), SQLite3 (Inicial) |
| **Frontend** | ERB, TailwindCSS, Stimulus, Turbo                      |
| **APIs & HTTP**| HTTParty                                               |
| **Paginação** | Pagy                                                   |
| **Deployment** | Render                                                 |

---

## ⚙️ Instruções para Setup Local

### Pré-requisitos

* Ruby `3.3.4`
* Bundler
* PostgreSQL
* Node.js (para o runtime do JavaScript)

### Passos para Instalação

1.  **Clone o repositório:**
    ```bash
    git clone [https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git](https://github.com/SEU_USUARIO/SEU_REPOSITORIO.git)
    cd news-aggregator-app # ou o nome da sua pasta
    ```

2.  **Instale as dependências:**
    ```bash
    bundle install
    ```

3.  **Configure o Banco de Dados (PostgreSQL):**
    * Certifique-se de que o PostgreSQL está instalado e rodando na sua máquina.
    * (Se necessário) Crie um usuário no Postgres com permissões para criar bancos de dados. A configuração padrão do Rails tentará usar seu nome de usuário do sistema.
    * Crie os bancos de dados de desenvolvimento e teste:
    ```bash
    rails db:create
    rails db:migrate
    ```

4.  **Configure a Chave da API:**
    * Obtenha sua chave de API gratuita no site [NewsAPI.org](https://newsapi.org/).
    * Crie um arquivo chamado `.env` na raiz do projeto.
    * Adicione sua chave ao arquivo:
    ```
    NEWS_API_KEY="SUA_CHAVE_SECRETA_VEM_AQUI"
    ```

5.  **Inicie o servidor local:**
    ```bash
    bin/dev
    ```
    A aplicação estará disponível em `http://localhost:3000`.

---

## 🧠 Decisões de Design e Arquitetura

* **Service Object (`NewsApiService`):** A lógica de comunicação com a API externa foi encapsulada em um Service Object para manter os controllers "enxutos" (thin), melhorar a organização do código e facilitar a realização de testes e manutenções futuras.

* **PostgreSQL em Produção:** O projeto foi migrado de SQLite para PostgreSQL para garantir compatibilidade com plataformas de deploy modernas como o Render, que possuem sistemas de arquivos efêmeros.

* **Configuração para Componentes "Solid" do Rails 8:** O arquivo `database.yml` foi cuidadosamente configurado para suportar os novos backends padrão do Rails 8 (`SolidCable`, `SolidQueue`, `SolidCache`), garantindo que todos usem o mesmo banco de dados de produção e evitando a necessidade de infraestruturas externas (como o Redis) para este escopo.

* **Paginação com Pagy:** A gem Pagy foi escolhida pela sua alta performance, baixo consumo de memória e facilidade de integração, sendo a solução ideal para lidar com a paginação de resultados vindos de uma API externa.

* **Segurança de Credenciais:** A chave da API é gerenciada através de variáveis de ambiente (utilizando `dotenv-rails` em desenvolvimento e as "Environment Variables" do Render em produção) para seguir as melhores práticas de segurança e não expor dados sensíveis no código-fonte.