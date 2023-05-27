<script lang="ts">
  export let hidden = true
</script>

<div
  class:hidden
  class="absolute bottom-0 flex w-full justify-center py-4 px-4 sm:px-6 lg:px-8"
>
  <div class="alert alert-error shadow-lg">
    <div>
      <ion-icon
        name="close-circle-outline"
        class="stroke-current flex-shrink-0 h-6 w-6"
      />
      <span>Error! Unsupported one time password type.</span>
    </div>
  </div>
</div>
