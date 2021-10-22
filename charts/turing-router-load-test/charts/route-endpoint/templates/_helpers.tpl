{{- define "route-endpoint.fullname" -}}
{{- printf "%s-%s" .Values.global.name ( .Values.global.deploymentId | default "") | replace "--" "-" | trimSuffix "-" | replace "+" "_" | replace "." "-" | trunc 63 -}}
{{- end -}}
