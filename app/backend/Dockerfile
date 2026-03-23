# ── Stage 1: Build ───────────────────────────────────────────
FROM node:18-alpine AS builder

WORKDIR /app

# Copy package.json and lock file if present
COPY package*.json ./

# Install dependencies
# Prefer npm ci if lock file exists, fallback to npm install
RUN if [ -f package-lock.json ]; then \
      npm ci --omit=dev; \
    else \
      npm install --only=production; \
    fi

COPY . .

# ── Stage 2: Runtime ─────────────────────────────────────────
FROM node:18-alpine AS runtime

RUN addgroup -g 1001 -S appgroup && \
    adduser -u 1001 -S appuser -G appgroup

WORKDIR /app

COPY --from=builder --chown=appuser:appgroup /app/node_modules ./node_modules
COPY --from=builder --chown=appuser:appgroup /app .

USER appuser

EXPOSE 3000

HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 \
  CMD wget -qO- http://localhost:3000/health || exit 1

CMD ["node", "server.js"]