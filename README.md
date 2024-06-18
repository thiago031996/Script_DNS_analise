# Script_DNS_analise

#Esse script pode ser editado conforme a sua necessidade, então aprimore, edite, acrescente...

#Função: Realiza a consulta aos root_servers para identificar falhas, também trás informações do domíneo do DNS, quando esse não possui nenhum tipo de regra de "bloqueio".

#Aviso importante:
Alguns DNSs podem responder apenas para um bloco privado da rede do seu ISP, logo, caso teste um DNS que não esteja liberado para responder para outros blocos (rede externa), não será possível realizar a resolução de nome, ocasionando erro na resolução, mas caso esteja rodando esse script conectado na rede do seu ISP, será possível realizar o teste!.

#SOBRE O SCRIPT:
Esse script nada mais é do que uma edição de algumas ferramentas de análise de redes, sendo esses: dig e whois, ferramentas amplamente utilizadas para análise e diagnóstico.

#INSTALAÇÃO:
Atualize os repositórios:

 sudo apt update; sudo apt upgrade
 
Certifiquesse de ter instalado os seguintes pacotes:
 dig
 whois
 
 #Vrifique se já possui instalado os pacotes dig e whois com o comando abaixo:
 dpkg -l | grep whois;dpkg -l | grep dig 

Caso não tenha os pacotes instalados, faça o download. Comando istalação pacotes abaixo:
 
 sudo apt install dig 

 sudo apt install whois

#Pronto, agora basta dar permissão ao arquivo e executar!

#Dando permissão de execução:
chmod +x nome_arquivo.sh

#EXECUTANDO SCRIPT:
./nome_arquivo.sh
