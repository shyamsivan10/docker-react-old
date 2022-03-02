from node:16-alpine as builder
workdir '/app'
copy package.json .
run npm install
copy ./ ./
cmd ["npm", "run", "build"]
#you can also do "run npm run build"

from nginx
copy --from=builder /app/build /usr/share/nginx/html