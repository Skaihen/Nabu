<script lang="ts">
  import type { User } from "@supabase/supabase-js"
  import { onMount } from "svelte"
  import Auth from "./components/Auth.svelte"
  import Home from "./components/Home.svelte"
  import Navbar from "./components/Navbar.svelte"
  import { supabase } from "./lib/supabaseClient"

  let user: User | null

  onMount(() => {
    supabase.auth.getSession().then(({ data: { session } }) => {
      user = session?.user ?? null
    })

    const {
      data: { subscription: authListener }
    } = supabase.auth.onAuthStateChange((_, session) => {
      const currentUser = session?.user
      user = currentUser ?? null
    })

    return () => {
      authListener?.unsubscribe()
    }
  })
</script>

{#if user}
  <Navbar />
  <Home bind:user />
{:else}
  <Auth />
{/if}
