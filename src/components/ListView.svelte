<script lang="ts">
  import ListItem from "./ListItem.svelte"

  let newItem = ""

  let todoList = [
    { text: "Write my first post", status: true },
    { text: "Upload the post to the blog", status: false },
    { text: "Publish the post at Facebook", status: false }
  ]

  function addToList() {
    todoList = [...todoList, { text: newItem, status: false }]
    newItem = ""
  }

  function removeFromList(index) {
    todoList.splice(index, 1)
    todoList = todoList
  }
</script>

<main class="p-4">
  <ListItem />
  <ListItem />
  <ListItem />
  <ListItem />
  <ListItem />
  <ListItem />
  <ListItem />
  <ListItem />
  <ListItem />
</main>
