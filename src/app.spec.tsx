import React from 'react';
import { render, wait } from '@testing-library/react';
import App from './app';

test('renders loading state prior to resolving route', () => {
  const { getByTestId } = render(<App />);
  expect(getByTestId('loading')).toBeInTheDocument();
});

test('renders route component once resolved', async () => {
  const { getByTestId } = render(<App />);
  await wait();
  expect(getByTestId('hello-ag')).toBeInTheDocument();
});
