This is a [Next.js](https://nextjs.org/) project bootstrapped with [`create-next-app`](https://github.com/vercel/next.js/tree/canary/packages/create-next-app).

## Getting Started

First, run the development server:

```bash
npm run dev
# or
yarn dev
```

Open [http://localhost:3000](http://localhost:3000) with your browser to see the result.

You can start editing the page by modifying `pages/index.js`. The page auto-updates as you edit the file.

## Learn More

To learn more about Next.js, take a look at the following resources:

- [Next.js Documentation](https://nextjs.org/docs) - learn about Next.js features and API.
- [Learn Next.js](https://nextjs.org/learn) - an interactive Next.js tutorial.

You can check out [the Next.js GitHub repository](https://github.com/vercel/next.js/) - your feedback and contributions are welcome!

## Build Docker Image
To build a docker image (tagged latest) run
```shell script
npm run docker:build
```
to tag the image with the version and the name of the branch run
```shell script
npm run docker:tag
```

## Deploy to Your Local Kubernetes
To deploy to your local Kubernetes run
```shell script
npm run kube:apply
```
You can keep track of the deployment via
```shell script
kubectl get pods --watch
```
Once deployed The application should be available at http://192.168.64.2:30001.

## Delete deployment from Local Kubernetes
You can remove the service and deployment via
```shell script
npm run kube:delete
```

