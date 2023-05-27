<script lang="ts">
  import type { AuthSession } from "@supabase/supabase-js"
  import { onMount } from "svelte"
  import Account from "./components/Account.svelte"
  import Auth from "./components/Auth/Auth.svelte"
  import { supabase } from "./lib/supabaseClient"

  let session: AuthSession

  onMount(() => {
    supabase.auth.getSession().then(({ data }) => {
      if (data.session) {
        session = data.session
      }
    })

    supabase.auth.onAuthStateChange((_event, _session) => {
      if (_session) {
        session = _session
      }
    })
  })
</script>

{#if !session}
  <Auth />
{:else}
  <div>
    <Account {session} />
    <!-- <Navbar />
    <ListView /> -->
  </div>
{/if}
