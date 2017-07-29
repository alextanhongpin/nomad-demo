{{range service "global-server-check" -}}
server {{.Address}}:{{.Port}}
{{end}}