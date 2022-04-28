{{- define "grafana-agent.name" -}}
grafana-agent
{{- end }}

{{- define "grafana-agent.fullname" -}}
{{- printf "%s-%s" .Release.Name "grafana-agent" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "grafana-agent.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{- define "grafana-agent.labels" -}}
helm.sh/chart: {{ include "grafana-agent.chart" . }}
{{ include "grafana-agent.selectorLabels" . }}
app.kubernetes.io/version: {{ .Values.agent.image.version | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "grafana-agent.selectorLabels" -}}
app.kubernetes.io/name: {{ include "grafana-agent.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}