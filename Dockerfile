FROM nginx:latest
COPY ./index.html /usr/share/nginx/html/index.html
EXPOSE 80/tcp
CMD [ "nginx","-g","daemon off;" ]
*/hu*/
