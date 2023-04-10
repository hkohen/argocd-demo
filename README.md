# argocd-demo :rocket:

As any kubernetes application, we need create a namespace.
<pre>
create ns argocd
</pre>
Apply the Argocd deployment, from the official git repository.
<pre>
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/v2.5.8/manifests/install.yaml
</pre>
For obtain the default pass created on our deployment, its necessary run a kubectl command:
<pre>
kubectl -n argocd get secret argocd-initial-admin-secret -o jsonpath="{.data.password}" | base64 -d; echo
</pre>
Forward the port and service to your local computer.
<pre>
kubectl port-forward svc/argocd-server -n argocd 8080:443
</pre>
Navigate the url in:
https://localhost:8080

If you want more information about how to deployment this application, please, check those blogs article:

https://juanmercadoit.com/2023/04/09/gitops-argo-cd-and-application-deployment-demo-part-i/

Thank you and happy learning!
