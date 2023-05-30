<script lang="ts">
  import type { User } from "@supabase/supabase-js"
  import TodoList from "./TodoList.svelte"

  export let user: User
</script>

<div
  class="w-full h-full flex flex-col justify-center items-center p-4"
  style="min-width: 250px; max-width: 600px; margin: auto;"
>
  <TodoList {user} />
</div>
