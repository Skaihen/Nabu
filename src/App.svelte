<script lang="ts">
  import type { User } from "@supabase/supabase-js"
  import { onMount } from "svelte"
  import Auth from "./components/Auth/Auth.svelte"
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
  <!--   <div>
    <Navbar />
    <Home bind:user />
  </div> -->
{:else}
  <Auth />
{/if}
