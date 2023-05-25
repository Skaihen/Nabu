<script lang="ts">
  export let text: string
  export let isCompleted: boolean
  export let onClick: () => void
</script>

<button
  class:btn-primary={!isCompleted}
  on:click={onClick}
  class="btn btn-block card bg-base-200 h-auto mb-4 shadow-xl rounded-md"
>
  <div class="card-body px-4 py-0 w-full">
    <p class="card-actions justify-end text-lg">Valor: X</p>
    <h1 class:isCompleted class="card-title">{text}</h1>
    <p class="card-actions justify-end text-lg">Est: X</p>
  </div>
</button>

<button
  class="relative inline-flex items-center justify-start px-6 py-3 overflow-hidden font-medium transition-all bg-red-500 rounded-md group"
>
  <span
    class="absolute top-0 right-0 inline-block w-4 h-4 transition-all duration-500 ease-in-out bg-red-700 rounded group-hover:-mr-4 group-hover:-mt-4"
  >
    <span
      class="absolute top-0 right-0 w-5 h-5 rotate-45 translate-x-1/2 -translate-y-1/2 bg-white"
    />
  </span>
  <span
    class="absolute bottom-0 left-0 w-full h-full transition-all duration-500 ease-in-out delay-200 -translate-x-full translate-y-full bg-red-600 rounded-md group-hover:mb-12 group-hover:translate-x-0"
  />
  <span
    class="relative w-full text-left text-white transition-colors duration-200 ease-in-out group-hover:text-white"
    >Button Text</span
  >
</button>

<style>
  .isCompleted {
    text-decoration: line-through;
  }
</style>
