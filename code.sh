#!/bin/bash

#Este script realiza o teste da resolução de um DNS especificado para um host especificado
#

owner_project="Thiago Souza"

#CABEÇALHO DE INFORMAÇÕES
echo -e "========================================================================="

echo -e "Esse script realiza a consulta ao server DNS para resolução de nomes"
echo -e "Finalidade: Análise de DNS para resolução de nomes"
echo -e "Owner_script: Thiago Souza"
echo -e  "interprise: AW-FIBRA"
echo -e "Script github:https://github.com/thiago031996/Script_DNS_analise"

echo -e "=========================================================================="
#DADOS INSERIDOS PELO USUÁRIO
echo "Informe o DNS que será usado para a resolução: "
read dns
printf "\n"

echo "Informe o IP / Dominio para consulta: "
read ip_domain
printf "\n"

#(dig)ANÁLISE DNS PARA O DOMÍNEO COM OS FILTROS APLICADOS
echo -e "=========================================================================="

grc dig +time=1 +tries=2 @$dns $ip_domain | grep NOERROR && echo O DNS/IP:"$dns" Resolveu o Endereço:"$ip_domain" com sucesso! || echo o DNS/IP: "$dns" não conseguiu resolver o Endereço:"$ip_domain"

printf "\n"

grc dig +time=1 +tries=2 @$dns $ip_domain | tail -n5


echo -e "=========================================================================="

printf "\n"

echo " ANALISANDO PORTAS OPEN PARA O DNS/IP INFORMADO..."

#VERIFICA AS PORTAS OPEM PARA O ENDEREÇO DNS / IP 
grc nmap "$dns"

printf "\n"

echo "INFORMAÇÕES DNS/IP:$dns"

grc whois -h whois.cymru.com " -v $dns"

printf "\n"


#CONSULTA REVER
for ip in "${dns[@]}"; do
  echo "Consultando reverso para IP: $ip"
  nome_reverso=$(dig +short -x "$ip")
  if [ -n "$nome_reverso" ]; then
    echo "Nome de domínio: $nome_reverso"
  else
    echo "Não foi possível resolver o IP: $ip"
  fi
  echo ""
done

#TESTE PING PARA O DNS
ping=$(ping -c 4 -W 1 $dns)
echo " Testando ping..."
echo " 4 pacotes enviados para:$dns "

result_ping=$(echo "$ping"| tail -n3)

echo "Dados teste PING:$result_ping"



