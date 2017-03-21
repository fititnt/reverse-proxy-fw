# Proxy reverso simples mitigar Spam/Botnet/DDoS com NGinx em ubuntu

Esta é uma prova de conceito usando NGinx, Ubuntu 16.04 para mitigar
(suavisar efeito) de tentativas de login, envio de spam, amplificação dos
efeitos negativos de uma botnet e DDoS simples.

Idealmente a sua aplicação (software usado para fazer seu site) deveria lidar
melhor com problemas ao ponto de não parar de funcionar (DDoS acidental).
Se não for possível, ou estiver no meio de um problema que pode demorar dias
ou semanas para resolver e sua aplicação não pode parar de funcionar,
essa prova de conceito pode inspirar você.

Veja Veja [configuração da VM Ubuntu](vm-setup.sh). Olhe na pasta **nginx** para
se inspirar nas configurações

## O que esta prova de conceito faz nesse momento

- Intermedia acesso dos usuários (e atacantes) até o servidor da sua aplicação
- Restringe acessos por requisições além GET/HEAD (boa parte dos ataques usam POST para envio de spam)
- Restringe acessos por geolocalização de IPs além do Brasil (_na verdade, apenas IPs não Brasileiros tem POST restrito)
  - _Idealmente você deveria restringir melhor do que apenas um país inteiro_
  - _Note que outros países não são bloqueados de acessar TOTALMENTE o site, mas apenas requisições além de GET/HEAD_
  - _...mas se estiver desesperado, pode bloquear até GET/HEAD para os demais países_

## O que você poderia fazer na sua implementação

- Usar essa prova de conceito para analisar os padrões de ataque (útil se o servidor que executa a aplicação é muito restrito)
- [Possivelmente aproveitar o NGinx para cachear conteúdo](https://www.nginx.com/blog/nginx-caching-guide/)
- [Otimizar para DDoS](https://www.nginx.com/blog/mitigating-ddos-attacks-with-nginx-and-nginx-plus/)

## O que você deve estar ciente antes de usar

Essa prova de conceito **é sobre mitigar (suavisar efeito)**. Caso sua aplicação
tenha vunerabilidades, ou mesmo tudo leve a acreditar que há backdoors, você
**DEVERIA** dedicar tempo para para resolver os problemas ou mesmo fazer limpeza.

Existem formas usando até mesmo GET, envio de arquivos e cookies que requerem
poucos dados e então induzem sua aplicaçao a puxar instruções complexas em vez
de receber e já executar. Não vou entrar em detalhes aqui sobre _como_
estratégias para mitigar malwares tem dificuldade para evitar propagar os
conceitos para pessoas que não trabalham na área.

Por isso, repito: considere resolver o problema em vez de apenas mitigar.