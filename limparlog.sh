#! /bin/sh
# Fazendo Backup dos logs atuais
# Gravar o arquivo na pasta /root

tar -zcvf /backup/var/log-`date +%d.%m.%y-%H:%M`.tar.gz /var/log
# Acessando o diretório de logs
cd /var/log
# Procura todos os arquivos no /var/log e executa a limpeza
for l in `find . -type f -exec ls {} \;`; do
        echo -n >$l &>/dev/null
done
# Remove arquivos de backup de logs com mais de 30 dias de criação
find /backup/var/ -name "*.tar.gz" -ctime +30 -exec rm -rf {} \;


# Precisa dar permissão de execução para o arquivo ----- chmod +x /root/limparlog.sh   
# Inserir no cron o agendamento para execução a cada 8 horas 
# execute crontab -e
# insira as seguintes linhas no final do arquivo
# 0 0,8,16 *** /root/limparlog.sh



