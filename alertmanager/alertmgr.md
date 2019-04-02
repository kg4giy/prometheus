global:
  smtp_smarthost: 'localhost:25' 
  smtp_from: 'kg4giy@vashire.com'
  smtp_require_tls: false
route:
  receiver: example-email
receivers:
 - name: example-email
   email_configs:
   - to: 'david.lane@vashire.com'
     send_resolved: true
     require_tls: false
