<script lang="ts">
  import { supabase } from "../lib/supabaseClient"

  export let todo: {
    task: string
    id: number
    is_complete: boolean
    task_value: number
    estimated_time: number
  }
  export let onDelete = () => {}

  let isCompleted = todo.is_complete

  const toggle = async () => {
    try {
      const { data, error } = await supabase
        .from("todos")
        .update({ is_complete: !isCompleted })
        .eq("id", todo.id)
        .select("is_complete")
        .single()
      if (error) {
        throw error
      }
      isCompleted = data.is_complete
    } catch (error) {
      console.log("error", error)
    }
  }
</script>

<li class="collapse collapse-arrow join-item border border-base-300">
  <input type="radio" name="accordionTask" />
  <div
    class="collapse-title text-sm font-medium grid grid-cols-[0.65fr_0.35fr] justify-between items-center gap-4"
  >
    <p class="truncate flex-shrink">{todo.task}</p>
    <div class="flex flex-row justify-between gap-4">
      <p>Est.(h): {todo.estimated_time}</p>
      <p>Value: {todo.task_value}</p>
    </div>
  </div>
  <div class="collapse-content flex justify-between items-center gap-4">
    <p>{todo.task}</p>
    <div>
      <input
        class="cursor-pointer"
        type="checkbox"
        on:change={toggle}
        bind:checked={isCompleted}
      />
    </div>
    <button on:click={onDelete}>
      <ion-icon
        name="close-outline"
        class="w-4 h-4 border-2 hover:border-black rounded"
      />
    </button>
  </div>
</li>
