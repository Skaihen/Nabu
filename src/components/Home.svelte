<script lang="ts">
  import type { AuthSession } from "@supabase/supabase-js"
  import { onMount } from "svelte"
  import { supabase } from "../lib/supabaseClient"
  import Alert from "./Alert.svelte"
  import Todo from "./Todo.svelte"

  export let session: AuthSession

  let errorText = ""
  let todos: any = []
  let newTaskText = ""
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
        .order("id", { ascending: true })

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

  const addTodo = async (taskText: string) => {
    try {
      loading = true
      let task = taskText.trim()
      if (task.length) {
        newTaskText = ""
        let { data, error } = await supabase
          .from("todos")
          .insert({ task, user_id: session.user.id })
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
  class="w-full h-full flex flex-col justify-center items-center p-4"
  style="min-width: 250px; max-width: 600px; margin: auto;"
>
  <div class="w-full">
    <form
      on:submit|preventDefault={() => addTodo(newTaskText)}
      class="flex gap-2 my-2"
    >
      <input
        class="rounded w-full p-2"
        type="text"
        placeholder="make coffee"
        bind:value={newTaskText}
      />
      <button type="submit" class:loading class="btn"> Add </button>
    </form>
    {#if errorText}
      <Alert text={errorText} />
    {/if}
    <div class="bg-white shadow overflow-hidden rounded-md">
      <ul>
        {#each todos as todo (todo.id)}
          <Todo {todo} onDelete={() => deleteTodo(todo.id)} />
        {/each}
      </ul>
    </div>
  </div>
</div>
