import React, { Suspense, lazy } from 'react';
import { BrowserRouter as Router, Route, Switch } from 'react-router-dom';

const HelloAg = lazy(() => import('./routes/hello-ag'));

const App = () => (
  <Router>
    <Suspense fallback={<div data-testid="loading">Loading...</div>}>
      <Switch>
        <Route exact path="/" component={HelloAg} />
      </Switch>
    </Suspense>
  </Router>
);

export default App;
