# Jira Project Dashboard

Um dashboard interativo para visualizar e analisar dados de tickets do Jira, com funcionalidades de filtragem, gráficos de distribuição, tendências, principais contribuidores, e um chatbot integrado.

## Funcionalidades

*   **Dashboard Interativo**: Visão geral dos tickets do Jira.
*   **Filtros Dinâmicos**: Filtre tickets por status, prioridade, responsável, relator, tipo de item e resolução.
*   **Gráficos de Distribuição**:
    *   Tickets por Status (Gráfico de Barras)
    *   Tickets por Tipo de Item (Gráfico de Pizza)
    *   Tickets por Prioridade (Gráfico de Barras)
*   **Tendências de Tickets**: Gráfico de tendências de criação e atualização de tickets.
*   **Principais Contribuidores**: Lista dos principais responsáveis e relatores.
*   **Tickets em Andamento**: Tabela com tickets atualmente em progresso.
*   **Todos os Tickets**: Tabela completa de tickets filtrados.
*   **Modo Escuro (Dark Mode)**: Alterna entre temas claro e escuro, com preferência persistida.
*   **Chatbot Integrado**: Um assistente de IA para interagir com os dados do dashboard (requer configuração de webhook).

## Tecnologias Utilizadas

*   **Frontend**:
    *   React
    *   TypeScript
    *   Vite (para build e desenvolvimento)
    *   Tailwind CSS (para estilização)
    *   Recharts (para gráficos)
    *   Lucide React (para ícones)
*   **Processamento de Dados**:
    *   PapaParse (para parsing de CSV do Google Sheets)
*   **Containerização**:
    *   Docker
    *   Nginx (servidor de produção)

## Configuração do Projeto

### Pré-requisitos

*   Node.js (versão 20 ou superior)
*   npm (gerenciador de pacotes)
*   Docker (opcional, para rodar em contêiner)

### Instalação

1.  Clone o repositório:
    ```bash
    git clone https://github.com/wagner-korp/JIra-Dashboard.git
    cd JIra-Dashboard
    ```
2.  Instale as dependências:
    ```bash
    npm install
    ```

### Rodando Localmente

1.  Inicie o servidor de desenvolvimento:
    ```bash
    npm run dev
    ```
    O aplicativo estará disponível em `http://localhost:5173/`.

### Variáveis de Ambiente

O projeto consome as seguintes variáveis de ambiente para a URL da planilha de dados e a URL do webhook do chatbot. Para rodar localmente, você pode criar um arquivo `.env` na raiz do projeto:

`.env`
```
VITE_SPREADSHEET_URL="https://docs.google.com/spreadsheets/d/1ySkqkn6gaFRMtSqmB2FJvYYcvn02X7lhKoZYXV4c54M/export?format=csv&gid=0"
VITE_WEBHOOK_URL="https://n8n.korporate.tech/webhook/e5956a43-38c0-4087-b260-83e98b9f4715"
```
**Nota**: Os valores acima são os padrões e podem ser usados se as variáveis não forem definidas.

## Deploy no Railway

O projeto está configurado para deploy via Docker no Railway.

### Dockerfile

O `Dockerfile` utiliza um build multi-estágio:
1.  **Estágio de Build**: Constrói a aplicação React/Vite usando Node.js.
2.  **Estágio de Servidor**: Serve os arquivos estáticos compilados usando Nginx.

O Nginx é configurado para escutar na porta definida pela variável de ambiente `PORT`, que é injetada automaticamente pelo Railway.

### Variáveis de Ambiente no Railway

Ao fazer o deploy no Railway, você precisará configurar as seguintes variáveis de ambiente no painel do Railway para o seu serviço:

*   **`VITE_SPREADSHEET_URL`**: A URL da sua planilha Google Sheets (ex: `https://docs.google.com/spreadsheets/d/SEU_ID_DA_PLANILHA/export?format=csv&gid=0`).
*   **`VITE_WEBHOOK_URL`**: A URL do seu webhook para o chatbot (ex: `https://seuw.ebhook.url/`).
*   **`VITE_SUPABASE_URL`**: A URL do seu projeto Supabase (encontrada no painel do Supabase, em "Project Settings" > "API").
*   **`VITE_SUPABASE_ANON_KEY`**: A chave "anon public" do seu projeto Supabase (encontrada no painel do Supabase, em "Project Settings" > "API").

A variável `PORT` é injetada automaticamente pelo Railway e não precisa ser configurada manualmente.

## Estrutura de Pastas

```
.
├── public/
├── src/
│   ├── components/
│   │   ├── chat/
│   │   └── ... (outros componentes do dashboard)
│   ├── hooks/
│   ├── pages/
│   │   ├── Dashboard.tsx
│   │   └── Login.tsx
│   ├── data/
│   ├── utils/
│   └── supabaseClient.ts
├── Dockerfile
├── nginx.conf
├── package.json
├── package-lock.json
├── README.md
├── tailwind.config.cjs
├── tsconfig.json
├── vite.config.cjs
└── ... (outros arquivos de configuração)
```

## Créditos

Desenvolvido por Wagner Oliveira (wagner.oliveira@korporate.com.br) como parte de um projeto de dashboard Jira.
