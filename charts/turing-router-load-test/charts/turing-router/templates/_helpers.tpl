{{- define "default-router.yaml" -}}
type: EAGER_ROUTER
id: eager-router
routes:
{{ toYaml .Values.router.config.routes -}}{{ printf "\n" }}
strategy:
  type: fiber.DefaultTuringRoutingStrategy
  properties:
{{ toYaml .Values.router.config.properties | indent 4 }}
{{- end -}}

{{- define "router-with-external-ensembler.yaml" -}}
type: COMBINER
id: combiner
routes:
{{ toYaml .Values.router.config.routes -}}{{ printf "\n" }}
fan_in:
  type: fiber.EnsemblingFanIn
  properties:
{{ toYaml .Values.router.config.properties | indent 4 }}
{{- end -}}

{{- define "bq.volume" -}}
{{- if .Values.bigquery }}
  - name: bq-svc-acct
    secret:
      secretName: {{ .Values.bigquery.svcAcctSecret.name }}
{{- end }}
{{- end -}}

{{- define "bq.volumeMount" -}}
{{- if .Values.bigquery }}
  - name: bq-svc-acct
    mountPath: /var/secret/
{{- end }}
{{- end -}}

{{- define "bq.env" -}}
{{- if .Values.bigquery }}
  - name: GOOGLE_APPLICATION_CREDENTIALS
    value: /var/secret/{{ .Values.bigquery.svcAcctSecret.key }}
{{- end }}
{{- end -}}