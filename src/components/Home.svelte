<script lang="ts">
  import type { AuthSession } from "@supabase/supabase-js"
  import { onMount } from "svelte"
  import { supabase } from "../lib/supabaseClient"
  import Alert from "./Alert.svelte"
  import Todo from "./Todo.svelte"

  export let session: AuthSession

  let errorText: string = ""
  let todos: any = []
  let newTaskText: string = ""
  let taskValue: number = 1
  let estimatedTime: number = 1
  let loading: boolean = false

  onMount(() => {
    fetchTodos()
  })

  const fetchTodos = async () => {
    try {
      loading = true
      let { data, error } = await supabase
        .from("todos")
        .select("*")
        .eq("user_id", session.user.id)
        .order("task_value", { ascending: false })

      if (error) throw error

      todos = data
    } catch (error) {
      if (error instanceof Error) {
        errorText = error.message
      }
    } finally {
      loading = false
    }
  }

  const addTodo = async (
    taskText: string,
    estimatedTime: number,
    taskValue: number
  ) => {
    try {
      loading = true
      let task = taskText.trim()
      if (task.length) {
        let { data, error } = await supabase
          .from("todos")
          .insert({
            user_id: session.user.id,
            task,
            estimated_time: estimatedTime,
            task_value: taskValue
          })
          .select()
          .single()

        if (error) throw error

        todos = [...todos, data]
      }
    } catch (error) {
      if (error instanceof Error) {
        errorText = error.message
      }
    } finally {
      newTaskText = ""
      estimatedTime = 1
      taskValue = 1
      loading = false
    }
  }

  const deleteTodo = async (id: number) => {
    try {
      loading = true
      await supabase.from("todos").delete().eq("id", id)
      todos = todos.filter((x: any) => x.id != id)
    } catch (error) {
      if (error instanceof Error) {
        errorText = error.message
      }
    } finally {
      loading = false
    }
  }
</script>

<div
  class="w-full h-full flex flex-col justify-center items-center p-4 m-auto max-w-4xl"
>
  <div class="w-full">
    <form
      on:submit|preventDefault={() =>
        addTodo(newTaskText, estimatedTime, taskValue)}
      class="grid grid-cols-[5fr_2fr_2fr_1fr] items-end gap-2 my-2"
    >
      <div class="form-control w-full">
        <label for="newTaskText" class="label pb-1">
          <span class="label-text">Task</span>
        </label>
        <input
          bind:value={newTaskText}
          id="newTaskText"
          class="input input-bordered w-full"
          type="text"
          placeholder="Make coffee"
          required
        />
      </div>

      <div class="form-control w-full">
        <label for="estimatedTime" class="label pb-1">
          <span class="label-text">Estimated (hours)</span>
        </label>
        <input
          bind:value={estimatedTime}
          id="estimatedTime"
          class="input input-bordered w-full"
          type="number"
          min="1"
          max="9999"
          placeholder="Estimated Time (hours)"
          required
        />
      </div>

      <div class="form-control w-full">
        <label for="taskValue" class="label pb-1">
          <span class="label-text">Task Value</span>
        </label>
        <input
          bind:value={taskValue}
          id="taskValue"
          class="input input-bordered w-full"
          type="number"
          min="1"
          max="9999"
          placeholder="Task Value"
          required
        />
      </div>

      <button type="submit" class="btn">
        {#if loading}
          <span class="loading loading-spinner" />
        {:else}
          Add
        {/if}
      </button>
    </form>
    {#if errorText}
      <Alert text={errorText} />
    {/if}

    <ul class="join join-vertical w-full shadow overflow-hidden rounded-md">
      {#each todos as todo (todo.id)}
        <Todo {todo} onDelete={() => deleteTodo(todo.id)} />
      {/each}
    </ul>
  </div>
</div>
