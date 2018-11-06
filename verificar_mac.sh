#!/usr/bin/env bash
##**************Script para alterar MAC para o padrão desejado************######
##Script Criado por Fabricio 06/11/2018 Versão 1.0 para configurar MAC #########
################################################################################

##Script para verificar a escrita do endereço físico se é compativel com o CISCO


normal() {
  echo "Alterando os MAC para o Padrão mais Comum"
  echo "Qual o caminha do arquivo com os macs: "
  read macs
  sed 's/://g;s/-//g;s/ //g' $macs   | tr '[[:lower:]]' '[[:upper:]]' > alterar_mac.txt
  sed 's/.\{2\}/&:/;s/.\{5\}/&:/;s/.\{8\}/&:/;s/.\{11\}/&:/;s/.\{14\}/&:/' ./alterar_mac.txt > mac_ok.txt
  echo "Foi gerado um arquivo com os MAC no padrão escolhido"
  echo "O nome do arquivo é mac_ok.txt"
  rm alterar_mac.txt
  menu
}

com_hifen(){
  echo "Alterando os MAC para o Padrão mais Comum"
  echo "Qual o caminha do arquivo com os macs: "
  read macs
  sed 's/://g;s/-//g;s/ //g' $macs   | tr '[[:lower:]]' '[[:upper:]]' > alterar_mac.txt
  sed 's/.\{2\}/&-/;s/.\{5\}/&-/;s/.\{8\}/&-/;s/.\{11\}/&-/;s/.\{14\}/&-/' ./alterar_mac.txt > mac_ok.txt
  echo "Foi gerado um arquivo com os MAC no padrão escolhido"
  echo "O nome do arquivo é mac_ok.txt"
  rm alterar_mac.txt
  menu
}

cisco_com_hifen(){
  echo "Alterando os MAC para o Padrão mais Comum"
  echo "Qual o caminha do arquivo com os macs: "
  read macs
  sed 's/://g;s/-//g;s/ //g' $macs   | tr '[[:lower:]]' '[[:upper:]]' > alterar_mac.txt
  sed 's/.\{4\}/&-/;s/.\{9\}/&-/' ./alterar_mac.txt > mac_ok.txt
  echo "Foi gerado um arquivo com os MAC no padrão escolhido"
  echo "O nome do arquivo é mac_ok.txt"
  rm alterar_mac.txt
  menu
}

cisco(){
echo "Alterando os MAC para o Padrão mais Comum"
echo "Qual o caminha do arquivo com os macs: "
read macs
sed 's/://g;s/-//g;s/ //g' $macs   | tr '[[:lower:]]' '[[:upper:]]' > alterar_mac.txt
sed 's/.\{4\}/&./;s/.\{9\}/&./' ./alterar_mac.txt > mac_ok.txt
echo "Foi gerado um arquivo com os MAC no padrão escolhido"
echo "O nome do arquivo é mac_ok.txt"
rm alterar_mac.txt
menu
}
menu(){
echo "qual o Formato que você deseja para o endereço MAC:"
echo "1- 00:11:22:33:44:55"
echo "2- 00-11-22-33-44-55"
echo "3- 0011-2233-4455"
echo "4- 0011.2233.4455"
echo "5- Sair"
read OPCAO

case $OPCAO in

  1) normal ;;
  2) com_hifen ;;
  3) cisco_com_hifen ;;
  4) cisco ;;
  5) exit ;;
esac
}

menu
