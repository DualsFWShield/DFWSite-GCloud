
# Use the lightweight Nginx Alpine image
FROM nginx:alpine

# Cloud Run expects the container to listen on port 8080
# Use a custom nginx.conf template or modify the default one
# Here we'll modify the default config to listen on 8080
RUN sed -i 's/listen       80;/listen       8080;/g' /etc/nginx/conf.d/default.conf

# Copy static assets to Nginx html directory
COPY . /usr/share/nginx/html

# Expose port 8080
EXPOSE 8080

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
