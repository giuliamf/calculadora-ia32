# CALC IA-32

Calculadora em Assembly IA-32 (NASM) para Linux, desenvolvida como trabalho da disciplina de Software Básico.

---

**Disciplina:** Software Básico  
**Professor:** Bruno Macchiavello  
**Semestre:** 2026/1

---

## Equipe

| Nome | Matrícula |
|------|-----------|
| Guilherme Ribeiro de Macedo | 170162354 |
| Giulia Moura Ferreira | 200018795 |

---

## Sistema Operacional

**Ubuntu Linux**

---

## Requisitos

- [NASM](https://www.nasm.us/) — montador Assembly
- **i686-linux-gnu-ld** — ligador cruzado para IA-32
- **qemu-i386** — emulador para executar o binário IA-32

Para instalar as dependências:

```bash
sudo apt install nasm binutils-i686-linux-gnu qemu-user
```

---

## Arquivos do projeto

| Arquivo              | Conteúdo                                              |
|----------------------|-------------------------------------------------------|
| `calculadora.asm`    | Programa principal, funções de entrada e saída        |
| `soma.asm`           | Função de soma                                        |
| `subtracao.asm`      | Função de subtração                                   |
| `multiplicacao.asm`  | Função de multiplicação                               |
| `divisao.asm`        | Função de divisão                                     |
| `mod.asm`            | Função de módulo (resto da divisão)                   |
| `expo.asm`           | Função de exponenciação                               |

---

## Como compilar, ligar e executar

### Opção 1 — usando os scripts (recomendado)

Para compilar e ligar:

```bash
bash build.sh
```

Para compilar, ligar e executar em sequência:

```bash
bash run.sh
```

### Opção 2 — passo a passo manual

**1. Compilar** cada arquivo `.asm` com o NASM:

```bash
nasm -f elf32 calculadora.asm -o calculadora.o
nasm -f elf32 soma.asm -o soma.o
nasm -f elf32 subtracao.asm -o subtracao.o
nasm -f elf32 multiplicacao.asm -o multiplicacao.o
nasm -f elf32 divisao.asm -o divisao.o
nasm -f elf32 mod.asm -o mod.o
nasm -f elf32 expo.asm -o expo.o
```

**2. Ligar** todos os arquivos objeto em um único executável:

```bash
i686-linux-gnu-ld calculadora.o soma.o subtracao.o multiplicacao.o divisao.o mod.o expo.o -o calculadora
```

**3. Executar** com o emulador IA-32:

```bash
qemu-i386 ./calculadora
```

---

## Funcionalidades

### Operações disponíveis

| Opção | Operação        |
|-------|-----------------|
| 1     | Soma            |
| 2     | Subtração       |
| 3     | Multiplicação   |
| 4     | Divisão         |
| 5     | Exponenciação   |
| 6     | MOD             |
| 7     | Sair            |

### Precisão

Ao iniciar, o programa pergunta com qual precisão trabalhar:

- `0` — 16 bits (intervalo: −32768 a 32767)
- `1` — 32 bits

### Outras características

- Suporte a números positivos e negativos
- Validação de intervalo para entradas no modo 16 bits
- Detecção de overflow nas operações de multiplicação e exponenciação
- Tratamento de divisão por zero e MOD por zero

