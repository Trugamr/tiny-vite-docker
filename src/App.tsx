import { useState } from "react";

export default function App() {
  const [count, setCount] = useState(0);

  return (
    <main>
      <pre>hello 👋</pre>
      <pre>count: {count}</pre>
      <div>
        <button
          onClick={() => {
            setCount((prev) => prev - 1);
          }}
        >
          -
        </button>
        <button
          onClick={() => {
            setCount((prev) => prev + 1);
          }}
        >
          +
        </button>
      </div>
    </main>
  );
}
