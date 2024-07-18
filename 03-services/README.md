### Boas Práticas

1. **Labels e Selectors:** Use labels e selectors consistentes para facilitar a organização e o gerenciamento dos serviços.
2. **Ports:** Defina portas de forma clara. `port` é a porta em que o serviço é exposto, enquanto `targetPort` é a porta em que o aplicativo está ouvindo.
3. **Type:** Use o tipo de serviço adequado ao caso de uso:
   - `ClusterIP` para serviços internos.
   - `NodePort` para acesso externo limitado (como em ambientes de desenvolvimento).
   - `LoadBalancer` para acesso externo público em ambientes de produção.
4. **__Segurança__:** Considere o uso de NetworkPolicies para controlar o acesso aos seus serviços, especialmente quando expostos externamente.
5. **Recursos:** Certifique-se de que seus serviços estão corretamente configurados para aproveitar os recursos disponíveis e que não estão causando sobrecarga desnecessária.

Implementando essas boas práticas, você garantirá que seus serviços Kubernetes sejam configurados de maneira eficiente e segura.
