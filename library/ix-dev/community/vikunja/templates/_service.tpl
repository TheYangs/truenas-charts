{{- define "vikunja.service" -}}
service:
  vikunja:
    enabled: true
    primary: true
    type: NodePort
    targetSelector: vikunja
    ports:
      webui:
        enabled: true
        primary: true
        port: {{ .Values.vikunjaNetwork.webPort }}
        nodePort: {{ .Values.vikunjaNetwork.webPort }}
        targetSelector: vikunja
  redis:
    enabled: true
    type: ClusterIP
    targetSelector: redis
    ports:
      redis:
        enabled: true
        primary: true
        port: 6379
        targetPort: 6379
        targetSelector: redis
  {{- include "ix.v1.common.app.postgresService" $ | nindent 2 }}
{{- end -}}
