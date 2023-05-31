<script lang="ts">
  import type { AuthSession } from "@supabase/supabase-js"
  import { onMount } from "svelte"
  import Auth from "./components/Auth.svelte"
  import Home from "./components/Home.svelte"
  import Navbar from "./components/Navbar.svelte"
  import { supabase } from "./lib/supabaseClient"

  let session: AuthSession | null

  onMount(() => {
    supabase.auth.getSession().then(({ data }) => {
      session = data.session
    })

    supabase.auth.onAuthStateChange((_event, _session) => {
      session = _session
    })
  })
</script>

{#if !session}
  <Auth />
{:else}
  <Navbar />
  <Home bind:session />
{/if}
