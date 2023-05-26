<script lang="ts">
  export let text: string
  export let isCompleted: boolean
  export let onCardClick: () => void
</script>

<button
  on:click={onCardClick}
  class:isCompletedElement={isCompleted}
  class="btn btn-block card h-auto mb-4 shadow-xl rounded-md relative inline-flex items-center justify-start overflow-hidden font-medium transition-all bg-red-500 group
  element"
>
  <span
    class="absolute top-0 right-0 inline-block w-4 h-4 transition-all duration-300 delay-100 ease-in-out bg-accent-focus rounded-sm group-hover:-mr-4 group-hover:-mt-4"
  >
    <span
      class="absolute top-0 right-0 w-5 h-5 rotate-45 translate-x-1/2 -translate-y-1/2 bg-accent-content"
    />
  </span>
  <span
    class="relative w-full text-left text-white transition-colors duration-200 ease-in-out group-hover:text-white"
  >
    <div class="card-body px-4 py-3 w-full">
      <p class="card-actions justify-end">Valor: X</p>
      <h1 class:isCompleted class="card-title">{text}</h1>
      <p class="card-actions justify-end">Est: X</p>
    </div></span
  >
</button>

<style>
  .isCompleted {
    text-decoration: line-through;
  }
  .element {
    background-image: linear-gradient(
      45deg,
      hsl(var(--af)) 50%,
      hsl(var(--a)) 50%
    );
    background-size: 250% 100%;
    background-position: right bottom;
    transition: background-position 0.3s ease;
  }
  .element:hover {
    background-position: left top;
  }

  .isCompletedElement {
    background-image: linear-gradient(
      45deg,
      hsl(var(--af)) 50%,
      hsl(var(--b1)) 50%
    );
  }
</style>
