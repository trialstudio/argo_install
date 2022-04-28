{{- define "grafana-mimir.name" -}}
grafana-mimir
{{- end }}

{{- define "grafana-mimir.fullname" -}}
{{- printf "%s-%s" .Release.Name "grafana-mimir" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "grafana-mimir.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "grafana-mimir.labels" -}}
helm.sh/chart: {{ include "grafana-mimir.chart" . }}
{{ include "grafana-mimir.selectorLabels" . }}
app.kubernetes.io/version: {{ .Values.mimir.image.version | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "grafana-mimir.selectorLabels" -}}
app.kubernetes.io/name: {{ include "grafana-mimir.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
