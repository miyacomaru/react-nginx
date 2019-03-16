FROM node as build-stage
WORKDIR /app/
COPY . /app/
RUN yarn install
RUN yarn build


FROM nginx:1.15
COPY --from=build-stage /app/build /usr/share/nginx/html
#COPY --from=build-stage /nginx-default.conf /etc/nginx/conf.d/default.conf
