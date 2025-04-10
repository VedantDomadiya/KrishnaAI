# Use the official Nginx image as the base image
FROM nginx:alpine

# Remove the default Nginx HTML file
RUN rm -rf /usr/share/nginx/html/*

# Copy the HTML file from your local directory into the Nginx HTML directory
COPY . /usr/share/nginx/html/
COPY default.conf /etc/nginx/conf.d/default.conf

# Expose port 80 for HTTP traffic
EXPOSE 8000

# Start Nginx when the container starts
CMD ["nginx", "-g", "daemon off;"]
