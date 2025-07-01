from typing import List, Dict
import os
import json


COMANDO_LIMPAR_TERMINAL = "cls" if os.name == "nt" else "clear"
ICMS_PERCENTUAL: float = 0.18
MIN_PRODUTOS_SALVAR: int = 5
NOME_ARQUIVO_JSON: str = "1_5_arquivo_produto.json"

calcular_icms = lambda valor_produto: round(valor_produto * ICMS_PERCENTUAL, 2)


def solicitar_input(
    mensagem: str, 
    tipo=str, 
    erro="Entrada Inválida", 
    validar=None
) -> float:
    """
    Solicita e valida a entrada do usuário.

    Args:
        mensagem (str): Mensagem para exibir ao usuário.
        tipo: Tipo do dado esperado.
        erro (str): Mensagem de erro se a entrada for inválida.
        validar: Função de validação se necessário.

    Returns:
        Valor: O valor validado e tratado
    """
    while True:
        try:
            valor = input(mensagem).strip()

            if not valor and tipo is str:
                print("Erro: A entrada não pode estar vazia.")
                continue

            valor = tipo(valor.replace(",", ".")) if tipo is float else valor

            if validar and not validar(valor):
                continue
            return valor
        except ValueError:
            print(erro)


def validar_numero(valor_produto):
    """
    Valida se o valor do produto é positivo.

    Returns:
        bool: True se o valor for positivo, False caso for negativo
    """
    if valor_produto < 0:
        print("Erro: O valor não pode ser menor que 0.")
        return False
    return True


def perguntar_se_continua(mensagem: str = "\nDeseja continuar ? (Sim/Não) ") -> bool:
    """
    Pergunta ao usuário se deseja continuar a operação.

    Args:
        mensagem: Mensagem a ser exibida para o usuário.

    Returns:
        bool: True se a resposta for sim, False caso for não. 
    """
    while True:
        resposta = input(mensagem).strip().lower()

        if resposta in ["sim", "s"]:
            return True
        elif resposta in ["não", "nao", "n"]:
            return False

        print("Resposta Inválida! Digite 'Sim' ou 'Não'.")    


def cadastrar_produto() -> Dict[str, float, str, float]:
    """
    Cadastra um novo produto.

    Returns:
        produto: Um dicionário com as entradas do usuário.
    """
    os.system(COMANDO_LIMPAR_TERMINAL)

    print("--- Cadastro de Produtos ---\n\n")

    descricao_produto = solicitar_input("Descrição do Produto: ")
    valor_produto = solicitar_input("Valor do Produto: R$ ", float, "Valor inválido", validar_numero)
    tipo_embalagem = solicitar_input("Tipo da Embalagem do Produto: ")

    produto = {
        "descricao_produto": descricao_produto,
        "valor_produto": valor_produto,
        "tipo_embalagem": tipo_embalagem,
        "icms_produto": calcular_icms(valor_produto)
    }

    os.system(COMANDO_LIMPAR_TERMINAL)

    return produto

def salvar_json(produtos):
    """
    Salva os produtos cadastrados em um arquivo JSON.

    Args:
        produtos: Lista de produtos a serem salvos.
    """
    try:
        with open(NOME_ARQUIVO_JSON, "w", encoding="utf-8") as f:
            json.dump(produtos, f, ensure_ascii=False, indent=4)
        print("Arquivo gerado com sucesso!")
    except (IOError, Exception) as e:
        print("Erro ao salvar arquivo: {e}")

def verificar_quantidade_produtos(produtos):
    """
    Verifica se o número de produtos cadastros atende a quantidade mínima.

    Args:
        produtos: Lista de produtos cadastrados.

    Returns:
        bool: True se o número de produtos atender a quantidade mínima, False caso não atender.
    """
    if len(produtos) < MIN_PRODUTOS_SALVAR:
        print(f"Você cadastrou apenas {len(produtos)} produto(s). É necessário ter no mínimo {MIN_PRODUTOS_SALVAR} produtos cadastrados para gerar o arquivo JSON.")
        return False
    return True


def cadastro_produto() -> List[dict]:
    """
    Gerencia o cadastro dos produtos

    Returns:
        produtos: Lista de produtos cadastrados.
    """
    produtos: List[dict] = []

    while True:
        produto = cadastrar_produto()
        produtos.append(produto)

        print("\nProduto cadastrado com sucesso!")

        if not perguntar_se_continua("\n\nDeseja cadastrar outro produto ? (Sim/Não) "):
            break
    
    return produtos


def main():
    os.system(COMANDO_LIMPAR_TERMINAL)
    produtos = cadastro_produto()

    
    while not verificar_quantidade_produtos(produtos):
        if perguntar_se_continua("\n\nSe prosseguir o arquivo não será gerado! Deseja encerrar o cadastro ? (Sim/Não) "):
            print("\nPrograma encerrado! Nenhum arquivo será gerado.")
            return

        produto = cadastrar_produto()
        produtos.append(produto)
    
    os.system(COMANDO_LIMPAR_TERMINAL)
    print("--- Salvando arquivo ---")
    salvar_json(produtos)


if __name__ == "__main__":
    try: 
        main()
    except KeyboardInterrupt:
        print("\nCadastro interrompido!")