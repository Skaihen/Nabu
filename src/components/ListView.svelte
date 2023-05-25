<script lang="ts">
  import ListItem from "./ListItem.svelte"

  let newItem = ""

  let taskList = [
    { text: "Write my first post", status: true },
    { text: "Upload the post to the blog", status: false },
    { text: "Publish the post at Facebook", status: false }
  ]

  function addToList() {
    taskList = [...taskList, { text: newItem, status: false }]
    newItem = ""
  }

  function removeFromList(index: number) {
    taskList.splice(index, 1)
    taskList = taskList
  }
</script>

<main class="p-4">
  <div class="flex gap-2 mb-4">
    <input
      bind:value={newItem}
      type="text"
      placeholder="New task..."
      class="input"
    />
    <button on:click={addToList} class="btn">Add</button>
  </div>

  {#each taskList as item, index}
    <button
      on:click={() => removeFromList(index)}
      class="btn btn-ghost btn-sm btn-square">❌</button
    >
    <ListItem
      text={item.text}
      isCompleted={item.status}
      onClick={() => {
        item.status = !item.status
      }}
    />
  {/each}
</main>
