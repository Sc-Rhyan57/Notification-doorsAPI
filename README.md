# MsDoors Api 🚪

Esse script cria um sistema de notificações avançado inspirado no estilo visual do jogo *Doors*. As notificações podem ser configuradas com bordas coloridas, ícones personalizados e uma interface animada. Com suporte a diferentes tipos de notificação (alerta, sucesso, análise, entre outros), o sistema permite customizações para uma experiência dinâmica.

## 📋 Funcionalidades
- **Notificações em Estilo "Doors"**: Notificações com um visual similar ao jogo *Doors*, com animações, cores e ícones personalizados.
- **Suporte a Diferentes Tipos**: Selecione entre `alert`, `success`, `analysis`, e `rgb`. Cada tipo possui um ícone e cor de borda diferentes.
- **Notificação Centralizada**: O script permite que notificações sejam criadas em qualquer lugar do código usando a função `DoorsEmblem`.
- **Sem Dependência da OrionLib**: As notificações não dependem do design da OrionLib, sendo totalmente independentes e customizadas.

## 📦 Instalação
Para usar o script, basta carregá-lo usando o `loadstring` do GitHub:

```lua
loadstring(game:HttpGet("https://raw.githubusercontent.com/SeuUsuario/SeuRepositorio/main/SeuArquivo.lua"))()
```

Após o carregamento, você terá acesso à função `DoorsEmblem`, que pode ser usada para criar notificações customizadas.

## 📌 Exemplos de Uso

### 1. Notificação de Alerta (Borda Vermelha)
Para criar uma notificação de alerta, com borda vermelha e um ícone específico:
```lua
DoorsEmblem({
    type = "alert",  -- Tipo de notificação
    Title = "Aviso de Perigo!",  -- Título
    Description = "Uma entidade hostil foi detectada!",  -- Descrição
    Time = 5  -- Duração da notificação em segundos
})
```

### 2. Notificação de Sucesso (Borda Verde)
Notificações de sucesso indicam um status positivo ou completado.
```lua
DoorsEmblem({
    type = "success",
    Title = "Objetivo Concluído!",
    Description = "Você completou a missão com sucesso!",
    Time = 5
})
```

### 3. Notificação de Análise (Borda Laranja)
Indicada para informações ou análises, com borda laranja.
```lua
DoorsEmblem({
    type = "analysis",
    Title = "Análise Completa",
    Description = "Os dados foram processados e estão prontos.",
    Time = 5
})
```

### 4. Notificação RGB (Borda Gradiente)
Para notificações mais chamativas, com borda em gradiente RGB:
```lua
DoorsEmblem({
    type = "rgb",
    Title = "Efeito Especial!",
    Description = "Notificação com borda em gradiente RGB.",
    Time = 5
})
```

## 🛠️ Configurações Internas

### Tabela `Types`
A tabela `Types` define as configurações visuais e os ícones para cada tipo de notificação suportado.

```lua
local Types = {
    alert = {Color = Color3.fromRGB(255, 0, 0), Icon = "rbxassetid://IconeDeAlerta"},
    success = {Color = Color3.fromRGB(0, 255, 0), Icon = "rbxassetid://IconeDeSucesso"},
    analysis = {Color = Color3.fromRGB(255, 165, 0), Icon = "rbxassetid://IconeDeAnalise"},
    rgb = {Color = "rgb", Icon = "rbxassetid://IconeRGB"}
}
```

### Função `DoorsEmblem`
A função principal para criar notificações. Aceita um `table` com as seguintes chaves:
- `type`: Define o estilo da notificação. Pode ser `"alert"`, `"success"`, `"analysis"`, ou `"rgb"`.
- `Title`: Título exibido na notificação.
- `Description`: Texto de descrição da notificação.
- `Time`: Duração da exibição em segundos.

Exemplo:
```lua
DoorsEmblem({
    type = "alert",
    Title = "Alerta!",
    Description = "Atenção, evento crítico detectado.",
    Time = 4
})
```

---

## ⚠️ Nota Importante
Esse script foi desenhado para funcionar de forma independente e modular. Ele pode ser adaptado para incluir novos tipos e configurações de notificação, se necessário.
