import React from 'react';
import { render } from '@testing-library/react';
import HelloAg from '.';

test('renders heading', () => {
  const { getByTestId } = render(<HelloAg />);
  expect(getByTestId('hello-ag')).toBeInTheDocument();
});
