FROM arigaio/atlas:0.37.0-community-distroless

WORKDIR /app

COPY ./db /app/db
COPY ./config/atlas.hcl /app/atlas.hcl

# CMD ["schema", "apply", "--env", "migrate", "-c", "file://atlas.hcl", "--auto-approve"]
CMD ["migrate", "apply", "--url", "mysql://user:password@db:3306/sample", "--dir", "file://db/migrations"]
