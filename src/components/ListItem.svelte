<script lang="ts">
  let isCompleted: boolean = false
</script>

<button
  class:glass={!isCompleted}
  class:isCompleted
  on:click={() => (isCompleted = !isCompleted)}
  class="btn btn-block card bg-base-200 h-auto mb-4 shadow-xl rounded-md"
>
  <div class="card-body px-4 py-0 w-full">
    <p class="card-actions justify-end text-lg">Valor: X</p>
    <h1 class="card-title">Card title!</h1>
    <p class="card-actions justify-end text-lg">Est: X</p>
  </div>
</button>

<style>
  .isCompleted {
    text-decoration: line-through;
  }
</style>
