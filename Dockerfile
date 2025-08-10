# Use Node.js 16 as base image (compatible with Angular 14)
FROM node:16-alpine
# Install curl for health checks
RUN apk add --no-cache curl

# Set the working directory inside the container
WORKDIR /app

# Copy package.json and package-lock.json (if available) first
COPY package.json package*.json ./

# Install dependencies with --force flag to bypass conflicts
# and --no-audit to skip security auditing
RUN npm install --force --no-audit

# Copy the rest of the application source code
COPY . .

# Expose port 4200
EXPOSE 4200

# Use the start script from your package.json
CMD ["npx", "ng", "serve", "--host", "0.0.0.0", "--port", "4200"]


