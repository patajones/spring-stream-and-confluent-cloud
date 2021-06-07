FILE=$HOME/.config/.confluentrc
if [[ ! -f "$FILE" ]]; then
    echo "🥟 Configurando Kafka para acessar o Confluent Cloud.
 Vá para https://confluent.cloud/ e realize o login.

 Caso ainda não tenha a conta, pode ser criada uma nova a partir do mesmo link (será necessário um Cartão de Crédito) 
 ou criado a partir do Google Cloud Plataform https://www.confluent.io/gcp/

 Após o Login, selecione o cluster
 No menu lateral, clique em 'Settings'."
    echo
    echo "Copie e Cole o valor do campo 'Bootstrap server':"
    read -r BOOTSTRAP_SERVERS
    export BOOTSTRAP_SERVERS=${BOOTSTRAP_SERVERS}
    gp env BOOTSTRAP_SERVERS=${BOOTSTRAP_SERVERS} &>/dev/null

    echo "🆗---"
    echo "No menu lateral, clique em 'API Keys' e crie uma Chave. (Pode utilizar os dados de uma chave criada anteriormente)"
    echo
    echo "Copie e Cole o valor do campo Key"
    read -r CLUSTER_API_KEY
    export CLUSTER_API_KEY=${CLUSTER_API_KEY}
    gp env CLUSTER_API_KEY=${CLUSTER_API_KEY} &>/dev/null
    echo "🆗---"
    echo "Copie e Cole o valor do campo Secret"
    read -r CLUSTER_API_SECRET
    export CLUSTER_API_SECRET=${CLUSTER_API_SECRET}
    gp env CLUSTER_API_SECRET=${CLUSTER_API_SECRET} &>/dev/null
    echo "export BOOTSTRAP_SERVERS=${BOOTSTRAP_SERVERS}" > $FILE
    echo "export CLUSTER_API_KEY=${CLUSTER_API_KEY}" >> $FILE
    echo "export CLUSTER_API_SECRET=${CLUSTER_API_SECRET}" >> $FILE
    echo "source ${FILE}" >> ${HOME}/.bashrc
else
    source $FILE
fi