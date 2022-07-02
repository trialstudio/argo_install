{{- define "chart.version" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "grafana.name" -}}
{{- printf "%s-%s" .Chart.Name .Values.grafana.name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "grafana.labels" -}}
helm.sh/chart: {{ include "chart.version" . }}
app.kubernetes.io/version: {{ .Values.grafana.image.version | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "grafana.selectorLabels" -}}
app.kubernetes.io/name: {{ include "grafana.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{- define "postgres.name" -}}
{{- printf "%s-%s" .Chart.Name .Values.postgres.name | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "postgres.labels" -}}
helm.sh/chart: {{ include "chart.version" . }}
app.kubernetes.io/version: {{ .Values.postgres.image.version | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "postgres.selectorLabels" -}}
app.kubernetes.io/name: {{ include "postgres.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}