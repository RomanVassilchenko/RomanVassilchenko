---
title: "DACA/AdalQarau: архитектура аналитики госзакупок"
date: 2025-09-02
tags: ["Go", "GraphQL", "PostgreSQL", "MinIO", "Microservices"]
categories: ["Side Project", "Architecture"]
draft: false
---

Короткий обзор архитектуры: микросервисы на Go, хранилище PostgreSQL, файлы в MinIO/S3, интеграции через Kafka. В качестве API — GraphQL; схемы описываются через Buf/Proto для унификации контрактов.

Отдельно рассказываю про риск‑индикаторы, построение графовых связей между участниками тендеров и Excel‑выгрузки.

