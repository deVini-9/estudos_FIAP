rate_sac = int(input('Digite a nota de satisfação com o atendimento(0 - 100): '))

if not 0 <= rate_sac <= 100:
     print('\nVocê digitou um número fora da faixa de avaliação(0 - 100)!')
elif rate_sac >= 90:
    print('\nAtendimento de Qualidade!')
elif rate_sac >= 70:
    print('\nAtendimento Neutro!')
else:
    print('\nAtendimento Insatisfatório!')
