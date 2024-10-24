import fetch from 'node-fetch';

test('hello-world function returns correct response', async () => {
  const response = await fetch('http://localhost:54321/functions/v1/hello-world', {
    method: 'POST',
    headers: { 'Content-Type': 'application/json' },
    body: JSON.stringify({ name: 'Paulo' }),
  });
  const data = await response.json();
  expect(data.message).toBe('Hello Paulo!');
});
