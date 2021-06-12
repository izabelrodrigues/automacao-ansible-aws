# Automação AMAZON IAM usando Ansible e AWS Cli - Desafio Ansile Hero do Bootcamp AWS

<p align="center">
    <img src="https://user-images.githubusercontent.com/3687713/121788321-c5497c00-cba2-11eb-9a11-73de8f3b6032.png" />
</p>

### DESCRIÇÃO

Migrar acesso de funcionários providos em uma planilha que contém nomes, e-mails e cargos de funcionários para a estrutura da AWS. A migração deve utilizar ferramenta de automação ANSIBLE. </br> </br>
  Exemplo de um trecho da planilha fornecida pela empresa “ABC EMPRESA”
  
  <p align="center">
    <img src="https://user-images.githubusercontent.com/3687713/121788636-1b1f2380-cba5-11eb-972b-7bb34f71156e.png" />
  </p>

 ### RESUMO DA SOLUÇÃO
 * Preparação dos dados da planilha excel para geração de um arquivo csv
 * Política de senhas de usuários configurados previamente no console da AWS
 * Criação de um usuário com permissão de executar comandos via aws cli
 * Criação de shell script contendo comandos aws cli para criação de usuários 
 * Criação de playbooks parciais para as tarefas 
 * Criação do playbook Ansible principal que importará todos os outros playbooks                                       
                  
 ### CARACTERÍSTICAS DO AMBIENTE DE EXECUÇÃO - PRÉ-REQUISITOS:
 * python3
 * pip
 * boto3
 * Ansible ( Versão aqui deve ser superior a 2.9 ) com os módulos community.aws e community.general instalados.
  
 Para verificar se possui os pre-requisitos instalados execute os comandos de verificação como na imagem abaixo
 
 <p align="center">
   <img src="https://user-images.githubusercontent.com/3687713/121788772-6423a780-cba6-11eb-9b2b-865cdd6f33a4.png" />
 </p>

Para instalar os módulos aws e general do Ansible, execute:

`ansible-galaxy collection install community.aws` <br/>
`ansible-galaxy collection install community.general`


### EVIDÊNCIAS DE EXECUÇÃO

Política de senhas configurada no IAM

<p align="center">
   <img src="https://user-images.githubusercontent.com/3687713/121790962-385eec80-cbbb-11eb-8892-4b3abc106d48.png" />
</p>

A imagem abaixo demonstra a saída dos comandos aws iam list-users e aws iam list-groups antes da execução da migração
</br>
 <p align="center">
   <img src="https://user-images.githubusercontent.com/3687713/121788883-8d910300-cba7-11eb-92cf-a2538214d659.png" />
 </p>
 
 Para executar a migração via automação com Ansible, foi executado o seguinte comando: <br/>


   `ansible-playbook migration-users-aws-playbook.yml --extra-vars "my_file=users.csv" -vvv`

 <p align="center">
   <img src="https://user-images.githubusercontent.com/3687713/121790326-ab189980-cbb4-11eb-916c-1587907882d5.png" />
 </p>

Após o término, a console AWS apresentou 102 usuários e 6 grupos criados.

<p align="center">
   <img src="https://user-images.githubusercontent.com/3687713/121790357-077bb900-cbb5-11eb-8e85-4ef54fabe477.png" />
</p>

<p align="center">
   <img src="https://user-images.githubusercontent.com/3687713/121790363-106c8a80-cbb5-11eb-8878-19b769866f07.png" />
</p>

### REFERÊNCIAS

* Guia de instalação do aws-cli: https://docs.aws.amazon.com/cli/latest/userguide/install-cliv2.html
* Ansible iam_group module: https://docs.ansible.com/ansible/latest/collections/community/aws/iam_group_module.html
* Ansible iam_managed_policy_module: https://docs.ansible.com/ansible/latest/collections/community/aws/iam_managed_policy_module.html
* Ansible caller info module: https://docs.ansible.com/ansible/latest/collections/amazon/aws/aws_caller_info_module.html
* Ansible import playbook module: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/import_playbook_module.html
* Ansible read csv: https://docs.ansible.com/ansible/latest/collections/community/general/read_csv_module.html
* Ansible script module: https://docs.ansible.com/ansible/latest/collections/ansible/builtin/script_module.html



