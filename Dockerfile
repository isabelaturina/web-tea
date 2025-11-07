# Usa uma imagem base do Tomcat com Java 17
FROM tomcat:9.0-jdk17

# Remove o app padrão do Tomcat
RUN rm -rf /usr/local/tomcat/webapps/ROOT

# Copia o arquivo .war gerado pelo NetBeans (ajuste o nome se necessário)
COPY dist/tea+.war /usr/local/tomcat/webapps/ROOT.war

# Expõe a porta padrão do Tomcat
EXPOSE 8080

# Inicia o Tomcat quando o container subir
CMD ["catalina.sh", "run"]
